% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/learning_rate_schedules.R
\name{learning_rate_schedule_polynomial_decay}
\alias{learning_rate_schedule_polynomial_decay}
\title{A LearningRateSchedule that uses a polynomial decay schedule}
\usage{
learning_rate_schedule_polynomial_decay(
  initial_learning_rate,
  decay_steps,
  end_learning_rate = 1e-04,
  power = 1,
  cycle = FALSE,
  ...,
  name = NULL
)
}
\arguments{
\item{initial_learning_rate}{A scalar \code{float32} or \code{float64} \code{Tensor} or an
R number.  The initial learning rate.}

\item{decay_steps}{A scalar \code{int32} or \code{int64} \code{Tensor} or an R number.
Must be positive.  See the decay computation above.}

\item{end_learning_rate}{A scalar \code{float32} or \code{float64} \code{Tensor} or an
R number.  The minimal end learning rate.}

\item{power}{A scalar \code{float32} or \code{float64} \code{Tensor} or an R number.
The power of the polynomial. Defaults to linear, 1.0.}

\item{cycle}{A boolean,
whether or not it should cycle beyond decay_steps.}

\item{...}{For backwards and forwards compatibility}

\item{name}{String.  Optional name of the operation. Defaults to
'PolynomialDecay'.}
}
\description{
A LearningRateSchedule that uses a polynomial decay schedule
}
\details{
It is commonly observed that a monotonically decreasing learning rate, whose
degree of change is carefully chosen, results in a better performing model.
This schedule applies a polynomial decay function to an optimizer step,
given a provided \code{initial_learning_rate}, to reach an \code{end_learning_rate}
in the given \code{decay_steps}.

It requires a \code{step} value to compute the decayed learning rate. You
can just pass a TensorFlow variable that you increment at each training
step.

The schedule is a 1-arg callable that produces a decayed learning rate
when passed the current optimizer step. This can be useful for changing the
learning rate value across different invocations of optimizer functions.
It is computed as:

\if{html}{\out{<div class="sourceCode R">}}\preformatted{decayed_learning_rate <- function(step) \{
  step <- min(step, decay_steps)
  ((initial_learning_rate - end_learning_rate) *
      (1 - step / decay_steps) ^ (power)
    ) + end_learning_rate
\}
}\if{html}{\out{</div>}}

If \code{cycle} is \code{TRUE} then a multiple of \code{decay_steps} is used, the first one
that is bigger than \code{step}.

\if{html}{\out{<div class="sourceCode python">}}\preformatted{decayed_learning_rate <- function(step) \{
  decay_steps <- decay_steps * ceiling(step / decay_steps)
  ((initial_learning_rate - end_learning_rate) *
      (1 - step / decay_steps) ^ (power)
    ) + end_learning_rate
\}
}\if{html}{\out{</div>}}

You can pass this schedule directly into a keras Optimizer
as the \code{learning_rate}.

Example: Fit a model while decaying from 0.1 to 0.01 in 10000 steps using
sqrt (i.e. power=0.5):

\if{html}{\out{<div class="sourceCode R">}}\preformatted{...
starter_learning_rate <- 0.1
end_learning_rate <- 0.01
decay_steps <- 10000
learning_rate_fn <- learning_rate_schedule_polynomial_decay(
  starter_learning_rate, decay_steps, end_learning_rate, power = 0.5)

model \%>\%
  compile(optimizer = optimizer_sgd(learning_rate = learning_rate_fn),
          loss = 'sparse_categorical_crossentropy',
          metrics = 'accuracy')

model \%>\% fit(data, labels, epochs = 5)
}\if{html}{\out{</div>}}
}
\seealso{
\itemize{
\item \url{https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/schedules/PolynomialDecay}
}
}
