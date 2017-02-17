require(readxl)
dir="/home/afonso/Small/Dengue"
setwd(dir)
read_excel_allsheets <- function(filename,removeSheet=NULL,s=0,cond=TRUE) {
  sheets <- readxl::excel_sheets(filename)
  sheets = sheets[-removeSheet]
  x <-    lapply(sheets, function(X) readxl::read_excel(filename, sheet = X,
                                                        skip = s,
                                                        col_names = cond))
  names(x) <- sheets
  x
}
mysheets <- read_excel_allsheets("data.xlsx",removeSheet = 1,s=5)
mysheets
names(mysheets)

regions=mysheets[[1]][,1][1:33]
regions

for(i in 1:length(names(mysheets))){
  mysheets[[i]]=mysheets[[i]][,!is.na(names(mysheets[[1]]))]
  mysheets[[i]]=subset(mysheets[[i]],select=-c(TOTAL))
  mysheets[[i]]=mysheets[[i]][1:33,]
}
mysheets[[1]][1]
