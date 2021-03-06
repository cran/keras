## ----setup, include = FALSE---------------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## -----------------------------------------------------------------------------
#  # instantiate the model
#  model <- application_resnet50(weights = 'imagenet')
#  
#  # load the image
#  img_path <- "elephant.jpg"
#  img <- image_load(img_path, target_size = c(224,224))
#  x <- image_to_array(img)
#  
#  # ensure we have a 4d tensor with single element in the batch dimension,
#  # the preprocess the input for prediction using resnet50
#  x <- array_reshape(x, c(1, dim(x)))
#  x <- imagenet_preprocess_input(x)
#  
#  # make predictions then decode and print them
#  preds <- model %>% predict(x)
#  imagenet_decode_predictions(preds, top = 3)[[1]]

## -----------------------------------------------------------------------------
#  model <- application_vgg16(weights = 'imagenet', include_top = FALSE)
#  
#  img_path <- "elephant.jpg"
#  img <- image_load(img_path, target_size = c(224,224))
#  x <- image_to_array(img)
#  x <- array_reshape(x, c(1, dim(x)))
#  x <- imagenet_preprocess_input(x)
#  
#  features <- model %>% predict(x)

## -----------------------------------------------------------------------------
#  base_model <- application_vgg19(weights = 'imagenet')
#  model <- keras_model(inputs = base_model$input,
#                       outputs = get_layer(base_model, 'block4_pool')$output)
#  
#  img_path <- "elephant.jpg"
#  img <- image_load(img_path, target_size = c(224,224))
#  x <- image_to_array(img)
#  x <- array_reshape(x, c(1, dim(x)))
#  x <- imagenet_preprocess_input(x)
#  
#  block4_pool_features <- model %>% predict(x)

## -----------------------------------------------------------------------------
#  # create the base pre-trained model
#  base_model <- application_inception_v3(weights = 'imagenet', include_top = FALSE)
#  
#  # add our custom layers
#  predictions <- base_model$output %>%
#    layer_global_average_pooling_2d() %>%
#    layer_dense(units = 1024, activation = 'relu') %>%
#    layer_dense(units = 200, activation = 'softmax')
#  
#  # this is the model we will train
#  model <- keras_model(inputs = base_model$input, outputs = predictions)
#  
#  # first: train only the top layers (which were randomly initialized)
#  # i.e. freeze all convolutional InceptionV3 layers
#  freeze_weights(base_model)
#  
#  # compile the model (should be done *after* setting layers to non-trainable)
#  model %>% compile(optimizer = 'rmsprop', loss = 'categorical_crossentropy')
#  
#  # train the model on the new data for a few epochs
#  model %>% fit_generator(...)
#  
#  # at this point, the top layers are well trained and we can start fine-tuning
#  # convolutional layers from inception V3. We will freeze the bottom N layers
#  # and train the remaining top layers.
#  
#  # let's visualize layer names and layer indices to see how many layers
#  # we should freeze:
#  layers <- base_model$layers
#  for (i in 1:length(layers))
#    cat(i, layers[[i]]$name, "\n")
#  
#  # we chose to train the top 2 inception blocks, i.e. we will freeze
#  # the first 172 layers and unfreeze the rest:
#  freeze_weights(base_model, from = 1, to = 172)
#  unfreeze_weights(base_model, from = 173)
#  
#  # we need to recompile the model for these modifications to take effect
#  # we use SGD with a low learning rate
#  model %>% compile(
#    optimizer = optimizer_sgd(lr = 0.0001, momentum = 0.9),
#    loss = 'categorical_crossentropy'
#  )
#  
#  # we train our model again (this time fine-tuning the top 2 inception blocks
#  # alongside the top Dense layers
#  model %>% fit_generator(...)

## -----------------------------------------------------------------------------
#  # this could also be the output a different Keras model or layer
#  input_tensor <- layer_input(shape = c(224, 224, 3))
#  
#  model <- application_inception_V3(input_tensor = input_tensor,
#                                    weights='imagenet',
#                                    include_top = TRUE)

