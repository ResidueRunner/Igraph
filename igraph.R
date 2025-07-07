install.packages("igraph")  # If not already installed
library(igraph)


# Generate a random graph using Erdos-Renyi model
random_graph <- erdos.renyi.game(n = 100, p = 0.05, directed = FALSE)
random_graph
# Generate a scale-free network using the Barabási-Albert model
barabasi_graph <- barabasi.game(n = 100, power = 1, directed = FALSE)


file_path <- file.choose()  # Opens a dialog to select the file
ppi_data <- read.table(file_path, header = FALSE, stringsAsFactors = FALSE)



# Plot the degree distributions
ppi_data <- read.table("Yeast_PPI.txt", header = FALSE, stringsAsFactors = FALSE)
ppi_network <- graph_from_edgelist(as.matrix(ppi_data), directed = FALSE)

# Calculate Centrality Measures
degree_centrality <- degree(ppi_network)
betweenness_centrality <- betweenness(ppi_network)
closeness_centrality <- closeness(ppi_network)

# Store in a data frame
  centrality_measures <- data.frame(
  Node = names(degree_centrality),
  Degree = degree_centrality,
  Betweenness = betweenness_centrality,
  Closeness = closeness_centrality
)

# Save to a file
write.csv(centrality_measures, "centrality_measures.csv", row.names = FALSE)


#cluster_edge_betweenness
communities <- cluster_edge_betweenness(ppi_network)
membership <- membership(communities)

# Save results
write.csv(data.frame(Node = names(membership), Community = membership), "modules.csv", row.names = FALSE)

