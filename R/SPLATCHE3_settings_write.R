#' @name write_settings
#' @title write \strong{SPLATCHE3_settings}s to files
#'
#' @param x an object of class SPLATCHE3_settings
#' @param con a connection object or a character string
#' @param ... ignored
#'
#' @examples
#' #write_settings(
#' #   example_SPLATCHE3_settings
#' #)
#'
#' @rdname write_settings
#' @export
write_settings <- function(x, con = tempfile(), ...) {
  UseMethod("write_settings")
}

#' @rdname write_settings
#' @export
write_settings.default <- function(x, con = tempfile(), ...) {
  stop("x is not an object of class SPLATCHE3_settings")
}

#' @rdname write_settings
#' @export
write_settings.SPLATCHE3_settings <- function(x, con = tempfile(), ...) {
  
  x_files_outsourced <- purrr::map(x, function(y) {
    if (inherits(y, "RasterBrick") || inherits(y, "RasterStack") || inherits(y, "RasterLayer")) {
      write_raster(y)
    } else {
      y
    }
  })
  
  x_string_vector <- purrr::map2_chr(names(x_files_outsourced), x_files_outsourced, function(x, y) {
    paste0(x, "=", y)
  })
  
  base::writeLines(
    text = x_string_vector,
    con = con,
    sep = "\n"
  )
  
}

write_raster <- function(x) {
  outfile <- tempfile()
  raster::writeRaster(x, outfile, "ascii")
  return(outfile)
}
