
#' Fully-connected RNN where the output is to be fed back to input.
#' 
#' @inheritParams layer_dense
#'   
#' @param units Positive integer, dimensionality of the output space.
#' @param activation Activation function to use. Default: hyperbolic tangent 
#'   (`tanh`). If you pass `NULL`, no activation is applied 
#'   (ie. "linear" activation: `a(x) = x`).
#' @param use_bias Boolean, whether the layer uses a bias vector.
#' @param return_sequences Boolean. Whether to return the last output in the 
#'   output sequence, or the full sequence.
#' @param return_state Boolean (default FALSE). Whether to return the last state
#'   in addition to the output.
#' @param go_backwards Boolean (default FALSE). If TRUE, process the input 
#'   sequence backwards and return the reversed sequence.
#' @param stateful Boolean (default FALSE). If TRUE, the last state for each 
#'   sample at index i in a batch will be used as initial state for the sample 
#'   of index i in the following batch.
#' @param unroll Boolean (default FALSE). If TRUE, the network will be unrolled,
#'   else a symbolic loop will be used. Unrolling can speed-up a RNN, although 
#'   it tends to be more memory-intensive. Unrolling is only suitable for short 
#'   sequences.
#' @param kernel_initializer Initializer for the `kernel` weights matrix, used 
#'   for the linear transformation of the inputs.
#' @param recurrent_initializer Initializer for the `recurrent_kernel` weights 
#'   matrix, used for the linear transformation of the recurrent state.
#' @param bias_initializer Initializer for the bias vector.
#' @param kernel_regularizer Regularizer function applied to the `kernel` 
#'   weights matrix.
#' @param recurrent_regularizer Regularizer function applied to the 
#'   `recurrent_kernel` weights matrix.
#' @param bias_regularizer Regularizer function applied to the bias vector.
#' @param activity_regularizer Regularizer function applied to the output of the
#'   layer (its "activation")..
#' @param kernel_constraint Constraint function applied to the `kernel` weights 
#'   matrix.
#' @param recurrent_constraint Constraint function applied to the 
#'   `recurrent_kernel` weights matrix.
#' @param bias_constraint Constraint function applied to the bias vector.
#' @param dropout Float between 0 and 1. Fraction of the units to drop for the 
#'   linear transformation of the inputs.
#' @param recurrent_dropout Float between 0 and 1. Fraction of the units to drop
#'   for the linear transformation of the recurrent state.
#'
#' @template roxlate-recurrent-layer  
#'   
#' @section References: 
#' - [A Theoretically Grounded Application of Dropout in Recurrent Neural Networks](https://arxiv.org/abs/1512.05287)
#'   
#'   
#' @export
layer_simple_rnn <- function(object, units, activation = "tanh", use_bias = TRUE, 
                             return_sequences = FALSE, return_state = FALSE, go_backwards = FALSE, stateful = FALSE, unroll = FALSE,
                             kernel_initializer = "glorot_uniform", recurrent_initializer = "orthogonal", bias_initializer = "zeros", 
                             kernel_regularizer = NULL, recurrent_regularizer = NULL, bias_regularizer = NULL, activity_regularizer = NULL, 
                             kernel_constraint = NULL, recurrent_constraint = NULL, bias_constraint = NULL, 
                             dropout = 0.0, recurrent_dropout = 0.0, input_shape = NULL, batch_input_shape = NULL, batch_size = NULL, 
                             dtype = NULL, name = NULL, trainable = NULL, weights = NULL) {
  
  args <- list(
    units = as.integer(units),
    activation = activation,
    use_bias = use_bias,
    return_sequences = return_sequences,
    go_backwards = go_backwards,
    stateful = stateful,
    unroll = unroll,
    kernel_initializer = kernel_initializer,
    recurrent_initializer = recurrent_initializer,
    bias_initializer = bias_initializer,
    kernel_regularizer = kernel_regularizer,
    recurrent_regularizer = recurrent_regularizer,
    bias_regularizer = bias_regularizer,
    activity_regularizer = activity_regularizer,
    kernel_constraint = kernel_constraint,
    recurrent_constraint = recurrent_constraint,
    bias_constraint = bias_constraint,
    dropout = dropout,
    recurrent_dropout = recurrent_dropout,
    input_shape = normalize_shape(input_shape),
    batch_input_shape = normalize_shape(batch_input_shape),
    batch_size = as_nullable_integer(batch_size),
    dtype = dtype,
    name = name,
    trainable = trainable,
    weights = weights
  )
  
  if (keras_version() >= "2.0.5")
    args$return_state <- return_state
  
  create_layer(keras$layers$SimpleRNN, object, args)
}


