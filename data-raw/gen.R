
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

nodes$color <- colorRampPalette(c("#FF005C", "#02C6FF", "#008976", "#dddc37"))(nrow(nodes))
nodes$val <- round(runif(nrow(nodes), 1, 10))
nodes$label <- nodes$id

some_nodes <- nodes
some_links <- links

devtools::use_data(some_nodes, some_links, overwrite = TRUE)
