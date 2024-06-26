% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocessing.R
\name{fit_image_data_generator}
\alias{fit_image_data_generator}
\title{Fit image data generator internal statistics to some sample data.}
\usage{
fit_image_data_generator(object, x, augment = FALSE, rounds = 1, seed = NULL)
}
\arguments{
\item{object}{\code{\link[=image_data_generator]{image_data_generator()}}}

\item{x}{array, the data to fit on (should have rank 4). In case of grayscale data,
the channels axis should have value 1, and in case of RGB data, it should have value 3.}

\item{augment}{Whether to fit on randomly augmented samples}

\item{rounds}{If \code{augment}, how many augmentation passes to do over the data}

\item{seed}{random seed.}
}
\description{
Required for \code{featurewise_center}, \code{featurewise_std_normalization}
and \code{zca_whitening}.
}
\seealso{
Other image preprocessing: 
\code{\link{flow_images_from_data}()},
\code{\link{flow_images_from_dataframe}()},
\code{\link{flow_images_from_directory}()},
\code{\link{image_load}()},
\code{\link{image_to_array}()}
}
\concept{image preprocessing}