#' Gated Recurrent Unit - Cho et al.
#' 
#' There are two variants. The default one is based on 1406.1078v3 and
#' has reset gate applied to hidden state before matrix multiplication. The
#' other one is based on original 1406.1078v1 and has the order reversed.
#' 
#' The second variant is compatible with CuDNNGRU (GPU-only) and allows
#' inference on CPU. Thus it has separate biases for `kernel` and
#' `recurrent_kernel`. Use `reset_after = TRUE` and
#' `recurrent_activation = "sigmoid"`.
#' 
#' @inheritParams layer_simple_rnn
#' 
#' @param recurrent_activation Activation function to use for the recurrent
#'   step.
#' @param reset_after GRU convention (whether to apply reset gate after or
#'   before matrix multiplication). FALSE = "before" (default),
#'   TRUE = "after" (CuDNN compatible).   
#'  
#'   
#' @template roxlate-recurrent-layer    
#' 
#' @section References: 
#' - [Learning Phrase Representations using RNN Encoder-Decoder for Statistical
#'    Machine Translation](https://arxiv.org/abs/1406.1078)
#' - [On the Properties of Neural Machine Translation:
#'   Encoder-Decoder Approaches](https://arxiv.org/abs/1409.1259) 
#' - [Empirical
#'   Evaluation of Gated Recurrent Neural Networks on Sequence
#'   Modeling](https://arxiv.org/abs/1412.3555v1) 
#' - [A Theoretically Grounded
#'   Application of Dropout in Recurrent Neural
#'   Networks](https://arxiv.org/abs/1512.05287)
#'     
#' @export
layer_gru <- function(object, units, activation = "tanh", recurrent_activation = "hard_sigmoid", use_bias = TRUE, 
                      return_sequences = FALSE, return_state = FALSE, go_backwards = FALSE, stateful = FALSE, unroll = FALSE, reset_after = FALSE,
                      kernel_initializer = "glorot_uniform", recurrent_initializer = "orthogonal", bias_initializer = "zeros", 
                      kernel_regularizer = NULL, recurrent_regularizer = NULL, bias_regularizer = NULL, activity_regularizer = NULL, 
                      kernel_constraint = NULL, recurrent_constraint = NULL, bias_constraint = NULL, 
                      dropout = 0.0, recurrent_dropout = 0.0, input_shape = NULL, batch_input_shape = NULL, batch_size = NULL, 
                      dtype = NULL, name = NULL, trainable = NULL, weights = NULL) {
  
  args <- list(
    units = as.integer(units),
    activation = activation,
    recurrent_activation = recurrent_activation,
    use_bias = use_bias,
    return_sequences = return_sequences,
    go_backwards = go_backwards,
    stateful = stateful,
    unroll = unroll,
    kernel_initializer = kernel_initializer,
    recurrent_initializer = recurrent_initializer,
    bias_initializer = bias_initializer,
    kernel_regularizer = kernel_regularizer,
    recurrent_regularizer = recurrent_regularizer,
    bias_regularizer = bias_regularizer,
    activity_regularizer = activity_regularizer,
    kernel_constraint = kernel_constraint,
    recurrent_constraint = recurrent_constraint,
    bias_constraint = bias_constraint,
    dropout = dropout,
    recurrent_dropout = recurrent_dropout,
    input_shape = normalize_shape(input_shape),
    batch_input_shape = normalize_shape(batch_input_shape),
    batch_size = as_nullable_integer(batch_size),
    dtype = dtype,
    name = name,
    trainable = trainable,
    weights = weights
  )
  
  if (keras_version() >= "2.0.5")
    args$return_state <- return_state
  
  if (keras_version() >= "2.1.5")
    args$reset_after <- reset_after
  
  create_layer(keras$layers$GRU, object, args)
}


