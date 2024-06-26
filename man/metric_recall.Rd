% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/metrics.R
\name{metric_recall}
\alias{metric_recall}
\title{Computes the recall of the predictions with respect to the labels}
\usage{
metric_recall(
  ...,
  thresholds = NULL,
  top_k = NULL,
  class_id = NULL,
  name = NULL,
  dtype = NULL
)
}
\arguments{
\item{...}{Passed on to the underlying metric. Used for forwards and backwards compatibility.}

\item{thresholds}{(Optional) A float value or a list of float
threshold values in \verb{[0, 1]}. A threshold is compared with prediction values
to determine the truth value of predictions (i.e., above the threshold is
\code{true}, below is \code{false}). One metric value is generated for each threshold
value. If neither thresholds nor top_k are set, the default is to calculate
recall with \code{thresholds=0.5}.}

\item{top_k}{(Optional) Unset by default. An int value specifying the top-k
predictions to consider when calculating recall.}

\item{class_id}{(Optional) Integer class ID for which we want binary metrics.
This must be in the half-open interval \verb{[0, num_classes)}, where
\code{num_classes} is the last dimension of predictions.}

\item{name}{(Optional) string name of the metric instance.}

\item{dtype}{(Optional) data type of the metric result.}
}
\value{
A (subclassed) \code{Metric} instance that can be passed directly to
\code{compile(metrics = )}, or used as a standalone object. See \code{?Metric} for
example usage.
}
\description{
Computes the recall of the predictions with respect to the labels
}
\details{
This metric creates two local variables, \code{true_positives} and
\code{false_negatives}, that are used to compute the recall. This value is
ultimately returned as \code{recall}, an idempotent operation that simply divides
\code{true_positives} by the sum of \code{true_positives} and \code{false_negatives}.

If \code{sample_weight} is \code{NULL}, weights default to 1. Use \code{sample_weight} of 0
to mask values.

If \code{top_k} is set, recall will be computed as how often on average a class
among the labels of a batch entry is in the top-k predictions.

If \code{class_id} is specified, we calculate recall by considering only the
entries in the batch for which \code{class_id} is in the label, and computing the
fraction of them for which \code{class_id} is above the threshold and/or in the
top-k predictions.
}
\seealso{
Other metrics: 
\code{\link{custom_metric}()},
\code{\link{metric_accuracy}()},
\code{\link{metric_auc}()},
\code{\link{metric_binary_accuracy}()},
\code{\link{metric_binary_crossentropy}()},
\code{\link{metric_categorical_accuracy}()},
\code{\link{metric_categorical_crossentropy}()},
\code{\link{metric_categorical_hinge}()},
\code{\link{metric_cosine_similarity}()},
\code{\link{metric_false_negatives}()},
\code{\link{metric_false_positives}()},
\code{\link{metric_hinge}()},
\code{\link{metric_kullback_leibler_divergence}()},
\code{\link{metric_logcosh_error}()},
\code{\link{metric_mean}()},
\code{\link{metric_mean_absolute_error}()},
\code{\link{metric_mean_absolute_percentage_error}()},
\code{\link{metric_mean_iou}()},
\code{\link{metric_mean_relative_error}()},
\code{\link{metric_mean_squared_error}()},
\code{\link{metric_mean_squared_logarithmic_error}()},
\code{\link{metric_mean_tensor}()},
\code{\link{metric_mean_wrapper}()},
\code{\link{metric_poisson}()},
\code{\link{metric_precision}()},
\code{\link{metric_precision_at_recall}()},
\code{\link{metric_recall_at_precision}()},
\code{\link{metric_root_mean_squared_error}()},
\code{\link{metric_sensitivity_at_specificity}()},
\code{\link{metric_sparse_categorical_accuracy}()},
\code{\link{metric_sparse_categorical_crossentropy}()},
\code{\link{metric_sparse_top_k_categorical_accuracy}()},
\code{\link{metric_specificity_at_sensitivity}()},
\code{\link{metric_squared_hinge}()},
\code{\link{metric_sum}()},
\code{\link{metric_top_k_categorical_accuracy}()},
\code{\link{metric_true_negatives}()},
\code{\link{metric_true_positives}()}
}
\concept{metrics}
