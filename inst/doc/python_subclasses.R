## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  eval = FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
#  library(reticulate)
#  library(keras)

## -----------------------------------------------------------------------------
#  NonNegative <- R6::R6Class("NonNegative",
#    inherit = keras$constraints$Constraint,
#    public = list(
#      "__call__" = function(x) {
#         w * k_cast(w >= 0, k_floatx())
#      }
#    )
#  )
#  NonNegative <- r_to_py(NonNegative, convert=TRUE)

## -----------------------------------------------------------------------------
#  NonNegative(keras$constraints$Constraint) %py_class% {
#    "__call__" = function(x) {
#      w * k_cast(w >= 0, k_floatx())
#    }
#  }

## ---- eval=FALSE--------------------------------------------------------------
#  NonNegative(keras$constraints$Constraint, convert=FALSE) %py_class% { ... }

## -----------------------------------------------------------------------------
#  CustomLayer <- R6::R6Class("CustomLayer",
#  
#    inherit = keras$layers$Layer,
#  
#    public = list(
#  
#      initialize = function(output_dim) {
#        self$output_dim <- output_dim
#      },
#  
#      build = function(input_shape) {
#        self$kernel <- self$add_weight(
#          name = 'kernel',
#          shape = list(input_shape[[2]], self$output_dim),
#          initializer = initializer_random_normal(),
#          trainable = TRUE
#        )
#      },
#  
#      call = function(x, mask = NULL) {
#        k_dot(x, self$kernel)
#      },
#  
#      compute_output_shape = function(input_shape) {
#        list(input_shape[[1]], self$output_dim)
#      }
#    )
#  )

## -----------------------------------------------------------------------------
#  CustomLayer(keras$layers$Layer) %py_class% {
#  
#    initialize = function(output_dim) {
#      self$output_dim <- output_dim
#    }
#  
#    build = function(input_shape) {
#      self$kernel <- self$add_weight(
#        name = 'kernel',
#        shape = list(input_shape[[2]], self$output_dim),
#        initializer = initializer_random_normal(),
#        trainable = TRUE
#      )
#    }
#  
#    call = function(x, mask = NULL) {
#      k_dot(x, self$kernel)
#    }
#  
#    compute_output_shape = function(input_shape) {
#      list(input_shape[[1]], self$output_dim)
#    }
#  }

