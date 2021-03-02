ggplotchangepoint <-
  function(data, changes = 1) {
    library(changepoint)
    library(ggplot2)
    mcpt <- cpt.mean(data$x, method = 'BinSeg', Q = changes)
    mcpt.pts <- attributes(mcpt)$cpts
    mcpt.mean <- attributes(mcpt)$param.est$mean
    data$mean <- rep(mcpt.mean, c(mcpt.pts[1], diff(mcpt.pts)))
    ggplot(data)
  }
