## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  history <- model %>% fit(
#    x_train, y_train,
#    batch_size = batch_size,
#    epochs = epochs,
#    verbose = 1,
#    callbacks = callback_tensorboard("logs/run_a"),
#    validation_split = 0.2
#  )

## ------------------------------------------------------------------------
#  tensorboard("logs/run_a")

## ------------------------------------------------------------------------
#  # launch TensorBoard (data won't show up until after the first epoch)
#  tensorboard("logs/run_a")
#  
#  # fit the model with the TensorBoard callback
#  history <- model %>% fit(
#    x_train, y_train,
#    batch_size = batch_size,
#    epochs = epochs,
#    verbose = 1,
#    callbacks = callback_tensorboard("logs/run_a"),
#    validation_split = 0.2
#  )

## ------------------------------------------------------------------------
#  callback_tensorboard(log_dir = "logs/run_b")

## ------------------------------------------------------------------------
#  tensorboard("logs")

## ------------------------------------------------------------------------
#  tensorboard(c("logs/run_a", "logs/run_b"))

