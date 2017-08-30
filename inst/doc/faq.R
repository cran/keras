## ----setup, include=FALSE------------------------------------------------
library(keras)
knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#  model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(784)) %>%
#    layer_dense(units = 10, activation = 'softmax')

## ------------------------------------------------------------------------
#  model <- model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(784)) %>%
#    layer_dense(units = 10, activation = 'softmax')

## ------------------------------------------------------------------------
#  save_model_hdf5(model, 'my_model.h5')
#  model <- load_model_hdf5('my_model.h5')

## ------------------------------------------------------------------------
#  json_string <- model_to_json(model)
#  yaml_string <- model_to_yaml(model)

## ------------------------------------------------------------------------
#  model <- model_from_json(json_string)
#  model <- model_from_yaml(yaml_string)

## ------------------------------------------------------------------------
#  save_model_weights_hdf5('my_model_weights.h5')

## ------------------------------------------------------------------------
#  model %>% load_model_weights_hdf5('my_model_weights.h5')

## ------------------------------------------------------------------------
#  model %>% load_model_weights_hdf5('my_model_weights.h5', by_name = TRUE)

## ------------------------------------------------------------------------
#  # assuming the original model looks like this:
#  #   model <- keras_model_sequential()
#  #   model %>%
#  #     layer_dense(units = 2, input_dim = 3, name = "dense 1") %>%
#  #     layer_dense(units = 3, name = "dense_3") %>%
#  #     ...
#  #   save_model_weights(model, fname)
#  
#  # new model
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 2, input_dim = 3, name = "dense 1") %>%  # will be loaded
#    layer_dense(units = 3, name = "dense_3")                     # will not be loaded
#  
#  # load weights from first model; will only affect the first layer, dense_1.
#  load_model_weights(fname, by_name = TRUE)

## ------------------------------------------------------------------------
#  model <- ...  # create the original model
#  
#  layer_name <- 'my_layer'
#  intermediate_layer_model <- keras_model(inputs = model$input,
#                                          outputs = get_layer(layer_name)$output)
#  intermediate_output <- predict(intermediate_layer_model, data)

## ------------------------------------------------------------------------
#  sampling_generator <- function(X_data, Y_data, batch_size) {
#    function() {
#      rows <- sample(1:nrow(X_data), batch_size, replace = TRUE)
#      list(X_data[rows,], Y_data[rows,])
#    }
#  }
#  
#  model %>%
#    fit_generator(sampling_generator(X_train, Y_train, batch_size = 128),
#                  steps_per_epoch = nrow(X_train) / 128, epochs = 10)
#  

## ------------------------------------------------------------------------
#  data_files_generator <- function(dir) {
#  
#    files < list.files(dir)
#    next_file <- 0
#  
#    function() {
#  
#      # move to the next file (note the <<- assignment operator)
#      next_file <<- next_file + 1
#  
#      # determine the file name
#      file <- files[[next_file]]
#  
#      # process and return the data in the file
#      file_to_training_data(file)
#    }
#  }

## ------------------------------------------------------------------------
#  early_stopping <- callback_early_stopping(monitor = 'val_loss', patience = 2)
#  model %>% fit(X, y, validation_split = 0.2, callbacks = c(early_stopping))

## ------------------------------------------------------------------------
#  hist <- model %>% fit(X, y, validation_split=0.2)
#  hist$history

## ------------------------------------------------------------------------
#  frozen_layer <- layer_dense(units = 32, trainable = FALSE)

## ------------------------------------------------------------------------
#  x <- layer_input(shape = c(32))
#  layer <- layer_dense(units = 32)
#  layer$trainable <- FALSE
#  y <- x %>% layer
#  
#  frozen_model <- keras_model(x, y)
#  # in the model below, the weights of `layer` will not be updated during training
#  frozen_model %>% compile(optimizer = 'rmsprop', loss = 'mse')
#  
#  layer$trainable <- TRUE
#  trainable_model <- keras_model(x, y)
#  # with this model the weights of the layer will be updated during training
#  # (which will also affect the above model since it uses the same layer instance)
#  trainable_model %>% compile(optimizer = 'rmsprop', loss = 'mse')
#  
#  frozen_model %>% fit(data, labels)  # this does NOT update the weights of `layer`
#  trainable_model %>% fit(data, labels)  # this updates the weights of `layer`

## ------------------------------------------------------------------------
#  model <- keras_model_sequential()
#  model %>%
#    layer_dense(units = 32, activation = 'relu', input_shape = c(784)) %>%
#    layer_dense(units = 32, activation = 'relu') %>%
#    layer_dense(units = 32, activation = 'relu')
#  
#  length(model$layers)     # "3"
#  model %>% pop_layer()
#  length(model$layers)     # "2"

## ------------------------------------------------------------------------
#  model <- application_vgg16(weights = 'imagenet', include_top = TRUE)

## ------------------------------------------------------------------------
#  # testthat utilty for skipping tests when Keras isn't available
#  skip_if_no_keras <- function(version = NULL) {
#    if (!is_keras_available(version))
#      skip("Required keras version not available for testing")
#  }
#  
#  # use the function within a test
#  test_that("keras function works correctly", {
#    skip_if_no_keras()
#    # test code here
#  })

## ------------------------------------------------------------------------
#  # Keras python module
#  keras <- NULL
#  
#  # Obtain a reference to the module from the keras R package
#  .onLoad <- function(libname, pkgname) {
#    keras <<- keras::implementation()
#  }

## ------------------------------------------------------------------------
#  library(keras)
#  library(tensorflow)
#  
#  # Set R random seed
#  set.seed(42L)
#  
#  # TensorFlow session configuration that uses only a single thread. Multiple threads are a
#  # potential source of non-reproducible results, see: https://stackoverflow.com/questions/42022950/which-seeds-have-to-be-set-where-to-realize-100-reproducibility-of-training-res
#  session_conf <- tf$ConfigProto(intra_op_parallelism_threads = 1L,
#                                 inter_op_parallelism_threads = 1L)
#  
#  # Set TF random seed (see: https://www.tensorflow.org/api_docs/python/tf/set_random_seed)
#  tf$set_random_seed(1042L)
#  
#  # Create the session using the custom configuration
#  sess <- tf$Session(graph = tf$get_default_graph(), config = session_conf)
#  
#  # Instruct Keras to use this session
#  K <- backend()
#  K$set_session(sess)
#  
#  # Rest of code follows ...

