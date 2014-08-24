# Load library to run file using knit
library(knitr)

# Run the file to generate md and html files
knit('pmacl.Rmd', output = 'pmacl.md')
knit('pmacl.Rmd', output = 'pmacl.html')

# Run the function provided by coursera for submission

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}


x <- test_data
x <- x[train_subset[train_subset!='classe']]
answers <- predict(model.rf, newdata=x)

answers

pml_write_files(answers)