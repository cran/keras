% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{is_keras_available}
\alias{is_keras_available}
\title{Check if Keras is Available}
\usage{
is_keras_available(version = NULL)
}
\arguments{
\item{version}{Minimum required version of Keras (defaults to \code{NULL}, no
required version).}
}
\value{
Logical indicating whether Keras (or the specified minimum version of
Keras) is available.
}
\description{
Probe to see whether the Keras Python package is available in the current
system environment.
}
\examples{
\dontrun{
# testthat utilty for skipping tests when Keras isn't available
skip_if_no_keras <- function(version = NULL) {
  if (!is_keras_available(version))
    skip("Required keras version not available for testing")
}

# use the function within a test
test_that("keras function works correctly", {
  skip_if_no_keras()
  # test code here
})
}

}
