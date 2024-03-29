% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_ctc_decode}
\alias{k_ctc_decode}
\title{Decodes the output of a softmax.}
\usage{
k_ctc_decode(
  y_pred,
  input_length,
  greedy = TRUE,
  beam_width = 100L,
  top_paths = 1
)
}
\arguments{
\item{y_pred}{tensor \verb{(samples, time_steps, num_categories)} containing the
prediction, or output of the softmax.}

\item{input_length}{tensor \verb{(samples, )} containing the sequence length for
each batch item in \code{y_pred}.}

\item{greedy}{perform much faster best-path search if \code{TRUE}. This does not
use a dictionary.}

\item{beam_width}{if \code{greedy} is \code{FALSE}: a beam search decoder will be used
with a beam of this width.}

\item{top_paths}{if \code{greedy} is \code{FALSE}, how many of the most probable paths
will be returned.}
}
\value{
If \code{greedy} is \code{TRUE}, returns a list of one element
that contains the decoded sequence. If \code{FALSE}, returns the \code{top_paths}
most probable decoded sequences. Important: blank labels are returned as
\code{-1}. Tensor \code{(top_paths)} that contains the log probability of each
decoded sequence.
}
\description{
Can use either greedy search (also known as best path) or a constrained
dictionary search.
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://tensorflow.rstudio.com/reference/keras/index.html#backend}.
}

