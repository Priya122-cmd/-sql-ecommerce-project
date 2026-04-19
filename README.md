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

## Key Business Insights
1. 96% of customers never returned after first purchase
   — Olist needs a loyalty and retention program
2. Credit card dominates with majority of all revenue
   — Marketing should target credit card users for premium products
3. Northern states have the highest average delivery time
   — Logistics investment needed in North Brazil
4. High volume sellers are not always high revenue sellers
   — Platform should focus on seller quality not just quantity




## Dashboard Screenshots

### Page 1 — Customer & Revenue Analysis
[Customer & Revenue Dashboard]

### Page 2 — Product & Operations Analysis
[Product & Operations Dashboard]

## Key Business Insights

### Customer Insights
- 93.6% of customers never returned after first purchase
  → Olist has a serious customer retention problem
- São Paulo state has 40% of all customers
  → Marketing budget should focus heavily on SP region

### Revenue Insights
- Total revenue generated $16.01 Million over 2 years
  → Business grew consistently from 2016 to 2018
- Credit card dominates at 73.92% of all payments
  → Credit card users should be targeted for premium products

### Operations Insights
- 625 orders cancelled resulting in $143,260 revenue lost
  → Cancellation reasons need to be investigated urgently
- Sao Paulo sellers dominate the marketplace
  → Opportunity to onboard sellers from other regions

## What I Learned
- Writing complex SQL queries across 6 relational tables
- Data modelling in Power BI by connecting tables
- Creating DAX measures and calculated columns
- Translating business questions into visual insights
- Identifying real business problems from raw data
