/*Download data files from Github*/
wget https://raw.githubusercontent.com/raj-arun/apachehive/master/Employees.txt
wget https://raw.githubusercontent.com/raj-arun/apachehive/master/Departments.txt

/*create directory in HDFS*/
hdfs dfs -mkdir hrms

/*Move file from local file system to hdfs hrms directory*/
hdfs dfs -put Employees.txt hrms

hdfs dfs -put Departments.txt hrms

/*Check the file in HDFS*/
hdfs dfs -ls hrms

/*Login to Hive*/
hive

/*Create Database*/
CREATE DATABASE HRMS;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse

/*Use Database HRMS*/
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

/*LOAD DATA FROM DFS - relative path*/
LOAD DATA INPATH './hrms/Employees.txt' INTO TABLE employees;

/*LOAD DATA FROM DFS - absolute path*/
LOAD DATA INPATH '/user/maria_dev/hrms/Departments.txt' INTO TABLE departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse/hrms.db/employees
hdfs dfs -ls /apps/hive/warehouse/hrms.db/departments

/*Check out the file in DFS*/
hdfs dfs -ls hrms

/*DROP TABLES*/
DROP TABLE employees;

DROP TABLE departments;

/*Check out what happened behind the scenes*/
hdfs dfs -ls /apps/hive/warehouse/hrms.db

/*drop database*/
DROP DATABASE HRMS;

/*Check out what happened in DFS*/
hdfs dfs -ls /apps/hive/warehouse