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
library(aforce)

data("some_nodes")
data("some_links")

aForce$
  new(n_label = "label")$ # initialise
  nodes(some_nodes, id, val, color, label)$ # add nodes
  links(some_links, source, target)$ # add edges
  build( # build
    aframer::a_camera(
      `wasd-controls` = "fly: true; acceleration: 600",
      aframer::a_cursor(opacity = 0.5)
    ),
    aframer::a_sky(color="#4c4c4c")
  )$ 
  browse() # browse graph
```

![output](aforce.png)
