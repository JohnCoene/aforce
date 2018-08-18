.build_data <- function(data, ...){
  dplyr::select(data, ...)
}

.as_list <- function(data){
  data <- apply(data, 1, as.list)
  unname(data)
}

.as_json <- function(x){
  jsonlite::toJSON(x, auto_unbox = TRUE, force = TRUE)
  #gsub("\"", "'", x)
}

.get_dependency <- function(script){
  htmltools::htmlDependency(
    name = "aframe-force",
    version = "0.8.0",
    src = system.file("aframe-force", package = "aforce"),
    script = script)
}
