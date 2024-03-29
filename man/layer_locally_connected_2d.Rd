% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers-locally-connected.R
\name{layer_locally_connected_2d}
\alias{layer_locally_connected_2d}
\title{Locally-connected layer for 2D inputs.}
\usage{
layer_locally_connected_2d(
  object,
  filters,
  kernel_size,
  strides = c(1L, 1L),
  padding = "valid",
  data_format = NULL,
  activation = NULL,
  use_bias = TRUE,
  kernel_initializer = "glorot_uniform",
  bias_initializer = "zeros",
  kernel_regularizer = NULL,
  bias_regularizer = NULL,
  activity_regularizer = NULL,
  kernel_constraint = NULL,
  bias_constraint = NULL,
  implementation = 1L,
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

\item{filters}{Integer, the dimensionality of the output space (i.e. the
number output of filters in the convolution).}

\item{kernel_size}{An integer or list of 2 integers, specifying the width and
height of the 2D convolution window. Can be a single integer to specify the
same value for all spatial dimensions.}

\item{strides}{An integer or list of 2 integers, specifying the strides of
the convolution along the width and height. Can be a single integer to
specify the same value for all spatial dimensions. Specifying any stride
value != 1 is incompatible with specifying any \code{dilation_rate} value != 1.}

\item{padding}{Currently only supports \code{"valid"} (case-insensitive). \code{"same"}
may be supported in the future.}

\item{data_format}{A string, one of \code{channels_last} (default) or
\code{channels_first}. The ordering of the dimensions in the inputs.
\code{channels_last} corresponds to inputs with shape \verb{(batch, width, height, channels)} while \code{channels_first} corresponds to inputs with shape \verb{(batch, channels, width, height)}. It defaults to the \code{image_data_format} value
found in your Keras config file at \verb{~/.keras/keras.json}. If you never set
it, then it will be "channels_last".}

\item{activation}{Activation function to use. If you don't specify anything,
no activation is applied (ie. "linear" activation: \code{a(x) = x}).}

\item{use_bias}{Boolean, whether the layer uses a bias vector.}

\item{kernel_initializer}{Initializer for the \code{kernel} weights matrix.}

\item{bias_initializer}{Initializer for the bias vector.}

\item{kernel_regularizer}{Regularizer function applied to the \code{kernel}
weights matrix.}

\item{bias_regularizer}{Regularizer function applied to the bias vector.}

\item{activity_regularizer}{Regularizer function applied to the output of the
layer (its "activation")..}

\item{kernel_constraint}{Constraint function applied to the kernel matrix.}

\item{bias_constraint}{Constraint function applied to the bias vector.}

\item{implementation}{either 1, 2, or 3. 1 loops over input spatial locations
to perform the forward pass. It is memory-efficient but performs a lot of
(small) ops. 2 stores layer weights in a dense but sparsely-populated 2D
matrix and implements the forward pass as a single matrix-multiply. It uses
a lot of RAM but performs few (large) ops. 3 stores layer weights in a
sparse tensor and implements the forward pass as a single sparse
matrix-multiply. How to choose: 1: large, dense models, 2: small models, 3:
large, sparse models, where "large" stands for large input/output
activations (i.e. many \verb{filters, input_filters, large input_size, output_size}),
and "sparse" stands for few connections between inputs and outputs, i.e.
small ratio \code{filters * input_filters * kernel_size / (input_size * strides)},
where inputs to and outputs of the layer are assumed to have shapes
\verb{(input_size, input_filters)}, \verb{(output_size, filters)} respectively.
It is recommended to benchmark each in the setting of interest to pick the
most efficient one (in terms of speed and memory usage). Correct choice of
implementation can lead to dramatic speed improvements (e.g. 50X),
potentially at the expense of RAM. Also, only \code{padding="valid"} is
supported by \code{implementation=1}.}

\item{batch_size}{Fixed batch size for layer}

\item{name}{An optional name string for the layer. Should be unique in a
model (do not reuse the same name twice). It will be autogenerated if it
isn't provided.}

\item{trainable}{Whether the layer weights will be updated during training.}

\item{weights}{Initial weights for layer.}
}
\description{
\code{layer_locally_connected_2d} works similarly to \code{\link[=layer_conv_2d]{layer_conv_2d()}}, except
that weights are unshared, that is, a different set of filters is applied at
each different patch of the input.
}
\section{Input shape}{
 4D tensor with shape: \verb{(samples, channels, rows, cols)}
if data_format='channels_first' or 4D tensor with shape: \verb{(samples, rows, cols, channels)} if data_format='channels_last'.
}

\section{Output shape}{
 4D tensor with shape: \verb{(samples, filters, new_rows, new_cols)} if data_format='channels_first' or 4D tensor with shape:
\verb{(samples, new_rows, new_cols, filters)} if data_format='channels_last'.
\code{rows} and \code{cols} values might have changed due to padding.
}

\seealso{
Other locally connected layers: 
\code{\link{layer_locally_connected_1d}()}
}
\concept{locally connected layers}
