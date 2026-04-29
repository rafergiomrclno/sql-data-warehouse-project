# Data Warehouse and Analytics Project 
This project demonstrates a comprehensive data warehousing and analytics solution, from bulding a data warehouse to generating actionable insights. Designed as a portfolio project highlights industry best practices in data engineering and analytics.

Note: This project i implemented and modified from [DatawithBaraa]((https://www.youtube.com/@DataWithBaraa)). This project is for learning purposes to get to know about building modern data warehouse. 

---

# 📚 Project Requirements

## 📖 Project Overview

This project invloves:

1. Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold Layers.
2. ETL Pipelines: Extracting, transforming and loading data from source systems into the warehouse. 
3. Data Modeling: Developing fact and dimension tables optimized for analytical queries.
4. Analytics & Reporting: Creating SQL-based repots and dashboards for actionable insights. 

📌 This repository is an excellent resource for professionals and students looking to showcase expertise in: 

- SQL Development
- Data Architect
- Data Engineering
- ETL Pipeline Developer
- Data Modeling
- Data Analytics

---

## 🛠️ Important Links & Tools

- Datasets: Access to the project dataset (csv files).
- SQL Server Express: Lightweight server for hosting your SQL database.
- SQL Server Management Studio (SSMS): GUI for managing and interacting with databases.
- Git Repository: Set up a Github account to manage, version, and collaborate on your code efficiently.
- DrawIO: Design data architecture, models, flows, and diagrams.
- Notion:  All-in-one for project management and organization.
- Notion Project Steps: Access to All Project Phases and Tasks.

---

## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture which consist three layers; Bronze, Silver, and Gold Layers:

1. **Bronze Layer**: this is staged layer where the raw data that we imported and there will be no transformations.
2. Silver Layer: the raw data will be through a lot of transformation which is like handling duplicates and null values, data formatting, etc. Business rules will not be applied yet. 
3. **Gold Layer**: Usually this is called data marts where there going to be a lot of different type of objects used for reporting, analytics, machine learning, or AI engineering. 

---

### ⚙️ Building the Data Warehouse (Data Engineering)
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making. 

#### Specifications
- **Data Sources**: Import data from two source systems (ERP & CRM) provided as CSV files.
- **Data Quality**: Implemented rigorous cleansing protocols to resolve inconsistencies and ensure data integrity.
- **Integration**: Combine bouth sources into a single, user-friendly data model designed for analytical queries. 
- **Scope**: Focus on the latest dataset only; historization of data is not required. 
- **Documnetation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### 📊 BI: Analytics & Reporting (Data Analytics)

### Objective
Develop SQL-based analytics to deliver detailde insights into: 
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**
These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---

## ⚖️ License
This project is license under the [MIT License] (LICENSE). You are free to use, modify and share this project with proper attribution.

## ❄️ About Me
Hi there! I'm Rafergio (Gio) Kaunang Marcelino, a Mathematics graduate from Prasetiya Mulya.
I am currently focused on bridging the gap between mathematical concepts and practical data engineering. I enjoy the process of "learning by doing"—taking complex data challenges and breaking them down through SQL and analytical modeling. 

This project is a part of my journey to refine my technical toolkit and explore the intersection of business and data.







