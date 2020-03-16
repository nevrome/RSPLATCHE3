#' @name export
#' @title write \strong{SPLATCHE3_...} to file
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
  
  # export nested files and only keep a path to the file
  x_files_outsourced <- purrr::map(x, function(y) {
    # check if the current object has a custom export function (S3)
    if ("export" %in% unlist(strsplit(as.character(methods(class = class(y))), "\\.")) ) {
      export(y)
    # deal with raster objects (S4)
    } else if (inherits(y, "RasterBrick") || inherits(y, "RasterStack") || inherits(y, "RasterLayer")) {
      outfile <- tempfile()
      raster::writeRaster(y, outfile, "ascii")
      return(outfile)
    # for all simple parameters
    } else {
      y
    }
  })
  
  # remove NA values
  x_files_outsourced_without_NA <- x_files_outsourced[!is.na(x_files_outsourced)]
  
  # list to character vector
  x_string_vector <- purrr::map2_chr(names(x_files_outsourced_without_NA), x_files_outsourced_without_NA, function(x, y) {
    paste0(x, "=", y)
  })
  
  # write character vector to files
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
  write(as.character(nrow(x)), outfile)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_Veg2dyn <- function(x, con = tempfile(), ...) {
  
  outfile <- tempfile()
  write(as.character(nrow(x)), outfile)
  
  x$corresponding_table <- sapply(x$corresponding_table, function(y) {
    export(y)
  })
  
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = " ") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_Veg2phase <- function(x, con = tempfile(), ...) {
  
  outfile <- tempfile()
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_ArrivalCell <- function(x, con = tempfile(), ...) {
  
  outfile <- tempfile()
  write(as.character(nrow(x)), outfile)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_Sample <- function(x, con = tempfile(), ...) {
  
  outfile <- tempfile()
  write(as.character(nrow(x)), outfile)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}
