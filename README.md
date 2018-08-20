# aforce

3D Virtual Force Directed Graph in R.

![logo](man/figures/logo.png)

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/aforce")
```

## Example

``` r
graph <- aForce$
  new()$
  nodes(some_nodes, id, val, color)$
  links(some_links, source, target)$
  plot()

aframer::browse_aframe(graph)
```

![output](aforce.png)
