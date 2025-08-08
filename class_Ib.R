#after completion of point number 1 & 2
#subfolders
  #raw_data
  #clean_data
  #scripts
  #results
  #plots

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

#3. data nalysis of given dataet
#loading of data into R environment

data <-read.csv(file.choose())
View(data)

#inspecting the structure of data
str(data)

#variables with inconsistent data type sare gender and diagnosis
#all other variables were correct
#gender and doganosis are categorical data type
#hence it will be converted to factor

#gender data
data$gender <- as.factor(data$gender)
str(data)
levels(data$gender)

#dignosis data
data$diagnosis <- as.factor(data$diagnosis)
class(data$diagnosis)

data$diagnosis <- factor (data$diagnosis,
                          levels = c ("normal", "Cancer"))
data$diagnosis

#new variable to smoker
data$smoker_binary <- as.factor(data$smoker)
str(data)

#factor conversion to numeric
data$smoker_binary  <- ifelse(data$smoker_binary == "Yes",1,0)
class(data$smoker_binary)


#saving file in csv format 
write.csv(data, file = "clean_data/pateint_info.csv")
