#' aforce R6 Class
#'
#' Create a VR force directed graph.
#'
#' @section Methods:
#' \itemize{
#'   \item{\code{nodes} Add nodes.}
#'   \item{\code{edges} Add edges.}
#'   \item{\code{build} Build graph}
#'   \item{\code{get} Get graph}
#'   \item{\code{browse} Browse graph}
#'   \item{\code{embed} Embed graph}
#' }
#'
#' @examples
#' if(interactive()){
#'   graph <- aForce$
#'     new()$
#'     nodes(some_nodes, id, val, color)$
#'     links(some_links, source, target)$
#'     build()$
#'     get()
#'
#'   aframer::browse_aframe(graph)
#' }
#'
#' @seealso \href{https://github.com/vasturiano/aframe-forcegraph-component}{official page}.
#'
#' @export
aForce <- R6::R6Class("aForce", list(
  initialize = function(dim = 3, n_rel_size = 4, n_id = "id", n_label = "name",
                        n_desc = "desc", n_val = "val", n_res = 8, n_color = "color",
                        n_opacity = .75, l_src = "source", l_tgt = "target", l_label = "name",
                        l_vis = TRUE, l_desc = "desc", l_hover = 2, l_color = "color",
                        l_opacity = .2, l_width = 0, l_res = 6, l_curve = 0, l_curve_rot = 0,
												width = "100%", height = "400px"){
    opts <- list(
      `num-dimensions` = dim,
      `node-rel-size` = n_rel_size,
      `node-id` = n_id,
      `node-label` = n_label,
      `node-desc` = n_desc,
      `node-val` = n_val,
      `node-resolution` = n_res,
      `node-color` = n_color,
      `node-opacity` = n_opacity,
      `link-source` = l_src,
      `link-target` = l_tgt,
      `link-visibility` = tolower(l_vis),
      `link-label` = l_label,
      `link-desc` = l_desc,
      `link-hover-precision` = l_hover,
      `link-color` = l_color,
      `link-opacity` = l_opacity,
      `link-width` = l_width,
      `link-resolution` = l_res,
      `link-curvature` = l_curve,
      `link-curve-rotation` = l_curve_rot
    )

    private$options <- opts

  },
  nodes = function(data, ...){
    data <- .build_data(data, ...)
    data <- .as_list(data)
    private$nodes_data <- .as_json(data)
    invisible(self)
  },
  links = function(data, ...){
    data <- .build_data(data, ...)
    data <- .as_list(data)
    private$links_data <- .as_json(data)
    invisible(self)
  },
  build = function(...){

    opts <- glue::glue('{names(private$options)}: {private$options}; ')

    tag <- glue::glue(
      "<a-entity forcegraph='",
      glue::glue_collapse(opts, sep = ""),
      "nodes: {private$nodes_data}; ",
      "links: {private$links_data}; ",
      "'></a-entity>"
    )

    private$plot <- aframer::a_scene(
      aframer::a_dependency(version = "0.8.2"),
      .get_dependency("aframe-forcegraph-component.min.js"),
      ...,
      htmltools::HTML(tag)
    )
    invisible(self)
  },
  get = function(){
    return(private$plot)
  },
  browse = function(){
    aframer::browse_aframe(private$plot)
  },
  embed = function(width = "100%", height = "400px", ...){
    style <- glue::glue("width:{width};height:{height};", ...)

    a <- private$plot

    aframer::embed_aframe(a, width, height)
  }),
  private = list(
    plot = NULL,
    nodes_data = NULL,
    links_data = NULL,
    options = list()
  )
)
