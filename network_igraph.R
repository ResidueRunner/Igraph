install.packages("igraph",dependencies=T)
library(igraph)

#1. Random and Barabasi graph
n <- 100
m <- 200
?sample_gnm
random <- sample_gnm(n,m)
plot(random, main= "random_graph", vertex.size = 10, vertex.label = NA)
random_deg <- degree_distribution(random)
plot(random_deg, main = "degree distribution of random network", 
     xlab="Degree", ylab="Nodes",col="skyblue", type= "o")

?sample_pa
barabasi <- sample_pa(n, m =1, directed =F)
plot(barabasi, main= "barabasi_graph", vertex.size = 10, vertex.label = NA)
barabasi_deg <- degree_distribution(barabasi)
plot(barabasi_deg, main = "degree distribution of barabasi network", 
     xlab="Degree", ylab="Nodes",col="skyblue", type= "o")
barabasi <- sample_pa(n, m =5, directed =F)

#Create a network
?make_graph
g1 <- make_graph(edges = c(1,2,2,3,3,1), n=3, directed =F)
g1
plot(g1)
V(g1)
E(g1)

#Read network from a file
file.choose()
yeast_ppi <- read.table("/home/bif/Downloads/Yeast_PPI.txt", header=T, sep="\t")
head(yeast_ppi)
yeast_ppi_graph <- graph_from_data_frame(yeast_ppi, directed=F)
plot(yeast_ppi_graph,vertex.size = 10, vertex.label = NA)
ecount(yeast_ppi_graph)
vcount(yeast_ppi_graph)

deg <- degree(yeast_ppi_graph)
bet <- betweenness(yeast_ppi_graph)
table <- data.frame(deg,bet)
head(table)
#Find cluster using edge betweenness
cluster <- cluster_edge_betweenness(yeast_ppi_graph)
plot(cluster,yeast_ppi_graph)

head(yeast_ppi)


