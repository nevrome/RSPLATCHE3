#' run SPLATCHE3
#'
#' @param settings object of class SPLATCHE3_settings
#' @param output character. Path to output directory
#' @param exe character. Path to SPLATCHE3 executable
#'
#' @return
#' 
#' @export
run <- function(settings, output = file.path(tempdir(), "splatche3", "log"), exe = "~/splatche3/splatche3") {
  
  # export settings file
  settings_file <- tempfile()
  export(SPLATCHE3_settings, settings_file)
  
  # run splatche in output dir to have all the results there
  cur_wd <- getwd()
  dir.create(output, recursive = T)
  setwd(output)
  try(system(command = paste0(normalizePath(exe), " ", settings_file)))
  setwd(cur_wd)
  
  # print logfile to R console
  cat("\n-------------------------------------------------------\n")
  cat(readLines(file.path(output, "SPLATCHE3.log")), sep = "\n")
  cat("-------------------------------------------------------\n\n")
  
  return(output)
}