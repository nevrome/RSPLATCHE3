#' run SPLATCHE3
#'
#' @param settings object of class SPLATCHE3_settings
#' @param tmpdir character. Path to output_dir directory
#' @param exe character. Path to SPLATCHE3 executable
#'
#' @return
#' 
#' @export
run <- function(settings, tmpdir = "~/test/splatche", exe = "~/splatche3/splatche3") {
  
  output_dir <- normalizePath(tmpdir)
  
  # export settings file
  settings_file <- export(settings, tmpdir = output_dir)
  
  # run splatche in output_dir dir to have all the results there
  cur_wd <- getwd()
  dir.create(output_dir, recursive = T)
  setwd(output_dir)
  try(system(command = paste0(normalizePath(exe), " ", settings_file)))
  setwd(cur_wd)
  
  # print logfile to R console
  cat("\n-------------------------------------------------------\n")
  cat(readLines(file.path(output_dir, "SPLATCHE3.log")), sep = "\n")
  cat("-------------------------------------------------------\n\n")
  
  return(output_dir)
}