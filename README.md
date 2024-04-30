# Telemetry package for R

  <!-- badges: start -->
  [![R-CMD-check](https://github.com/fishsciences/telemetry/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/fishsciences/telemetry/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->

A package for crafting API requests to the telemetry database API.


## Package Design and Philosophy

The `telemetry` package is a utility for crafting valid API requests
for the telemetry database from R. It handles:

  - login and session management
  - creating POST requests to the API
  - converting input data from R into JSON data payloads, 
  - marshalling JSON responses from the API into R data structures.
  
Importantly, the `telemetry` package is designed to be flexible while
also providing moderate user convienence.

### Login and Session Management

A session for the API is started via the `start_session()` function,

```{r}
my_session = start_session(uname = "My Name",
                           pwd = "my_password",
                           api_baseurl = "some_url")
```

The returned object (`my_session` in this case) is an R list with
identifying information about the newly created session, including
base URL and the unique token assigned for this login. This unique
token is required for every subsequent interaction with the API.

Multiple sessions can be started simultaneously for the same user, as
can multiple simultaneous sessions for different users. Each unique
session is identified by the unique token for that session. 

*A note on the `api_baseurl` parameter:* To be flexible, this can be any
valid URL, include one local to the user's machine
(e.g. `localhost:`). The functions in the `telemetry` package will
extract the URL from the session object to automatically submit
requests to the URL for that session. This is useful in cases where
e.g. you might want to test two sessions simultaenously, one for a
locally running database API and another for a web-hosted API.

By default, a single session's unique token will be valid for 30
min. Each interaction with the API will refresh a token for another 30
min. A session can be ended manually via the `end_session()` function.

### Downloading Data

Existing data in the database is downloaded via the `download_data()`
function. This function takes two optional arguments, `region` and
`speciesID`. If omitted, all data the user has access to will be
downloaded, including registrations for tagID's not in the
database. When `region` is specified, only detections for antennas in
the specified region are returned. When `speciesID` is provided, only
tags of that species are returned. *Important* - tagIDs not in the
database will have an unknown species, hence are not returned when
`speciesID` is provided.

The downloaded data takes the form of a complete SQLite database,
subset according to the above. If the `db_file()` is not provided,
this is saved to a `tempfile()`. The file path to the saved database
is returned.

For convenience, all tables from this SQLite database can be extracted
into R `data.frames` with `extract_data()` - by default these tables
are extracted into a separate environment that is returned by the
function

```{r}
fish_db = download_data(my_session, ...)

fish_data = extract_data(fish_db)
```

In this example, `fish_data` is an environment and the tables within
can be accessed via the `$` operator.

```{r}
fish_data$Tags
```

Documentation on the database can be found
[here](https://fishsciences.github.io/telemetry/articles/database.html).

### Sending API Requests

All API requests are submitted via the `send_api_request()`
function. This function takes a session object and then a set of `key
= value` pairs. These `key = value` pairs are marshalled to JSON in
the format expected by the API. By design, the `telemetry` package
mirrors the API itself. The keys must match the expected values for
each API endpoint - any extra keys are ignored. The `values` must also
match the expected data type for the API end point specified. In cases
where the `value` is a complex data structure (e.g. a data.frame or
array), it will be marshalled to JSON prior to submission.


## Bug Reports

Please submit bug reports via github Issues.
