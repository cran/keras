% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_gradients}
\alias{k_gradients}
\title{Returns the gradients of \code{variables} w.r.t. \code{loss}.}
\usage{
k_gradients(loss, variables)
}
\arguments{
\item{loss}{Scalar tensor to minimize.}

\item{variables}{List of variables.}
}
\value{
A gradients tensor.
}
\description{
Returns the gradients of \code{variables} w.r.t. \code{loss}.
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://tensorflow.rstudio.com/reference/keras/index.html#backend}.
}

