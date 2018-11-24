CREATE DATABASE HRMS;

USE HRMS;

/*create tables*/
CREATE TABLE IF NOT EXISTS employees (
employee_id int,
employee_name String,
department_id int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

CREATE EXTERNAL TABLE IF NOT EXISTS departments (
Department_id int,
Department_name String)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse

/*LOAD DATA FROM LOCAL FILE SYSTEM*/
LOAD DATA LOCAL INPATH 'Employees.txt' INTO TABLE employees;

/*LOAD DATA FROM LOCAL FILE SYSTEM*/
LOAD DATA LOCAL INPATH 'Departments.txt' INTO TABLE departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse

/*DROP TABLES*/
DROP employees;

DROP departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse

/*Check the file in local file system*/
ls Employees.txt

ls Departments.txt

/*create tables*/
CREATE TABLE IF NOT EXISTS employees (
employee_id int,
employee_name String,
department_id int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

CREATE EXTERNAL TABLE IF NOT EXISTS departments (
Department_id int,
Department_name String)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

/*Make new directory in DFS*/
hdfs dfs -mkdir hrms

/*Move files from local file system to hdfs*/
hdfs dfs -put Employees.txt hrms

hdfs dfs -put Departments.txt hrms

/*Check the files in HDFS*/
hdfs dfs -ls hrms

/*LOAD DATA FROM DFS*/
LOAD DATA INPATH './Employees.txt' INTO TABLE employees;

/*LOAD DATA FROM DFS*/
LOAD DATA INPATH './Departments.txt' INTO TABLE departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse

/*Check out the file in DFS*/
hdfs dfs -ls ./

/*DROP TABLES*/
DROP employees;

DROP departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse

/*Check out the file in DFS*/
hdfs dfs -ls /apps/hive/warehouse

/*drop database*/
DROP DATABASE HRMS;


