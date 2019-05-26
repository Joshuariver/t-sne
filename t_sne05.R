rm(list=ls())
setwd("~/R/T-SNE/sac")

# "Shelter Animal Data
trn <- read.csv("train.csv")
trn <- data.matrix(trn)

require(Rtsne)

# scale the data first prior to running t-SNE
trn[,-1]  <- scale(trn[,-1])

tsne <- Rtsne(trn[,-1], check_duplicates = FALSE, pca = FALSE, perplexity=50, theta=0.5, dims=2)

# display the results of t-SNE
cols <- rainbow(5)
plot(tsne$Y, t='n')
text(tsne$Y, labels=as.numeric(trn[,1]), col=cols[trn[,1]])


tsne <- Rtsne(trn[,-1], check_duplicates = FALSE, pca = FALSE, perplexity=50, theta=0.5, dims=2)

#display results of t-SNE in 3D
require(rgl)
plot3d(tsne$Y, col=cols[trn[,1]])
legend3d("topright", legend = '0':'5', pch = 16, col = rainbow(5))
