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

#' @rdname SPLATCHE3_basic
#' @export
as.SPLATCHE3_Veg2dyn <- function(x, ...) {
  return(tibble::new_tibble(x, nrow = nrow(x), class = "SPLATCHE3_Veg2dyn"))
}

#' @rdname SPLATCHE3_basic
#' @export
is.SPLATCHE3_Veg2dyn <- function(x, ...) {
  "SPLATCHE3_Veg2dyn" %in% class(x)
}

#' @rdname SPLATCHE3_basic
#' @export
as.SPLATCHE3_Veg2phase <- function(x, ...) {
  return(tibble::new_tibble(x, nrow = nrow(x), class = "SPLATCHE3_Veg2phase"))
}

#' @rdname SPLATCHE3_basic
#' @export
is.SPLATCHE3_Veg2phase <- function(x, ...) {
  "SPLATCHE3_Veg2phase" %in% class(x)
}

#' @rdname SPLATCHE3_basic
#' @export
as.SPLATCHE3_ArrivalCell <- function(x, ...) {
  return(tibble::new_tibble(x, nrow = nrow(x), class = "SPLATCHE3_ArrivalCell"))
}

#' @rdname SPLATCHE3_basic
#' @export
is.SPLATCHE3_ArrivalCell <- function(x, ...) {
  "SPLATCHE3_ArrivalCell" %in% class(x)
}

#' @rdname SPLATCHE3_basic
#' @export
as.SPLATCHE3_Sample <- function(x, ...) {
  return(tibble::new_tibble(x, nrow = nrow(x), class = "SPLATCHE3_Sample"))
}

#' @rdname SPLATCHE3_basic
#' @export
is.SPLATCHE3_Sample <- function(x, ...) {
  "SPLATCHE3_Sample" %in% class(x)
}

#' @rdname SPLATCHE3_basic
#' @export
as.SPLATCHE3_Genetic <- function(x, ...) {
  class(x) <- c("SPLATCHE3_Genetic", class(x))
  return(x)
}

#' @rdname SPLATCHE3_basic
#' @export
is.SPLATCHE3_Genetic <- function(x, ...) {
  "SPLATCHE3_Genetic" %in% class(x)
}