#' Fast GRU implementation backed by [CuDNN](https://developer.nvidia.com/cudnn).
#' 
#' Can only be run on GPU, with the TensorFlow backend.
#' 
#' @inheritParams layer_simple_rnn
#' 
#' @family recurrent layers  
#' 
#' @section References: 
#' - [On the Properties of Neural Machine Translation:
#'   Encoder-Decoder Approaches](https://arxiv.org/abs/1409.1259) 
#' - [Empirical
#'   Evaluation of Gated Recurrent Neural Networks on Sequence
#'   Modeling](https://arxiv.org/abs/1412.3555v1) 
#' - [A Theoretically Grounded
#'   Application of Dropout in Recurrent Neural
#'   Networks](https://arxiv.org/abs/1512.05287)
#'
#' @export
layer_cudnn_gru <- function(object, units,
                            kernel_initializer = "glorot_uniform", recurrent_initializer = "orthogonal", bias_initializer = "zeros", 
                            kernel_regularizer = NULL, recurrent_regularizer = NULL, bias_regularizer = NULL, activity_regularizer = NULL, 
                            kernel_constraint = NULL, recurrent_constraint = NULL, bias_constraint = NULL,
                            return_sequences = FALSE, return_state = FALSE, stateful = FALSE,
                            input_shape = NULL, batch_input_shape = NULL, batch_size = NULL, 
                            dtype = NULL, name = NULL, trainable = NULL, weights = NULL) {
  args <- list(
    units = as.integer(units),
    kernel_initializer = kernel_initializer,
    recurrent_initializer = recurrent_initializer,
    bias_initializer = bias_initializer,
    kernel_regularizer = kernel_regularizer,
    recurrent_regularizer = recurrent_regularizer,
    bias_regularizer = bias_regularizer,
    activity_regularizer = activity_regularizer,
    kernel_constraint = kernel_constraint,
    recurrent_constraint = recurrent_constraint,
    bias_constraint = bias_constraint,
    return_sequences = return_sequences,
    return_state = return_state,
    stateful = stateful,
    input_shape = normalize_shape(input_shape),
    batch_input_shape = normalize_shape(batch_input_shape),
    batch_size = as_nullable_integer(batch_size),
    dtype = dtype,
    name = name,
    trainable = trainable,
    weights = weights
  )
  
  create_layer(keras$layers$CuDNNGRU, object, args)
}


