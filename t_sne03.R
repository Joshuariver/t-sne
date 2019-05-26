rm(list=ls())
setwd("~/R/T-SNE")


traindata <- read.table("optdigits.tra", sep=",")
trn <- data.matrix(traindata)

require(tsne)

cols <- rainbow(10)

# this is the epoch callback function used by tsne. 
# x is an NxK table where N is the number of data rows passed to tsne, and K is the dimension of the map. 
# Here, K is 2, since we use tsne to map the rows to a 2D representation (map).
ecb = function(x, y){ plot(x, t='n'); text(x, labels=trn[,65], col=cols[trn[,65] +1]); }

tsne_res = tsne(trn[,1:64], epoch_callback = ecb, perplexity=50, epoch=50)
