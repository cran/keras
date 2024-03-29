% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_reverse}
\alias{k_reverse}
\title{Reverse a tensor along the specified axes.}
\usage{
k_reverse(x, axes)
}
\arguments{
\item{x}{Tensor to reverse.}

\item{axes}{Integer or list of integers of axes to reverse (axis indexes are
1-based).}
}
\value{
A tensor.
}
\description{
Reverse a tensor along the specified axes.
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://tensorflow.rstudio.com/reference/keras/index.html#backend}.
}

