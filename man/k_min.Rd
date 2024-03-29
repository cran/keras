% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_min}
\alias{k_min}
\title{Minimum value in a tensor.}
\usage{
k_min(x, axis = NULL, keepdims = FALSE)
}
\arguments{
\item{x}{A tensor or variable.}

\item{axis}{An integer, axis to find minimum values (axis indexes are
1-based).}

\item{keepdims}{A boolean, whether to keep the dimensions or not. If
\code{keepdims} is \code{FALSE}, the rank of the tensor is reduced by 1. If
\code{keepdims} is \code{TRUE}, the reduced dimension is retained with length 1.}
}
\value{
A tensor with miminum values of \code{x}.
}
\description{
Minimum value in a tensor.
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://tensorflow.rstudio.com/reference/keras/index.html#backend}.
}

