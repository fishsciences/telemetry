% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/payloads.R
\name{create_payload}
\alias{create_payload}
\title{Create API Data Payload}
\usage{
create_payload(end_pt, ...)
}
\arguments{
\item{end_pt}{character, the name of the API end point to create a payload for}

\item{...}{key = value pairs for creating the JSON payload}
}
\value{
list
}
\description{
This function creates a nested list in the correct structure to be
converted to JSON and delivered to the API
}
\details{
For /api/create/network and /api/create/batch, the antenna and tag
data must first be coerced into the proper format via
\code{create_antenna_data()} and \code{create_batch_tag_data()},
respectively.
}
\author{
Matt Espe
}
