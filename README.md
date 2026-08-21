# Olist E-Commerce SQL Analysis

An end-to-end SQL analysis of the Brazilian Olist e-commerce dataset using MySQL to uncover insights across sales performance, customer behavior, delivery efficiency, and customer satisfaction.

## Project Overview

This project simulates a real-world e-commerce analytics scenario where SQL is used to transform relational data into actionable business insights.

The analysis focuses on four key areas:

- Sales performance
- Customer behavior and segmentation
- Delivery and operational efficiency
- Customer reviews and satisfaction

## Dataset

**Dataset:** Olist Brazilian E-Commerce Dataset  
**Source:** Kaggle  
**Scale:** ~100,000 orders across multiple relational tables

### Tables Used

- `customers`
- `orders`
- `order_items`
- `order_payments`
- `order_reviews`
- `products`
- `sellers`
- `product_category`

## Tools & Technologies

- MySQL
- MySQL Workbench
- GitHub

## Analysis

### 1. Sales Analysis

**SQL File:** `01_sales_analysis.sql`

Analyzed:

- Monthly order and revenue trends
- Top product categories by revenue
- Top-selling products by total sales
- Peak order day and hour

**Key Insight:**  
Sales exhibit clear time-based trends, with a small number of product categories contributing a significant portion of total revenue.

---

### 2. Customer Analysis

**SQL File:** `02_customer_analysis.sql`

Analyzed:

- One-time vs. repeat customers
- Top customers by total spending
- RFM-based customer segmentation

Customer segments included:

- Champions
- Loyal
- At Risk
- Lost

**Key Insight:**  
The majority of customers are one-time buyers, while repeat customers contribute disproportionately higher revenue, highlighting the importance of retention strategies.

---

### 3. Delivery & Operations Analysis

**SQL File:** `03_delivery_analysis.sql`

Analyzed:

- Average delivery time
- Late vs. on-time deliveries
- Delivery delays by state

**Key Insight:**  
Delivery performance varies significantly by region, indicating opportunities for logistics and supply chain optimization.

---

### 4. Reviews & Customer Satisfaction

**SQL File:** `04_review_analysis.sql`

Analyzed:

- Review score distribution
- Relationship between delivery time and review scores
- States with the lowest average customer ratings

**Key Insight:**  
Longer delivery times are strongly associated with lower customer review scores, demonstrating the relationship between operational efficiency and customer satisfaction.

## SQL Techniques Demonstrated

This project demonstrates practical SQL techniques including:

- Multi-table `JOIN` operations
- Aggregations and `GROUP BY`
- Date-based analysis
- Customer segmentation
- Revenue analysis
- Ranking and filtering
- Business KPI analysis
- Relational data exploration

## Project Structure

```text
Olist_E-commerce_SQL_Analysis/
│
├── 01_sales_analysis.sql
├── 02_customer_analysis.sql
├── 03_delivery_analysis.sql
├── 04_review_analysis.sql
└── README.md
