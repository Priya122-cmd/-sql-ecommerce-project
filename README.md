# Olist E-Commerce Sales Analysis
## SQL + Power BI Project

## Problem Statement
Olist is a Brazilian e-commerce marketplace with 100,000 real orders.
The business needed answers to:
- Who are the most valuable customers?
- Which products and categories drive real revenue?
- Which states have the most customers and highest spending?
- Where is the business losing money through cancellations?
- How efficient is delivery across different states?

## Dataset
- Source: Kaggle — Brazilian E-Commerce Public Dataset by Olist
- Size: 100,000 orders | 6 tables | 2016–2018
- Tables used: orders, customers, order_items, products, sellers, order_payments

## Tools Used
- MySQL — data storage and analysis
- Power BI — dashboard and visualization

## SQL Concepts Used
- JOINS (2 table and 3 table joins)
- Aggregations (SUM, AVG, COUNT, ROUND)
- Subqueries
- CASE WHEN (conditional logic)
- Date Functions (DATE_FORMAT, DATEDIFF)
- HAVING, DISTINCT, NULL Handling

## Questions Analyzed

### Theme 1: Customer Intelligence
- Q1. Top 10 customers by total revenue
- Q2. Repeat buyers vs one-time buyers
- Q3. Which states have the most customers

### Theme 2: Revenue and Profitability
- Q4. Monthly revenue trend over 2 years
- Q5. Revenue percentage by payment method
- Q6. Average order value per state

### Theme 3: Product Performance
- Q7. Product categories by highest average order value
- Q8. Sellers with most orders but lowest revenue
- Q9. Single item vs multiple item orders

### Theme 4: Operational Insights
- Q10. Cancelled orders and revenue lost
- Q11. Most used payment methods
- Q12. Average delivery time per state

Key Business Insights
Customer Insights
93.6% of customers are one-time buyers, indicating a strong need for customer retention and loyalty programs.
São Paulo (SP) has the highest number of customers, making it the primary market for sales and marketing efforts.
Revenue Insights
Total payment value reached 16.01M over the analysis period, showing steady business growth.
Credit cards account for the majority of payments (around 78%), making them the preferred payment method.
Operations Insights
625 orders were cancelled, resulting in approximately 143.26K in lost revenue, highlighting the need to reduce cancellations.
Revenue increased steadily over time, indicating consistent marketplace growth during the period analyzed.


## What I Learned
- Writing complex SQL queries across 6 relational tables
- Data modelling in Power BI by connecting tables
- Creating DAX measures and calculated columns
- Translating business questions into visual insights
- Identifying real business problems from raw data

## Dashboard Preview
![Customer & Revenue Analysis](Customer%20%26%20Revenue%20Analysis.png)
![Products Operations Analysis](Products%20%26%20operations%20Analysis.png)
