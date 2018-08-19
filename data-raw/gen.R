
nodes <- data.frame(
  name = paste0(LETTERS, 1:100, LETTERS)
)

links <- data.frame(
  from = sample(nodes$name, 150, replace = TRUE),
  to = sample(nodes$name, 150, replace = TRUE)
)

names(links) <- c("source", "target")
names(nodes) <- "id"
row.names(nodes) <- NULL

nodes$color <- colorRampPalette(c("#B1E2A3", "#98D3A5", "#328983", "#1C5C70", "#24C96B"))(nrow(nodes))
nodes$val <- round(runif(nrow(nodes), 1, 10))
nodes$label <- nodes$id

some_nodes <- nodes
some_links <- links

devtools::use_data(some_nodes, some_links, overwrite = TRUE)
