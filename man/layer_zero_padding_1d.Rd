% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers-convolutional.R
\name{layer_zero_padding_1d}
\alias{layer_zero_padding_1d}
\title{Zero-padding layer for 1D input (e.g. temporal sequence).}
\usage{
layer_zero_padding_1d(
  object,
  padding = 1L,
  batch_size = NULL,
  name = NULL,
  trainable = NULL,
  weights = NULL
)
}
\arguments{
\item{object}{What to compose the new \code{Layer} instance with. Typically a
Sequential model or a Tensor (e.g., as returned by \code{layer_input()}).
The return value depends on \code{object}. If \code{object} is:
\itemize{
\item missing or \code{NULL}, the \code{Layer} instance is returned.
\item a \code{Sequential} model, the model with an additional layer is returned.
\item a Tensor, the output tensor from \code{layer_instance(object)} is returned.
}}

\item{padding}{int, or list of int (length 2)
\itemize{
\item If int: How many zeros to add at the beginning and end of the padding dimension (axis 1).
\item If list of int (length 2): How many zeros to add at the beginning and at the end of the padding dimension (\verb{(left_pad, right_pad)}).
}}

\item{batch_size}{Fixed batch size for layer}

\item{name}{An optional name string for the layer. Should be unique in a
model (do not reuse the same name twice). It will be autogenerated if it
isn't provided.}

\item{trainable}{Whether the layer weights will be updated during training.}

\item{weights}{Initial weights for layer.}
}
\description{
Zero-padding layer for 1D input (e.g. temporal sequence).
}
\section{Input shape}{

3D tensor with shape \verb{(batch, axis_to_pad, features)}
}

\section{Output shape}{

3D tensor with shape \verb{(batch, padded_axis, features)}
}

\seealso{
Other convolutional layers: 
\code{\link{layer_conv_1d}()},
\code{\link{layer_conv_1d_transpose}()},
\code{\link{layer_conv_2d}()},
\code{\link{layer_conv_2d_transpose}()},
\code{\link{layer_conv_3d}()},
\code{\link{layer_conv_3d_transpose}()},
\code{\link{layer_conv_lstm_2d}()},
\code{\link{layer_cropping_1d}()},
\code{\link{layer_cropping_2d}()},
\code{\link{layer_cropping_3d}()},
\code{\link{layer_depthwise_conv_1d}()},
\code{\link{layer_depthwise_conv_2d}()},
\code{\link{layer_separable_conv_1d}()},
\code{\link{layer_separable_conv_2d}()},
\code{\link{layer_upsampling_1d}()},
\code{\link{layer_upsampling_2d}()},
\code{\link{layer_upsampling_3d}()},
\code{\link{layer_zero_padding_2d}()},
\code{\link{layer_zero_padding_3d}()}
}
\concept{convolutional layers}
