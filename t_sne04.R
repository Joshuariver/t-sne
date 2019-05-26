rm(list=ls())
setwd("~/R/T-SNE")


traindata <- read.table("optdigits.tra", sep=",")
trn <- data.matrix(traindata)

require(Rtsne)

# perform dimensionality redcution from 64D to 2D
tsne <- Rtsne(as.matrix(trn[,1:64]), check_duplicates = FALSE, pca = FALSE, perplexity=30, theta=0.5, dims=2)

# display the results of t-SNE
cols <- rainbow(10)
plot(tsne$Y, t='n')
text(tsne$Y, labels=trn[,65], col=cols[trn[,65] +1])
