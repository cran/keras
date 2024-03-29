% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers-dropout.R
\name{layer_spatial_dropout_3d}
\alias{layer_spatial_dropout_3d}
\title{Spatial 3D version of Dropout.}
\usage{
layer_spatial_dropout_3d(
  object,
  rate,
  data_format = NULL,
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

\item{rate}{float between 0 and 1. Fraction of the input units to drop.}

\item{data_format}{'channels_first' or 'channels_last'. In 'channels_first'
mode, the channels dimension (the depth) is at index 1, in 'channels_last'
mode is it at index 4. It defaults to the \code{image_data_format} value found
in your Keras config file at \verb{~/.keras/keras.json}. If you never set it,
then it will be "channels_last".}

\item{batch_size}{Fixed batch size for layer}

\item{name}{An optional name string for the layer. Should be unique in a
model (do not reuse the same name twice). It will be autogenerated if it
isn't provided.}

\item{trainable}{Whether the layer weights will be updated during training.}

\item{weights}{Initial weights for layer.}
}
\description{
This version performs the same function as Dropout, however it drops entire
3D feature maps instead of individual elements. If adjacent voxels within
feature maps are strongly correlated (as is normally the case in early
convolution layers) then regular dropout will not regularize the activations
and will otherwise just result in an effective learning rate decrease. In
this case, \code{layer_spatial_dropout_3d} will help promote independence between
feature maps and should be used instead.
}
\section{Input shape}{
 5D tensor with shape: \verb{(samples, channels, dim1, dim2, dim3)} if data_format='channels_first' or 5D tensor with shape: \verb{(samples, dim1, dim2, dim3, channels)} if data_format='channels_last'.
}

\section{Output shape}{
 Same as input
}

\section{References}{
 - \href{https://arxiv.org/abs/1411.4280}{Efficient Object Localization Using Convolutional Networks}
}

\seealso{
Other dropout layers: 
\code{\link{layer_dropout}()},
\code{\link{layer_spatial_dropout_1d}()},
\code{\link{layer_spatial_dropout_2d}()}
}
\concept{dropout layers}
