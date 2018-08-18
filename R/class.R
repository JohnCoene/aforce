#' aforce R6 Class
#'
#' Create a VR force directed graph.
#'
#' @section Methods:
#' \itemize{
#'   \item{\code{set_nodes} Add nodes.}
#'   \item{\code{set_edges} Add edges.}
#'   \item{\code{plot} Plot graph}
#' }
#'
#' @export
aForce <- R6::R6Class("aForce", list(
  nodes = NULL,
  edges = NULL,
  set_nodes = function(data, ...){
    data <- .build_data(data, ...)
    data <- .as_list(data)
    self$nodes <- .as_json(data)
    invisible(self)
  },
  set_edges = function(data, ...){
    data <- .build_data(data, ...)
    data <- .as_list(data)
    self$edges <- .as_json(data)
    invisible(self)
  },
  plot = function(){

    tag <- glue::glue(
      "<a-entity forcegraph='",
      "nodes: {self$nodes}; ",
      "links: {self$edges}; ",
      "'></a-entity>"
    )

    g <- aframer::a_scene(
      aframer::a_camera(),
      htmltools::HTML(tag)
    )

    dep <- .get_dependency("aframe-forcegraph-component.min.js")

    htmltools::tagList(g, dep)
  })
)
