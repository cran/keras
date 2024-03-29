% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_batch_get_value}
\alias{k_batch_get_value}
\title{Returns the value of more than one tensor variable.}
\usage{
k_batch_get_value(ops)
}
\arguments{
\item{ops}{List of ops to evaluate.}
}
\value{
A list of arrays.
}
\description{
Returns the value of more than one tensor variable.
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://tensorflow.rstudio.com/reference/keras/index.html#backend}.
}

\seealso{
\code{\link[=k_batch_set_value]{k_batch_set_value()}}
}
