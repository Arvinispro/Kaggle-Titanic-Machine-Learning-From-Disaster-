data <- read.csv('train.csv')

Y <- data$Survived
age <- data$Age
data$Sex <- as.numeric(data$Sex == "female") #Make male = 0, female = 1
sex <- data$Sex
sib <- data$SibSp
par <- data$Parch
fare <- data$Fare
class <- data$Pclass
#Change it into S, C, Q
Emb <- data$Embarked
df_onehot <- data.frame(
  S = ifelse(Emb == "S", 1, 0),
  C = ifelse(Emb == "C", 1, 0),
  Q = ifelse(Emb == "Q", 1, 0)
)
data <- cbind(data, df_onehot)
S = data$S
C = data$C
Q = data$Q
##See the distribution of Embarkment
counts <- colSums(data[, c("Q", "C", "S")])  # sum of 1s in each column
barplot(counts,
        main = "Counts of Q, C, S",
        ylab = "Count",
        col = c("skyblue", "orange", "green"))
## S has so many ppl
##See the distribution of class in each embarkment
table(data$Embarked, data$Pclass)

#Pclass vs survival
class <- data$Pclass
df_onehot <- data.frame(
  low = ifelse(class == "1", 1, 0),
  mid = ifelse(class == "2", 1, 0),
  upp = ifelse(class == "3", 1, 0)
)
S = df_onehot$low
C = df_onehot$mid
Q = df_onehot$upp
##See the distribution of Embarkment
counts <- colSums(df_onehot[, c("low", "mid", "upp")])  # sum of 1s in each column
barplot(counts,
        main = "Counts of class",
        ylab = "Count",
        col = c("skyblue", "orange", "green"))
##Half of the passangers from upper, the other half from mid/low
##The survival rate of each class
# Assume Survived column is 0 = dead, 1 = survived
aggregate(Survived ~ Pclass, data = data, FUN = mean)
#Upp survive 62%, mid survive 47%
#Given they survive, the percentage of each class
tab <- table(data$Pclass, data$Survived)
prob <- tab[, "1"] / sum(tab[, "1"])
prob
#Use Multivaraite LR
data <- read.csv('train.csv')
data <- data[,-1] #del id
data <- data[,-3] #del name
data <- data[,-7] #del cabin
data <- data[,-8] #del ticket
data <- data[,-8] #del emb

data <- subset(data, fare !=0)
data <- subset(data, !is.na(Age))
data$Sex <- as.numeric(data$Sex == "female") #Make male = 0, female = 1
data$Embarked <- ifelse(data$Embarked == "S",1,
                        ifelse(data$Embarked == "C",-1,0))
#Make male = 0, female = 1
#Select Model
null <- lm(Survived~1, data = data)
full <- lm(Survived~., data = data)
step(null, scope=list(lower=null,upper=full), direction = "both")

#Use Model
fit <- lm(formula = Survived ~ Sex + Pclass + Age + SibSp, 
   data = data)
summary(fit)
boxplot(fare)

test <- read.csv('test.csv')
test$Sex <- as.numeric(test$Sex == "female") #Make male = 0, female = 1
test$Embarked <- ifelse(test$Embarked == "S",1,
                        ifelse(test$Embarked == "C",-1,0))
prediction <- predict(fit, newdata=test)
prediction <- round(prediction, 0)
final <- cbind(test$PassengerId, prediction)
final <- as.data.frame(final)
names(final) <- c('PassengerId', 'Survived')
#Normal 
write.csv(final, "final.csv", row.names = FALSE)







