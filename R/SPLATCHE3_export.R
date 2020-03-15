#' @name export
#' @title write \strong{SPLATCHE3_settings} to file
#'
#' @param x an object of class SPLATCHE3_settings
#' @param con a connection object or a character string
#' @param ... ignored
#'
#' @rdname export
#' @export
export <- function(x, con = tempfile(), ...) {
  UseMethod("export")
}

#' @rdname export
#' @export
export.default <- function(x, con = tempfile(), ...) {
  stop("x is not an object of a class with a defined export function.")
}

#' @rdname export
#' @export
export.SPLATCHE3_settings <- function(x, con = tempfile(), ...) {
  
  x_files_outsourced <- purrr::map(x, function(y) {
    # check if the current object has a custom export function
    if ("export" %in% unlist(strsplit(as.character(methods(class = class(y))), "\\.")) ) {
      export(y)
    } else if (inherits(y, "RasterBrick") || inherits(y, "RasterStack") || inherits(y, "RasterLayer")) {
      outfile <- tempfile()
      raster::writeRaster(y, outfile, "ascii")
      return(outfile)
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

#' @rdname export
#' @export
export.SPLATCHE3_PopDensity <- function(x, con = tempfile(), ...) {
  
  outfile <- tempfile()
  writeLines(as.character(nrow(x)), outfile)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  writeLines(x_character, outfile)
  return(outfile)
  
}