## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  Sys.setenv(KERAS_BACKEND = "theano")
#  library(keras)

## ------------------------------------------------------------------------
#  Sys.setenv(KERAS_BACKEND = "cntk")
#  library(keras)

## ------------------------------------------------------------------------
#  library(keras)
#  K <- backend()

## ------------------------------------------------------------------------
#  inputs <- K$placeholder(shape = list(2L, 4L, 5L))
#  # also works:
#  inputs <-  K$placeholder(shape = list(NULL, 4L, 5L))
#  # also works:
#  inputs <- K$placeholder(ndim = 3L)

## ------------------------------------------------------------------------
#  val <- array(runif(60), dim = c(3L, 4L, 5L))
#  var <- K$variable(value = val)
#  
#  # all-zeros variable:
#  var <- K$zeros(shape = list(3L, 4L, 5L))
#  # all-ones:
#  var <- K$ones(shape = list(3L, 4L, 5L))

