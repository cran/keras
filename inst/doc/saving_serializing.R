## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## -----------------------------------------------------------------------------
#  library(keras)

## -----------------------------------------------------------------------------
#  inputs <- layer_input(shape = 784, name = "digits")
#  outputs <- inputs %>%
#    layer_dense(units = 64, activation = "relu", name = "dense_1") %>%
#    layer_dense(units = 64, activation = "relu", name = "dense_2") %>%
#    layer_dense(units = 10, activation = "softmax", name = "predictions")
#  model <- keras_model(inputs, outputs)
#  summary(model)

## -----------------------------------------------------------------------------
#  c(c(x_train, y_train), c(x_test, y_test)) %<-% dataset_mnist()
#  x_train <- x_train %>% array_reshape(dim = c(60000, 784))/255
#  x_test <- x_test %>% array_reshape(dim = c(10000, 784))/255
#  
#  model %>% compile(loss = "sparse_categorical_crossentropy",
#                    optimizer = optimizer_rmsprop())
#  
#  history <- model %>% fit(x_train, y_train, batch_size = 64, epochs = 1)

## -----------------------------------------------------------------------------
#  # Save predictions for future checks
#  predictions <- predict(model, x_test)

## -----------------------------------------------------------------------------
#  # Save the model
#  save_model_hdf5(model, "model.h5")
#  
#  # Recreate the exact same model purely from the file
#  new_model <- load_model_hdf5("model.h5")

## -----------------------------------------------------------------------------
#  # Check that the state is preserved
#  new_predictions <- predict(new_model, x_test)
#  all.equal(predictions, new_predictions)

## -----------------------------------------------------------------------------
#  # Export the model to a SavedModel
#  save_model_tf(model, "model/")
#  
#  # Recreate the exact same model
#  new_model <- load_model_tf("model/")
#  
#  # Check that the state is preserved
#  new_predictions <- predict(new_model, x_test)
#  all.equal(predictions, new_predictions)

## ----eval=FALSE---------------------------------------------------------------
#  export_savedmodel(model, "savedmodel/")
#  new_predictions <- tfdeploy::predict_savedmodel(x_test, "savedmodel/")

## -----------------------------------------------------------------------------
#  config <- get_config(model)
#  reinitialized_model <- from_config(config)

## -----------------------------------------------------------------------------
#  # Note that the model state is not preserved! We only saved the architecture.
#  new_predictions <- predict(reinitialized_model, x_test)
#  all.equal(predictions, new_predictions)

## -----------------------------------------------------------------------------
#  json_config <- model_to_json(model)
#  reinitialized_model <- model_from_json(json_config)

## -----------------------------------------------------------------------------
#  weights <- get_weights(model)
#  set_weights(reinitialized_model, weights)
#  
#  new_predictions <- predict(reinitialized_model, x_test)
#  all.equal(predictions, new_predictions)

## -----------------------------------------------------------------------------
#  config <- get_config(model)
#  weights <- get_weights(model)
#  
#  new_model <- from_config(config)
#  set_weights(new_model, weights)
#  
#  # Check that the state is preserved
#  new_predictions <- predict(new_model, x_test)
#  all.equal(predictions, new_predictions)

## -----------------------------------------------------------------------------
#  # Save JSON config to disk
#  json_config <- model_to_json(model)
#  writeLines(json_config, "model_config.json")
#  
#  # Save weights to disk
#  save_model_weights_hdf5(model, "model_weights.h5")
#  
#  # Reload the model from the 2 files we saved
#  json_config <- readLines("model_config.json")
#  new_model <- model_from_json(json_config)
#  load_model_weights_hdf5(new_model, "model_weights.h5")
#  
#  # Check that the state is preserved
#  new_predictions <- predict(new_model, x_test)
#  all.equal(predictions, new_predictions)

## -----------------------------------------------------------------------------
#  save_model_hdf5(model, "model.h5")
#  new_model <- load_model_hdf5("model.h5")

## -----------------------------------------------------------------------------
#  save_model_weights_tf(model, "model_weights")

## -----------------------------------------------------------------------------
#  keras_model_simple_mlp <- function(num_classes,
#                                     use_bn = FALSE, use_dp = FALSE,
#                                     name = NULL) {
#  
#    # define and return a custom model
#    keras_model_custom(name = name, function(self) {
#  
#      # create layers we'll need for the call (this code executes once)
#      self$dense1 <- layer_dense(units = 32, activation = "relu")
#      self$dense2 <- layer_dense(units = num_classes, activation = "softmax")
#      if (use_dp)
#        self$dp <- layer_dropout(rate = 0.5)
#      if (use_bn)
#        self$bn <- layer_batch_normalization(axis = -1)
#  
#      # implement call (this code executes during training & inference)
#      function(inputs, mask = NULL) {
#        x <- self$dense1(inputs)
#        if (use_dp)
#          x <- self$dp(x)
#        if (use_bn)
#          x <- self$bn(x)
#        self$dense2(x)
#      }
#    })
#  }
#  
#  model <- keras_model_simple_mlp(num_classes = 10)

## -----------------------------------------------------------------------------
#  model %>% compile(loss = "sparse_categorical_crossentropy",
#                    optimizer = optimizer_rmsprop())
#  
#  history <- model %>% fit(x_train, y_train, batch_size = 64, epochs = 1)

## -----------------------------------------------------------------------------
#  save_model_weights_tf(model, "my_weights")

## -----------------------------------------------------------------------------
#  # Save predictions for future checks
#  predictions <- predict(model, x_test)
#  # Also save the loss on the first batch
#  # to later assert that the optimizer state was preserved
#  first_batch_loss <- train_on_batch(model, x_train[1:64,], y_train[1:64])

## -----------------------------------------------------------------------------
#  new_model <- keras_model_simple_mlp(num_classes = 10)
#  new_model %>% compile(loss = "sparse_categorical_crossentropy",
#                    optimizer = optimizer_rmsprop())
#  
#  # This initializes the variables used by the optimizers,
#  # as well as any stateful metric variables
#  train_on_batch(new_model, x_train[1:5,], y_train[1:5])
#  
#  # Load the state of the old model
#  load_model_weights_tf(new_model, "my_weights")
#  
#  # Check that the model state has been preserved
#  new_predictions <- predict(new_model, x_test)
#  all.equal(predictions, new_predictions)
#  
#  # The optimizer state is preserved as well,
#  # so you can resume training where you left off
#  new_first_batch_loss <- train_on_batch(new_model, x_train[1:64,], y_train[1:64])
#  first_batch_loss == new_first_batch_loss

