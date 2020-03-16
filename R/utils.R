#' quick setup of SPLATCHE3
#'
#' @param path character. Where the executable should be stored
#' @param os character. Operating system (Linux, Windows, Mac)
#' 
#' @return character. Path to executable 
#' 
#' @export
quick_setup <- function(path = "~/splatche3", os = "Linux") {
  
  zip_file <- tempfile()
  switch(
    os,
    "Linux" = utils::download.file("http://www.splatche.com/download/SPLATCHE3-Linux-64b.zip", zip_file),
    "Windows" = utils::download.file("http://www.splatche.com/download/SPLATCHE3_Win-64b.zip", zip_file),
    "Mac" = utils::download.file("http://www.splatche.com/download/SPLATCHE3-MacOs-64b.zip", zip_file)
  )
  
  utils::unzip(zip_file, exdir = path)
  
  exe <- file.path(path, "splatche3")
  switch(
    os,
    "Linux" = file.rename(file.path(path, "SPLATCHE3-Linux-64b"), exe),
    "Windows" = file.rename(file.path(path, "SPLATCHE3-Win-64b.exe"), exe),
    "Mac" = file.rename(file.path(path, "SPLATCHE3-MacOs-64b"), exe),
  )
  
  Sys.chmod(exe, mode = "0777")
  
  return(exe)
  
}
