% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fan_functions.R
\name{make_filename}
\alias{make_filename}
\title{make_filename}
\usage{
make_filename(years)
}
\arguments{
\item{years}{The year to append to the 'accident_' prefix}
}
\value{
A string containing the prefix 'accident_' followed by the given year
}
\description{
A function returns a filename with the prefix 'accident_' followed by a given year
}
\note{
If the value provided for the year parameter is not of type integer, the function will attempt to coerce it into a value of type integer, and if it cannot do so, an error fill be thrown
}
\examples{
filename <- make_filename(2015)

}
