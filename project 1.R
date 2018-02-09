#### Project 1
#### Author: Erik Jonsson (23621)

## set up the files

getwd() #get working directory
setwd("C:/Users/erikj/Documents/764 local files/project 1") #set working directory

library(RSQLite) #get the RSQLite library

loansacc = read.csv("loans_accepted.csv", header=TRUE, sep=",", dec="." ) #import data with accepted loans
loansrej = read.csv("loans_rejected.csv", header=TRUE, sep=",", dec="." ) #import data with rejected loans


## create database

db = dbConnect(SQLite(), dbname="loans.sqlite") #create the database

dbWriteTable(conn = db, name = "loansacc", loansacc, overwrite=T, row.names=FALSE) #create table for accepted loans
dbWriteTable(conn = db, name = "loansrej", loansrej, overwrite=T, row.names=FALSE) #create table for rejected loans

dbDisconnect(db) #disconnect