rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcome_data <- read.csv2("outcome-of-care-measures.csv",sep=",",colClasses="character")
  hospitalranks<-data.frame()
  
  ## Check that state and outcome are valid
  if(!(outcome_data$State[1] %in% outcome_data[,7]))
      stop("invalid state")
  if(!(outcome %in% c('heart attack','heart failure','pneumonia')))
    stop("invalid outcome")
  
  ## For each state, find the hospital of the given rank
  for(state in unique(outcome_data$State)){
    hospitalranks<-rbind(hospitalranks,data.frame(hospital=rankhospital(state, outcome, num),state=state))
  }  
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  hospitalranks[order(as.character(hospitalranks$state)),]
}