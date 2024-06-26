% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers-convolutional.R
\name{layer_depthwise_conv_1d}
\alias{layer_depthwise_conv_1d}
\title{Depthwise 1D convolution}
\usage{
layer_depthwise_conv_1d(
  object,
  kernel_size,
  strides = 1L,
  padding = "valid",
  depth_multiplier = 1L,
  data_format = NULL,
  dilation_rate = 1L,
  activation = NULL,
  use_bias = TRUE,
  depthwise_initializer = "glorot_uniform",
  bias_initializer = "zeros",
  depthwise_regularizer = NULL,
  bias_regularizer = NULL,
  activity_regularizer = NULL,
  depthwise_constraint = NULL,
  bias_constraint = NULL,
  ...
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

\item{kernel_size}{An integer, specifying the height and width of the 1D
convolution window. Can be a single integer to specify the same value for
all spatial dimensions.}

\item{strides}{An integer, specifying the strides of the convolution along the
height and width. Can be a single integer to specify the same value for
all spatial dimensions. Specifying any stride value != 1 is incompatible
with specifying any \code{dilation_rate} value != 1.}

\item{padding}{one of \code{'valid'} or \code{'same'} (case-insensitive). \code{"valid"} means no
padding. \code{"same"} results in padding with zeros evenly to the left/right
or up/down of the input such that output has the same height/width
dimension as the input.}

\item{depth_multiplier}{The number of depthwise convolution output channels for
each input channel. The total number of depthwise convolution output
channels will be equal to \code{filters_in * depth_multiplier}.}

\item{data_format}{A string, one of \code{"channels_last"} (default) or \code{"channels_first"}.
The ordering of the dimensions in the inputs. \code{channels_last} corresponds
to inputs with shape \verb{(batch_size, height, width, channels)} while
\code{channels_first} corresponds to inputs with shape \verb{(batch_size, channels, height, width)}. It defaults to the \code{image_data_format} value found in
your Keras config file at \verb{~/.keras/keras.json}. If you never set it, then
it will be 'channels_last'.}

\item{dilation_rate}{A single integer, specifying the dilation rate to use for
dilated convolution. Currently, specifying any \code{dilation_rate} value != 1
is incompatible with specifying any stride value != 1.}

\item{activation}{Activation function to use. If you don't specify anything, no
activation is applied (see \code{?activation_relu}).}

\item{use_bias}{Boolean, whether the layer uses a bias vector.}

\item{depthwise_initializer}{Initializer for the depthwise kernel matrix (see
\code{\link{initializer_glorot_uniform}}). If NULL, the default initializer
(\code{"glorot_uniform"}) will be used.}

\item{bias_initializer}{Initializer for the bias vector (see
\code{keras.initializers}). If NULL, the default initializer ('zeros') will be
used.}

\item{depthwise_regularizer}{Regularizer function applied to the depthwise kernel
matrix (see  \code{\link[=regularizer_l1]{regularizer_l1()}}).}

\item{bias_regularizer}{Regularizer function applied to the bias vector (see
\code{\link[=regularizer_l1]{regularizer_l1()}}).}

\item{activity_regularizer}{Regularizer function applied to the output of the
layer (its 'activation') (see  \code{\link[=regularizer_l1]{regularizer_l1()}}).}

\item{depthwise_constraint}{Constraint function applied to the depthwise kernel
matrix (see \code{\link[=constraint_maxnorm]{constraint_maxnorm()}}).}

\item{bias_constraint}{Constraint function applied to the bias vector (see
\code{\link[=constraint_maxnorm]{constraint_maxnorm()}}).}

\item{...}{standard layer arguments.}
}
\description{
Depthwise 1D convolution
}
\details{
Depthwise convolution is a type of convolution in which each input channel is
convolved with a different kernel (called a depthwise kernel). You
can understand depthwise convolution as the first step in a depthwise
separable convolution.

It is implemented via the following steps:
\itemize{
\item Split the input into individual channels.
\item Convolve each channel with an individual depthwise kernel with
\code{depth_multiplier} output channels.
\item Concatenate the convolved outputs along the channels axis.
}

Unlike a regular 1D convolution, depthwise convolution does not mix
information across different input channels.

The \code{depth_multiplier} argument determines how many filter are applied to one
input channel. As such, it controls the amount of output channels that are
generated per input channel in the depthwise step.
}
\seealso{
\itemize{
\item \url{https://www.tensorflow.org/api_docs/python/tf/keras/layers/DepthwiseConv1D}
}

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
\code{\link{layer_depthwise_conv_2d}()},
\code{\link{layer_separable_conv_1d}()},
\code{\link{layer_separable_conv_2d}()},
\code{\link{layer_upsampling_1d}()},
\code{\link{layer_upsampling_2d}()},
\code{\link{layer_upsampling_3d}()},
\code{\link{layer_zero_padding_1d}()},
\code{\link{layer_zero_padding_2d}()},
\code{\link{layer_zero_padding_3d}()}
}
\concept{convolutional layers}
