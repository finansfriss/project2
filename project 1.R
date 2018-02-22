#### Project 1
#### Author: Erik Jonsson (23621)

## set up the files

getwd() #get working directory
setwd("C:/Users/erikj/Documents/764 local files/project 1") #set working directory

library(RSQLite) #get the RSQLite library

loansacc_original = read.csv("loans_accepted.csv", header=TRUE, sep=",", dec="." ) #import data with accepted loans
loansrej_original = read.csv("loans_rejected.csv", header=TRUE, sep=",", dec="." ) #import data with rejected loans


## create database

db = dbConnect(SQLite(), dbname="loans.sqlite") #create the database

dbWriteTable(conn = db, name = "loansacc_original", loansacc_original, overwrite=T, row.names=FALSE) #create table for accepted loans
dbWriteTable(conn = db, name = "loansrej_original", loansrej_original, overwrite=T, row.names=FALSE) #create table for rejected loans

dbDisconnect(db) #disconnect
