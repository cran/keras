## ----setup, include = FALSE---------------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## -----------------------------------------------------------------------------
#  library(tensorflow)
#  library(keras)
#  
#  layer_linear <- Layer(
#    classname = "Linear",
#    initialize = function(units, input_dim) {
#      super()$`__init__`()
#      w_init <- tf$random_normal_initializer()
#      self$w <- tf$Variable(
#        initial_value = w_init(shape = shape(input_dim, units),
#                               dtype = tf$float32)
#        )
#      b_init <- tf$zeros_initializer()
#      self$b <- tf$Variable(
#        initial_value = b_init(shape = shape(units),
#                               dtype = tf$float32)
#      )
#    },
#    call = function(inputs, ...) {
#      tf$matmul(inputs, self$w) + self$b
#    }
#  )
#  
#  x <- tf$ones(shape = list(2,2))
#  layer <- layer_linear(units = 4, input_dim = 2)
#  y <- layer(x)
#  y

## -----------------------------------------------------------------------------
#  get_weights(layer)

## -----------------------------------------------------------------------------
#  layer_linear <- Layer(
#    classname = "Linear",
#    initialize = function(units, input_dim) {
#      super()$`__init__`()
#      self$w <- self$add_weight(
#        shape = shape(input_dim, units),
#        initializer = "random_normal",
#        trainable = TRUE
#      )
#      self$b <- self$add_weight(
#        shape = shape(units),
#        initializer = "zeros",
#        trainable = TRUE
#      )
#    },
#    call = function(inputs, ...) {
#      tf$matmul(inputs, self$w) + self$b
#    }
#  )

## -----------------------------------------------------------------------------
#  layer_compute_sum <- Layer(
#    classname = "ComputeSum",
#    initialize = function(input_dim) {
#      super()$`__init__`()
#      self$total <- tf$Variable(
#        initial_value = tf$zeros(shape(input_dim)),
#        trainable = FALSE
#      )
#    },
#    call = function(inputs, ...) {
#      self$total$assign_add(tf$reduce_sum(inputs, axis = 0L))
#      self$total
#    }
#  )
#  
#  x <- tf$ones(shape(2,2))
#  mysum <- layer_compute_sum(input_dim = 2)
#  print(mysum(x))
#  print(mysum(x))

## -----------------------------------------------------------------------------
#  get_weights(mysum)
#  mysum$non_trainable_weights

## -----------------------------------------------------------------------------
#  layer_linear <- Layer(
#    classname = "Linear",
#    initialize = function(units, input_dim) {
#      super()$`__init__`()
#      self$w <- self$add_weight(
#        shape = shape(input_dim, units),
#        initializer = "random_normal",
#        trainable = TRUE
#      )
#      self$b <- self$add_weight(
#        shape = shape(units),
#        initializer = "zeros",
#        trainable = TRUE
#      )
#    },
#    call = function(inputs, ...) {
#      tf$matmul(inputs, self$w) + self$b
#    }
#  )

## -----------------------------------------------------------------------------
#  layer_linear <- Layer(
#    classname = "Linear",
#    initialize = function(units) {
#      super()$`__init__`()
#      self$units <- units
#    },
#    build = function(input_shape) {
#      self$w <- self$add_weight(
#        shape = shape(input_shape[2], self$units),
#        initializer = "random_normal",
#        trainable = TRUE
#      )
#      self$b <- self$add_weight(
#        shape = shape(self$units),
#        initializer = "zeros",
#        trainable = TRUE
#      )
#    },
#    call = function(inputs, ...) {
#      tf$matmul(inputs, self$w) + self$b
#    }
#  )

## -----------------------------------------------------------------------------
#  layer <- layer_linear(units = 32)
#  x <- tf$ones(shape = list(2,2))
#  layer(x)

## -----------------------------------------------------------------------------
#  # Let's assume we are reusing the Linear class
#  # with a `build` method that we defined above.
#  layer_mlp_block <- Layer(
#    classname = "MLPBlock",
#    initialize = function() {
#      super()$`__init__`()
#      self$linear_1 <- layer_linear(units = 32)
#      self$linear_2 <- layer_linear(units = 32)
#      self$linear_3 <- layer_linear(units = 1)
#    },
#    call = function(inputs, ...) {
#      inputs %>%
#        self$linear_1() %>%
#        tf$nn$relu() %>%
#        self$linear_2() %>%
#        tf$nn$relu() %>%
#        self$linear_3()
#    }
#  )
#  
#  mlp <- layer_mlp_block()
#  
#  y <- mlp(tf$ones(shape(3, 64)))  # The first call to the `mlp` will create the weights
#  length(mlp$weights)
#  length(mlp$trainable_weights)

## -----------------------------------------------------------------------------
#  # A layer that creates an activity regularization loss
#  layer_activity_reg <- Layer(
#    classname = "ActivityRegularizationLayer",
#    initialize = function(rate = 1e-2) {
#      super()$`__init__`()
#      self$rate <- rate
#    },
#    call = function(inputs) {
#      self$add_loss(self$rate * tf$reduce_sum(inputs))
#      inputs
#    }
#  )

## -----------------------------------------------------------------------------
#  layer_outer <- Layer(
#    classname = "OuterLayer",
#    initialize = function() {
#      super()$`__init__`()
#      self$dense <- layer_dense(
#        units = 32,
#        kernel_regularizer = regularizer_l2(1e-3)
#      )
#    },
#    call = function(inputs) {
#      self$dense(inputs)
#    }
#  )
#  
#  layer <- layer_outer()
#  x <- layer(tf$zeros(shape(1,1)))
#  
#  # This is `1e-3 * sum(layer.dense.kernel ** 2)`,
#  # created by the `kernel_regularizer` above.
#  layer$losses

## -----------------------------------------------------------------------------
#  layer_linear <- Layer(
#    classname = "Linear",
#    initialize = function(units, ...) {
#      super()$`__init__`(...)
#      self$units <- units
#    },
#    build = function(input_shape) {
#      self$w <- self$add_weight(
#        shape = shape(input_shape[2], self$units),
#        initializer = "random_normal",
#        trainable = TRUE
#      )
#      self$b <- self$add_weight(
#        shape = shape(self$units),
#        initializer = "zeros",
#        trainable = TRUE
#      )
#    },
#    call = function(inputs, ...) {
#      tf$matmul(inputs, self$w) + self$b
#    },
#    get_config = function() {
#      list(
#        units = self$units
#      )
#    }
#  )
#  
#  layer <- layer_linear(units = 64)
#  config <- get_config(layer)
#  new_layer <- from_config(config)

## -----------------------------------------------------------------------------
#  layer_custom_dropout <- Layer(
#    classname =  "CustomDropout",
#    initialize = function(rate, ...) {
#      super()$`__init__`(...)
#      self$rate <- rate
#    },
#    call = function(inputs, training = NULL) {
#      if (!is.null(inputs) && training) {
#        inputs <- tf$nn$dropout(inputs, rate = self$rate)
#      }
#      inputs
#    }
#  )

