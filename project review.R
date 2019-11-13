library(arules)
library(arulesViz)
library(RColorBrewer)

data(Groceries)
str(Groceries)
head(Groceries@itemInfo,n=12)
data <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("b","e"),
  c("b","c","e"),
  c("a","d","e"),
  c("a","c"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e"),
  c("a",'b','e','c')
)
data <- as(data, "transactions")

inspect(data)

#Convert transactions to transaction ID lists

tl <- as(data, "tidLists")
inspect(tl)

inspect(data)
inspect(tl)

summary(Groceries)

rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.80))

inspect(rules[1:10])


arules::itemFrequencyPlot(Groceries,topN=20,col=brewer.pal(8,'Pastel2'),main='Relative Item Frequency Plot',type="relative",ylab="Item Frequency (Relative)")



#graphical repersentaion

plot(rules[1:20],
     
     method = "graph",
     
     control = list(type = "items"))

#indiviual rule

plot(rules[1:20],
     
     method = "paracoord",
     
     control = list(reorder = TRUE))
  
plot(rules[1:20],method = "matrix",control = list(reorder = TRUE))

plot(arulesViz::plotly_arules(rules))

     
     