/*Download the file from github repo*/
wget https://raw.githubusercontent.com/raj-arun/apachehive/master/Departments.txt
wget https://raw.githubusercontent.com/raj-arun/apachehive/master/Employees.txt

/*CREATE the DATABASE*/
CREATE DATABASE HRMS;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse/hrms.db/employees

/*Use the database to create the tables*/
USE HRMS;

/*create tables*/
CREATE TABLE IF NOT EXISTS employees (
employee_id int,
employee_name String,
department_id int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS departments (
Department_id int,
Department_name String)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse/hrms.db

/*LOAD DATA FROM LOCAL FILE SYSTEM*/
/*Append Data*/
LOAD DATA LOCAL INPATH 'Employees.txt' INTO TABLE employees;

/*Overwrite data*/
LOAD DATA LOCAL INPATH 'Employees.txt' OVERWRITE INTO TABLE employees;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse/hrms.db/employees

/*LOAD DATA FROM LOCAL FILE SYSTEM*/
/*Append Data*/
LOAD DATA LOCAL INPATH 'Departments.txt' INTO TABLE departments;

/*overwrite data*/
LOAD DATA LOCAL INPATH 'Departments.txt' OVERWRITE INTO TABLE departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse/hrms.db/departments

/*DROP TABLES*/
DROP TABLE employees;

DROP TABLE departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse/hrmds.db

/*drop database*/
DROP DATABASE HRMS;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse
