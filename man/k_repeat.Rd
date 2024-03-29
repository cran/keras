% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_repeat}
\alias{k_repeat}
\title{Repeats a 2D tensor.}
\usage{
k_repeat(x, n)
}
\arguments{
\item{x}{Tensor or variable.}

\item{n}{Integer, number of times to repeat.}
}
\value{
A tensor
}
\description{
If x has shape (samples, dim) and n is 2, the output will have shape
(samples, 2, dim).
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://tensorflow.rstudio.com/reference/keras/index.html#backend}.
}

