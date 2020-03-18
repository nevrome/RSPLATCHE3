#' @name export
#' @title write \strong{SPLATCHE3_...} to file
#'
#' @param x an object of class SPLATCHE3_settings
#' @param filename export file name
#' @param tmpdir a non-empty character vector giving a directory name
#' @param ... ignored
#'
#' @rdname export
#' @export
export <- function(x, filename, tmpdir, ...) {
  UseMethod("export")
}

#' @rdname export
#' @export
export.default <- function(x, filename, tmpdir, ...) {
  stop("x is not an object of a class with a defined export function.")
}

#' @rdname export
#' @export
export.SPLATCHE3_settings <- function(x, filename = "settings.txt", tmpdir, ...) {
  
  # export nested files and only keep a path to the file
  x_files_outsourced <- purrr::map2(x, names(x), function(y, name_y) {
    # check if the current object has a custom export function (S3)
    if ("export" %in% unlist(strsplit(as.character(methods(class = class(y)[grepl("SPLATCHE", class(y))] )), "\\.")) ) {
      export(y, name_y, tmpdir)
    # deal with raster objects (S4)
    } else if (inherits(y, "RasterBrick") || inherits(y, "RasterStack") || inherits(y, "RasterLayer")) {
      outfile <- file.path(tmpdir, paste0(name_y, ".asc"))
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
  outfile <- file.path(tmpdir, filename)
  base::writeLines(
    text = x_string_vector,
    con = outfile,
    sep = "\n"
  )
  
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_PopDensity <- function(x, filename, tmpdir, ...) {
  
  outfile <- file.path(tmpdir, filename)
  write(as.character(nrow(x)), outfile)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_Veg2dyn <- function(x, filename, tmpdir, ...) {
  
  outfile <- file.path(tmpdir, filename)
  write(as.character(nrow(x)), outfile)
  
  x$corresponding_table <- purrr::map2(x$corresponding_table, x$description, function(y, name_y) {
    export(y, paste(c(filename, name_y), collapse = "_"), tmpdir)
  })
  
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = " ") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_Veg2phase <- function(x, filename, tmpdir, ...) {
  
  outfile <- file.path(tmpdir, filename)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_ArrivalCell <- function(x, filename, tmpdir, ...) {
  
  outfile <- file.path(tmpdir, filename)
  write(as.character(nrow(x)), outfile)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_Sample <- function(x, filename, tmpdir, ...) {
  
  outfile <- file.path(tmpdir, paste0(filename, ".sam"))
  write(as.character(nrow(x)), outfile)
  x_character <- purrr::map_chr(
    as.list(as.data.frame(t(x))), function(y) { paste(as.character(y), collapse = "\t") }
  )
  write(x_character, outfile, append = T)
  return(outfile)
  
}

#' @rdname export
#' @export
export.SPLATCHE3_Genetic <- function(x, filename, tmpdir, ...) {
  
  outfile <- file.path(tmpdir,  paste0(filename, ".par"))
  write(x, outfile, append = T)
  return(outfile)
  
}
