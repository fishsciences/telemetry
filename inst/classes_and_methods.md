# Notes on the design of the telemetry package

These are some basic notes on how and why the telemetry package was
designed the way it was. These are mostly intended for the package
authors, but are included here incase it is of interest to anyone
else.

## Motivation

Telemetry data from riverine systems typically has similar structure,
and the steps needed to get it analysis-ready are likewise
similar. Rather than having each project use one-off or sub-optimal
code to get the data from it's raw state to its analysis-ready state,
we looked to have a unifed framework. 

One of the biggest motivations is to be able to take data from various
differnet systems (e.g. different tag manufacterors, array setups,
etc.), and be able to use the same basic functions. 

## Package design 

To accomplish this, we need to be able to convert data from various
sources into a unifed data structure (the `telemetry` class). The
details for how to convert each raw data type to this unifed structure
can be accomplished via specialized functions.

Once in the `telemetry` class, the functions for QA/QC and
verification can be used wihtout worrying about:

  + divergent data structures, including variations in naming
    conventions for the columns in a table 
	
  + incomplete/missing data
  
  + differences in data formatting (e.g. `NA` values, datetime values,
    etc.)
	
### The `telemetry` class

Central to this effort is the `telemetry` class. Telemetry data for
riverine deployments typically have the following tables:

  + detections: raw detections from a receiver or set of
    receivers. May or may not be cleaned to exclude tags from other
    studies, etc. These constitute a timeseries, where there is a
    datetime of the detection, the tag transmitting, and the receiver
    which received the transmission. 
	
  + tagging: details about the fish and the tags. This table links the
    TagID in the detections to a specific fish. 
		
  + deployments: meta-data study, including details about the
    receivers. This may or may not include data about which receivers
    were placed in the same general area and might be considered a
    single location. *This table might be optional?*
	
A `telemetry` object contains each of these pieces of information into
a single R object. This allows us to:

1. keep all the data objects related to eachother bundled together

1. pass all required tables into functions in a single opbject

1. keep track of meta-data, such as if the data have been QA/QC-ed

Thus, an object of class `telemetry` consists of:

  + detections table: data.frame
    - TagID: character
	- CodeSpace (optional - only acoustic tags): character
	- ReceiverID: character
	- datetime: POSIXct
  + tagging table: data.frame
    - TagID: character
	- TagType: character, restricted to known tag types
	- (other meta data): unrestricted\*
  + deployments table (optional): data.frame
    - receiverID: character
	- Receiver groups: character
  + QA/QC meta data
    - what stages of QA/QC have been completed: list?
	- is the data "analysis-ready" (defined below?): logical
	- issues that need to be investigated by hand/eye: data.frame
  + meta data
    - original imported files: character
	- version of `pkg:telemetry` used: character
	- others?

\* Upon creation of the class, most of the data fields will be checked
for naming and type consistency. However, these additional meta data
will be free-form and can take whatever form the user wants. 

#### QA/QC taken at `telemetry` object creation

The following steps will be taken when the `telemetry` object is
created, as they will lead to invalid data (i.e. if the goal is a
`telemetry` object consists of data from a certain experiment, it
cannot by definition contain other data):

  + Filter tag detections to only include tag identification numbers
    in tagging table  	
	
  + Check that all dates and times recorded in the study’s detections
    are valid relative to the tagging dates of the fish involved and
    the study period
	
  + Check that each detection has a ‘home”, i.e. fits within a
    deployment period of at least one receiver (get_stations()
    function in ybt) 
	
Violations of these will require the user to correct before coercing
the data to the `telemetry` class. We will provide functions to assist
in finding these issues.

The advantage of this is that any valid `telemetry` object is ensured
to conform to the above criteria. This significantly reduces the
mental overhead in tracking QA/QC status.

### Methods

Once in the `telemetry` class, the following methods will be
available:

#### QA/QC functions:

These steps do not invalidate a `telemetry` object, and therefore are
taken after the object has been created. 

  + Group receivers

  + Add a “release detection” for each fish ? Requires tagging table

  + Predator detection scan, if applicable – check for irregular
	detection patterns indicating individual predation events, and flag
	those detections for further analysis. 
  
  + Final false detection screen, including checking that no fish has
    recorded simultaneous detections at different locations

  + tag_tales? other data-collapsing/augmenting functions
  
After each of these has been conducted on the `telemetry` object, the
appropriate meta data will be set, recording the status in the object
itself. This will eliminate guessing which steps have been taken. 

#### Summary functions:

  + Number of fish in each release group, number of fish detected
  
  + Summarize number of at each receiver

#### Plotting functions:

#### Misc functions:

  + check/report/summarize QA/QC status
  
  + extract tables
  
  + assign to tables: e.g. `<-`, `[`, `$` methods
  
  + toggle/add meta data

#### Modeling functions: (other package)

	
