#' @name SPLATCHE3_basic
#' @title class functions
#'
#' @param x an object
#' @param ... ignored
#'
#' @rdname SPLATCHE3_basic
#' @export
as.SPLATCHE3_settings <- function(x, ...) {
  class(x) <- c("SPLATCHE3_settings", class(x))
  return(x)
}

#' @rdname SPLATCHE3_basic
#' @export
is.SPLATCHE3_settings <- function(x, ...) {
  "SPLATCHE3_settings" %in% class(x)
}

#' @rdname SPLATCHE3_basic
#' @export
as.SPLATCHE3_PopDensity <- function(x, ...) {
  return(tibble::new_tibble(x, nrow = nrow(x), class = "SPLATCHE3_PopDensity"))
}

#' @rdname SPLATCHE3_basic
#' @export
is.SPLATCHE3_PopDensity <- function(x, ...) {
  "SPLATCHE3_PopDensity" %in% class(x)
}