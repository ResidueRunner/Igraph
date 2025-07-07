library(igraph)#load the library

file.choose()#choose the file to get path

#read the file
data<-read.table("C:/Users/HP/Downloads/Yeast_PPI.txt",header=T)
data
#convert file to graph
graph<- graph_from_data_frame(data,directed=FALSE)
#count the number of vertices
vcount(graph)#4687
ecount(graph)#14500

#DELELT THE VERTEX "YML064C"
graph1<-delete_vertices(graph,"YML064C")
vcount(graph1)
ecount(graph1)

#calcultae degree of network
degree(graph1)
deg<-degree(graph1)
deg

#sorting the vector base on dgree using sort function
deg_sort<-sort(deg,decreasing = TRUE)
deg_sort[5]

#to delete the 5th node
print(paste(" the 5th node is sorted:", deg_sort[5]))
graph2=vert_del=delete.vertices(graph1,"YPR086W")
ecount(graph2)
vcount(graph2)

#without rplacement
# write a for loop to delete to 1:100 node based on degree
#and print number of vertices and edge
library(igraph)#load the library
file.choose()#choose the file to get path

#read the file
data<-read.table("C:/Users/HP/Downloads/Yeast_PPI.txt",header=T)

#convert file to graph
graph<- graph_from_data_frame(data,directed=FALSE)
graph



graph_new<-graph
output=vector()
for (i in 1:100){
  graph_new<-delete_vertices(graph_new,deg_sort[i])
  print(paste(vcount(graph_new),ecount(graph_new),sep=" "))
  output <- append(output,mean_distance(graph_new))
}
output
plot(output, col="red",xlab="number of nodes removed", ylab ="APL")

#for random remmooval
graph_f<-graph
output1=vector()
for( i in 1:100){
  r=runif(1,1,4680)
  graph_f<-delete.vertices(graph_f,deg_sort[r])
  #print(paste(vcount(graph_f), ecount(graph_f),sep=" "))
  output1<-append(output,mean_distance(graph_f))
}
output1
plot(output1, col="blue", xlab="number pf nodes removed", ylab="APL")

# ploting the graph
graph_new <- graph
graph_newr=graph
output<-c()
output<-c()
for(i in 1:100){
  r<-sample(1:vcount(graph),1)
  graph_new<-delete.vertices(graph_new,deg_sort[i])
  graph_newr<-delete.vertices(graph_newr,deg_sort[r])
  
  #print(paste(vcount(graph_new),ecount(graph_new),sep=" "))
  output<-append(output,mean_distance(graph_new))
  output1<-append(output1,mean_distance(graph_newr))
}
output
range(output1)
plot(output,col="red",xlab="number of nodes removed",ylab="APL",ylin=c(4.22,4.3),type="l")
lines(output1,col="blue")

# Plot Largest Component Size
plot(largest_comp, col="blue", type="o",
     xlab="Nodes Removed", ylab="Largest Component Size",
     main="Effect on Largest Component Size")

# Plot Diameter
plot(diameter_values, col="green", type="o",
     xlab="Nodes Removed", ylab="Diameter",
     main="Effect on Graph Diameter")

# Plot Number of Clusters
plot(cluster_counts, col="purple", type="o",
     xlab="Nodes Removed", ylab="Number of Clusters",
     main="Effect on Number of Clusters")

# Reset plotting layout
par(mfrow=c(1,1))
#Explanation:
