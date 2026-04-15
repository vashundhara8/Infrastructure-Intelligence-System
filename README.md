# Infrastructure Intelligence Dashboard

## Overview

This project presents an end-to-end data analytics solution for monitoring and analyzing infrastructure-related complaints. The system integrates a MySQL relational database with Power BI to deliver interactive visual insights on complaint distribution, resolution status, and delay patterns across different areas.

## Objectives

* Design a structured database for infrastructure complaint management
* Perform analytical queries to extract meaningful insights
* Build an interactive dashboard for decision-making support
* Analyze complaint trends, resolution efficiency, and area-wise distribution

## Technology Stack

* **Database:** MySQL
* **Visualization:** Power BI
* **Query Language:** SQL
* **Data Modeling & Calculations:** DAX

## Database Schema

The database `infra_system` consists of the following tables:

* **Locations:** Stores area and city information
* **Issue_Types:** Categorizes types of complaints
* **Departments:** Responsible departments for issue resolution
* **Complaints:** Central fact table linking all dimensions

Relational integrity is maintained using foreign key constraints.

## Key Features

* Total complaints overview using KPI card
* Complaint status distribution (Pending vs Resolved)
* Area-wise complaint analysis
* Delay calculation using DAX functions
* Interactive filtering by area
* Tabular view for detailed inspection of complaints

## Data Analysis

The dashboard provides the following analytical insights:

* Distribution of complaints by status
* Area-wise comparison of complaint volumes
* Identification of delays in complaint resolution
* Comparative performance of departments

Delay is calculated dynamically using DAX based on the difference between the reported date and the current date.

## DAX Calculation Example

```
Delay Days = DATEDIFF(complaints[reported_date], TODAY(), DAY)
```

## Project Structure

```
Infrastructure-Intelligence-Dashboard/
│
├── dashboard/
│   └── infra_intelligence_dashboard.pbix
│
├── sql/
│   └── infra_system.sql
│
├── images/
│   └── dashboard.png
│
└── README.md
```

## Setup Instructions

1. Execute the SQL script in MySQL to create the database and tables
2. Populate the tables with sample data
3. Open Power BI Desktop
4. Connect to MySQL using the appropriate connector
5. Load the required tables into Power BI
6. Build or refresh the dashboard

## Key Observations

* The dataset contains a balanced distribution of complaints across areas
* A higher proportion of complaints are in a pending state
* Delay metrics highlight inefficiencies in resolution timelines

## Future Enhancements

* Integration with real-time data sources
* Advanced KPIs for performance tracking
* Predictive analysis for complaint trends
* Deployment to Power BI Service for sharing and collaboration

## Conclusion

This project demonstrates practical implementation of database design, SQL querying, and business intelligence visualization. It highlights the ability to transform raw data into actionable insights using modern analytics tools.
