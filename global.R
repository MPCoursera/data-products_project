library(shiny)

all.packs <- installed.packages()[, 1]
d.sets <- lapply(all.packs, function(pack) {
    d <- as.data.frame(data(package=pack)$results[, c('Item', 'Title')],
                       stringsAsFactors=FALSE)
    d.names <- gsub('^.+\\(([^)]+)\\).*$', '\\1', d$Item)
    sort(setNames(d.names, d$Title))
})
d.sets <- Filter(function(x) length(x) > 0, d.sets)
d.sets <- d.sets[sort(names(d.sets))]

d.counts <- sapply(d.sets, function(x) length(x))
packs <- names(d.sets)
names(packs) <- paste(packs, paste0('(', d.counts, ')'))
