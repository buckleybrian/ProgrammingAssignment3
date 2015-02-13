complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    all<-data.frame()
    for(csvF in rep(id)){
        pollutantData<-read.table(paste(directory,"/",sprintf("%03d", csvF),".csv",sep=""),sep=",",header=TRUE)
        all<-rbind(all,cbind(csvF,nrow(pollutantData[complete.cases(pollutantData),])))
    }
    colnames(all)<-c("id","nobs")
    all
}