# Fitness-Center-Membership-System
A comprehensive **Database Management System (DBMS) Mini Project** that implements a Fitness Center Membership Management System using MySQL.
This project demonstrates a strong understanding of **ER modeling, relational schema design, normalization, and advanced SQL queries for membership management and revenue analysis.

-> Project Description

The Fitness Center Membership Management System is designed to efficiently manage gym operations including:
* Member registration and management
* Membership plan subscriptions
* Trainer management
* Training session scheduling
* Attendance tracking
* Payment processing
* Client fitness progress monitoring
The system ensures data integrity using primary and foreign key constraints and enables analytical reporting using SQL joins, aggregations, and subqueries.

-> Database Name

fitness_center

-> Database Schema

Tables Implemented
1. Members– Stores members' personal and contact information
2. Membership_Plan – Stores available membership plans
3. Member_Memberships – Tracks member subscriptions
4. Trainers – Stores trainer details
5. Training_Session – Manages session scheduling
6. Attendance – Tracks daily member attendance
7. Payments – Records payment transactions
8. Client_Progress – Tracks fitness progress metrics

 -> Entity Relationships

* One Member → Many Membership Records
* One Membership Plan → Many Members
* One Trainer → Many Training Sessions
* One Member → Many Training Sessions
* One Member → Many Payments
* One Member → Many Attendance Records
* One Member → Many Progress Records

-> Key Features

* Structured relational schema design
* ER modeling 
* Normalized database structure
* Primary & Foreign Key constraints
* Membership lifecycle management
* Attendance monitoring system
* Trainer allocation management
* Revenue and payment analysis
* Beginner, Intermediate, and Advanced SQL queries

->  ER Diagram

The complete ER Diagram is included in the repository as:
ER_Diagram.png
ERD.png
It represents entities, attributes, primary keys, foreign keys, and relationships with proper cardinality.


-> Technologies Used

MySQL – Database Management
SQL – Query Language
dbdiagram.io – ER Modeling

->  How to Run the Project

1. Run `schema.sql` to create the database and tables.
2. Run `insert_values.sql` to insert sample records.
3.  Run `queries.sql` to execute analytical queries.

-> Analytical Queries Included

The project contains:

*  Easy Queries (Basic SELECT, WHERE, ORDER BY)
*  Medium Queries (JOINS, GROUP BY, Aggregations)
*  Advanced Queries (Subqueries, Revenue Analysis, Business Insights)

-> Learning Outcomes

This project demonstrates knowledge of:

* Relational Database Design
* Normalization (1NF, 2NF, 3NF)
* One-to-Many Relationships
* Data Integrity Constraints
* SQL Joins and Aggregations
* Business Analytics using SQL

-> Author
K.Yaswitha

