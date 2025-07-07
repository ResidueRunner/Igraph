#Random graph 

n<-100
m<-200
?sample_gnm
random<-sample_gnm(n,m)
plot(random,main="random_graph",vertex.size=10, vertex.label=NA)
random_deg<-degree_distribution(random)
plot(random_deg,main="degree distribution of random network",xlab="Degree",ylab="Nodes",col="skyblue",type="o")

#Barabasi graph

n=100
m=1
barabasi<-sample_pa(n,power=1,m=1)
plot(barabasi,main="barabasi_Scalefreee_graph",vertex.size=10, vertex.label=NA)
scalefree_deg<-degree_distribution(barabasi)
plot(scalefree_deg,main="degree distribution(scalefree) of Barabasi network",xlab="Degree",ylab="Nodes",col="skyblue",type="o")


# Create network and count number of nodes & edges

?graph
g1<-make_graph(edges=c(1,2,2,3,3,1),n=3,directed=F)
g1 
plot(g1)
V(g1)
E(g1)

#READ NETWORK FROM FILE

file.choose()
yeast_ppi<-read.table("C:/Users/HP/Downloads/Yeast_PPI.txt",header=T)
head(yeast_ppi)
yeast_ppi_graph<-graph_from_data_frame(yeast_ppi, directed=F)
plot(yeast_ppi_graph,vertex.size=10,vertex=10,vertex.lable=NA)
yeast_ppi_graph
yeast_ppi_graph<-graph_from_data_frame(yeast_ppi, directed=F)
plot(yeast_ppi_graph,vertex.size=10,vertex=10,vertex.lable=NA)
yeast_ppi_graph
plot(yeast_ppi_graph)
V(yeast_ppi_graph)
E(yeast_ppi_graph)
degree(yeast_ppi_graph)
degree_distribution(yeast_ppi_graph)
betweenness(yeast_ppi_graph)
closeness(yeast_ppi_graph)
edge.betweenness(yeast_ppi_graph)
yeast_network_dis=degree_distribution(yeast_ppi_graph)
plot(yeast_network_dis,main="degree_distribution(yeast_ppi_graph)" ,xlab="Degree",ylab="Nodes",col="skyblue",type="o")


#cluster

cluster=cluster_edge_betweenness(yeast_ppi_graph)
plot(cluster,yeast_ppi_graph)