#' Long Short-Term Memory unit - Hochreiter 1997.
#' 
#' For a step-by-step description of the algorithm, see [this tutorial](https://colah.github.io/posts/2015-08-Understanding-LSTMs/).
#' 
#' @inheritParams layer_gru
#' 
#' @param unit_forget_bias Boolean. If TRUE, add 1 to the bias of the forget
#'   gate at initialization. Setting it to true will also force
#'   `bias_initializer="zeros"`. This is recommended in [Jozefowicz et
#'   al.](https://www.jmlr.org/proceedings/papers/v37/jozefowicz15.pdf)
#'   
#' @template roxlate-recurrent-layer    
#'   
#' @section References: 
#' - [Long short-term memory](https://www.bioinf.jku.at/publications/older/2604.pdf) (original 1997 paper) 
#' - [Supervised sequence labeling with recurrent neural networks](https://www.cs.toronto.edu/~graves/preprint.pdf) 
#' - [A Theoretically Grounded Application of Dropout in Recurrent Neural Networks](https://arxiv.org/abs/1512.05287)
#'  
#' @family recurrent layers  
#'     
#' @export
layer_lstm <- function(object, units, activation = "tanh", recurrent_activation = "hard_sigmoid", use_bias = TRUE, 
                       return_sequences = FALSE, return_state = FALSE, go_backwards = FALSE, stateful = FALSE, unroll = FALSE,
                       kernel_initializer = "glorot_uniform", recurrent_initializer = "orthogonal", bias_initializer = "zeros", 
                       unit_forget_bias = TRUE, kernel_regularizer = NULL, recurrent_regularizer = NULL, bias_regularizer = NULL, 
                       activity_regularizer = NULL, kernel_constraint = NULL, recurrent_constraint = NULL, bias_constraint = NULL, 
                       dropout = 0.0, recurrent_dropout = 0.0, input_shape = NULL, batch_input_shape = NULL, batch_size = NULL, 
                       dtype = NULL, name = NULL, trainable = NULL, weights = NULL) {
  
  args <- list(
    units = as.integer(units),
    activation = activation,
    recurrent_activation = recurrent_activation,
    use_bias = use_bias,
    return_sequences = return_sequences,
    go_backwards = go_backwards,
    stateful = stateful,
    unroll = unroll,
    kernel_initializer = kernel_initializer,
    recurrent_initializer = recurrent_initializer,
    bias_initializer = bias_initializer,
    unit_forget_bias = unit_forget_bias,
    kernel_regularizer = kernel_regularizer,
    recurrent_regularizer = recurrent_regularizer,
    bias_regularizer = bias_regularizer,
    activity_regularizer = activity_regularizer,
    kernel_constraint = kernel_constraint,
    recurrent_constraint = recurrent_constraint,
    bias_constraint = bias_constraint,
    dropout = dropout,
    recurrent_dropout = recurrent_dropout,
    input_shape = normalize_shape(input_shape),
    batch_input_shape = normalize_shape(batch_input_shape),
    batch_size = as_nullable_integer(batch_size),
    dtype = dtype,
    name = name,
    trainable = trainable,
    weights = weights
  )
  
  if (keras_version() >= "2.0.5")
    args$return_state <- return_state
  
  create_layer(keras$layers$LSTM, object, args)
}

#' Fast LSTM implementation backed by [CuDNN](https://developer.nvidia.com/cudnn).
#' 
#' Can only be run on GPU, with the TensorFlow backend.
#'
#' @inheritParams layer_lstm
#' 
#' @section References: 
#' - [Long short-term memory](https://www.bioinf.jku.at/publications/older/2604.pdf) (original 1997 paper) 
#' - [Supervised sequence labeling with recurrent neural networks](https://www.cs.toronto.edu/~graves/preprint.pdf) 
#' - [A Theoretically Grounded Application of Dropout in Recurrent Neural Networks](https://arxiv.org/abs/1512.05287)
#'  
#' @family recurrent layers  
#' 
#' @export
layer_cudnn_lstm <- function(object, units, 
                             kernel_initializer = "glorot_uniform",  recurrent_initializer = "orthogonal", 
                             bias_initializer = "zeros",  unit_forget_bias = TRUE,
                             kernel_regularizer = NULL, recurrent_regularizer = NULL, bias_regularizer = NULL, activity_regularizer = NULL, 
                             kernel_constraint = NULL, recurrent_constraint = NULL, bias_constraint = NULL,
                             return_sequences = FALSE, return_state = FALSE, stateful = FALSE,
                             input_shape = NULL, batch_input_shape = NULL, batch_size = NULL, 
                             dtype = NULL, name = NULL, trainable = NULL, weights = NULL) {
  args <- list(
    units = as.integer(units),
    kernel_initializer = kernel_initializer,
    recurrent_initializer = recurrent_initializer,
    bias_initializer = bias_initializer,
    unit_forget_bias = unit_forget_bias,
    kernel_regularizer = kernel_regularizer,
    recurrent_regularizer = recurrent_regularizer,
    bias_regularizer = bias_regularizer,
    activity_regularizer = activity_regularizer,
    kernel_constraint = kernel_constraint,
    recurrent_constraint = recurrent_constraint,
    bias_constraint = bias_constraint,
    return_sequences = return_sequences,
    return_state = return_state,
    stateful = stateful,
    input_shape = normalize_shape(input_shape),
    batch_input_shape = normalize_shape(batch_input_shape),
    batch_size = as_nullable_integer(batch_size),
    dtype = dtype,
    name = name,
    trainable = trainable,
    weights = weights
  )
  
  create_layer(keras$layers$CuDNNLSTM, object, args)
}













