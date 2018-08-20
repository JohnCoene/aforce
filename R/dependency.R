#' Attach dependency
#'
#' Attach aframe forcegraph dependency.
#'
#' @note Only useful when using \code{aforce} in conjunction with other aframe packages.
#'
#' @export
af_dependency <- function(){
  .get_dependency("aframe-forcegraph-component.min.js")
}
