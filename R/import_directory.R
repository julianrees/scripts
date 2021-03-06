import_directory <- function(directory, fileextension, separator, header) {
  # this function imports all files of a specified filetype (extension) into the workspace
  files = dir(directory)
  for(f in files){
    strg <- paste(directory, f, sep = "")
    dname = strsplit(f, fileextension)[1]
    a <- paste("assign('",as.character(dname),
               "', read.csv(strg, sep ='", separator, "', header =",
               header,"), envir = .GlobalEnv)",
               sep = "")
    eval(parse(text = a))
  }
}
