% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/applications.R
\name{application_mobilenet_v2}
\alias{application_mobilenet_v2}
\alias{mobilenet_v2_preprocess_input}
\alias{mobilenet_v2_decode_predictions}
\alias{mobilenet_v2_load_model_hdf5}
\title{MobileNetV2 model architecture}
\usage{
application_mobilenet_v2(
  input_shape = NULL,
  alpha = 1,
  include_top = TRUE,
  weights = "imagenet",
  input_tensor = NULL,
  pooling = NULL,
  classes = 1000,
  classifier_activation = "softmax",
  ...
)

mobilenet_v2_preprocess_input(x)

mobilenet_v2_decode_predictions(preds, top = 5)

mobilenet_v2_load_model_hdf5(filepath)
}
\arguments{
\item{input_shape}{optional shape list, only to be specified if \code{include_top}
is FALSE (otherwise the input shape has to be \verb{(224, 224, 3)} (with
\code{channels_last} data format) or (3, 224, 224) (with \code{channels_first} data
format). It should have exactly 3 inputs channels, and width and height
should be no smaller than 32. E.g. \verb{(200, 200, 3)} would be one valid
value.}

\item{alpha}{controls the width of the network.
\itemize{
\item If \code{alpha} < 1.0, proportionally decreases the number of filters in each layer.
\item If \code{alpha} > 1.0, proportionally increases the number of filters in each layer.
\item If \code{alpha} = 1, default number of filters from the paper are used at each layer.
}}

\item{include_top}{whether to include the fully-connected layer at the top of
the network.}

\item{weights}{\code{NULL} (random initialization), \code{imagenet} (ImageNet
weights), or the path to the weights file to be loaded.}

\item{input_tensor}{optional Keras tensor (i.e. output of \code{layer_input()})
to use as image input for the model.}

\item{pooling}{Optional pooling mode for feature extraction when
\code{include_top} is \code{FALSE}.
- \code{NULL} means that the output of the model will be the 4D tensor output
of the last convolutional layer.
- \code{avg} means that global average pooling will be applied to the output
of the last convolutional layer, and thus the output of the model will
be a 2D tensor.
- \code{max} means that global max pooling will be applied.}

\item{classes}{optional number of classes to classify images into, only to be
specified if \code{include_top} is TRUE, and if no \code{weights} argument is
specified.}

\item{classifier_activation}{A string or callable. The activation function to
use on the "top" layer. Ignored unless \code{include_top = TRUE}. Set
\code{classifier_activation = NULL} to return the logits of the "top" layer.
Defaults to \code{'softmax'}. When loading pretrained weights,
\code{classifier_activation} can only be \code{NULL} or \code{"softmax"}.}

\item{...}{For backwards and forwards compatibility}

\item{x}{input tensor, 4D}

\item{preds}{Tensor encoding a batch of predictions.}

\item{top}{integer, how many top-guesses to return.}

\item{filepath}{File path}
}
\value{
\code{application_mobilenet_v2()} and \code{mobilenet_v2_load_model_hdf5()} return a
Keras model instance. \code{mobilenet_v2_preprocess_input()} returns image input
suitable for feeding into a mobilenet v2 model. \code{mobilenet_v2_decode_predictions()}
returns a list of data frames with variables \code{class_name}, \code{class_description},
and \code{score} (one data frame per sample in batch input).
}
\description{
MobileNetV2 model architecture
}
\section{Reference}{

\itemize{
\item \href{https://arxiv.org/abs/1801.04381}{MobileNetV2: Inverted Residuals and Linear Bottlenecks}
}
}

\seealso{
application_mobilenet
}
