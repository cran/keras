% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_elu}
\alias{k_elu}
\title{Exponential linear unit.}
\usage{
k_elu(x, alpha = 1)
}
\arguments{
\item{x}{A tensor or variable to compute the activation function for.}

\item{alpha}{A scalar, slope of negative section.}
}
\value{
A tensor.
}
\description{
Exponential linear unit.
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://tensorflow.rstudio.com/reference/keras/index.html#backend}.
}

