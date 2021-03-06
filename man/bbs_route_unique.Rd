% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bbs_route_unique.R
\name{bbs_route_unique}
\alias{bbs_route_unique}
\title{Identify survey-wide unique BBS routes from a BBS table}
\usage{
bbs_route_unique(df)
}
\arguments{
\item{df}{A \code{data.frame} created by a \code{bbs_*} function that
includes columns \code{country_num}, \code{state_num}, and \code{route}.}
}
\value{
An integer vector identifying unique routes survey-wide.
}
\description{
The \code{route} column in a variety of BBS tables only identifies unique
routes within states. This function creates route identifiers that are unique
survey-wide by pasting together columns \code{country_num}, \code{state_num},
and \code{route} (after first adding leading zeros to ensure a constant
number of digits for each component column).
}
\details{
Before the component columns are pasted together and reconverted to an
integer, leading zeros are added, where necessary, to ensure constant columns
widths (and therefore unique final codes). The number of digits for each
component column is:
 - \code{country_num}: 3 digits
 - \code{state_num}: 2 digits
 - \code{route}: 3 digits
}
\examples{
\dontrun{

# load the metadata table 'weather'
weather <- bbs_meta_weather(bbs_dir = ".")

# add a column identifying unique routes
weather$route_unique <- bbs_route_unique(weather)
}

}
\references{
Pardieck, K.L., D.J. Ziolkowski Jr., M. Lutmerding and M.-A.R.
  Hudson. 2018. North American Breeding Bird Survey Dataset 1966-2017,
  version 2017.0. U.S. Geological Survey, Patuxent Wildlife Research Center.
  \url{https://doi.org/10.5066/F76972V8}
}
\author{
Bob O'Hara

Patrick Barks <patrick.barks@gmail.com>
}
