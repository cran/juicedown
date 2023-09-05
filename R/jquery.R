
jquery <- function(){
  jq <- if (the$jquery %||% FALSE) {
    # the$jquery is TRUE if this function has been already called.
    # NULL means FALSE, so go to else block...
    NULL
  } else {
    the$jquery <- TRUE
    the$js <- c(the$js, const$jquery)
  }
  invisible()
}

jquery_modal <- function() {
  jq <- jquery()
  jqm <- if (the$jquery_modal %||% FALSE) {
    # the$jquery_modal is TRUE if this function has been already called.
    # NULL means FALSE, so go to else block...
    NULL
  } else {
    the$jquery_modal <- TRUE
    the$js <- c(the$js, const$jquery_modal, const$juicedown_modal)
  }
  invisible()
}
