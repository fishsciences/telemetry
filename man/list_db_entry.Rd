% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list_api.R
\name{list_db_entry}
\alias{list_db_entry}
\title{List DB entry}
\usage{
list_db_entry(
  entry,
  additionalID = NA,
  session,
  token = session$unToken,
  curl_handle = session$curl,
  api_baseurl = session$base_url,
  end_point = "/api/list/",
  api_url = paste0(api_baseurl, end_point),
  ...
)
}
\arguments{
\item{entry}{character, one of affiliations, batches, projects, networks, orgs, species, antenna}

\item{additionalID}{optional, for end-points that require an additional identifier}

\item{session}{list, an object created by \code{start_session()}}

\item{token}{the token for the session}

\item{curl_handle}{curl handle for making requests}

\item{api_baseurl}{character, the base URL for the database}

\item{end_point}{character, the suffix for the end-point being queried}

\item{api_url}{character, the full url for the end-point}

\item{...}{additional arguments passed to \code{getURL()}}
}
\value{
data.frame of the available categories for each request
}
\description{
A generic function for accessing all /api/list/* end-points.
}
\author{
Matt Espe
}
