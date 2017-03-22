# Hierarchical Clustering

# Importing the dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]

# Using the dendogram to find the optimal number of clusters
dendogram = hclust(dist(X, method = 'euclidean'),method = 'ward.D')
plot(dendogram,main = 'Dendogram',xlab = 'Customers',ylab = 'Euclidean Distances')

#Fitting the hierarchical Clustering to the dataset
hc = hclust(dist(X, method = 'euclidean'),method = 'ward.D')
y_hc = cutree(hc,5)

# Visualizing the clusters
library(cluster)
clusplot(X,y_hc,lines = 0, shade = TRUE, color = TRUE,
         labels = 2, plotchar = FALSE, span = TRUE, main = "Cluster of Clients",
         xlab ="Annual Income", ylab = "Spending Score")