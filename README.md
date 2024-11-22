# Retail Orders Analysis Project

## Overview
This project involves scraping retail order data from Kaggle, performing exploratory data analysis (EDA) in Python, and loading the processed data into SQL Server for further analysis. The goal is to clean, transform, and analyze the data to derive insights about sales performance, product trends, and regional variations.

---

## Project Workflow

### 1. Data Scraping
- **Kaggle Dataset**: The retail orders dataset was downloaded from Kaggle using the Kaggle API.
- The dataset contains various details about customer orders in CSV format.

### 2. Data Cleaning and Preprocessing
- **Handling Missing Values**:  
  The dataset was cleaned by addressing null values and standardizing missing data indicators (e.g., 'Not Available' and 'unknown').
  
- **Renaming Columns**:  
  Column names were standardized by converting them to lowercase and replacing spaces with underscores.
  
- **Deriving New Metrics**:  
  - Created new columns like `profit`, calculated from the difference between sale price and cost price.
  
- **Date Formatting**:  
  The `order_date` column was converted to a datetime format for easier analysis.
  
- **Removing Unnecessary Columns**:  
  Irrelevant columns, such as `list_price`, `cost_price`, and `discount_percent`, were dropped after the necessary calculations.

### 3. Data Loading into SQL Server
- After preprocessing, the cleaned data was loaded into a **SQL Server database** for more advanced analysis using SQL.

### 4. SQL Analysis
- **Key Queries**:
  - Identified the top revenue-generating products.
  - Analyzed sales performance by region and product category.
  - Compared month-over-month sales growth for 2022 and 2023.
  - Analyzed sales trends by sub-category for year-over-year growth.

---

## Technologies Used
- **Kaggle API**: For downloading the dataset.
- **Python**: For data extraction, cleaning, and processing.
- **SQL Server**: For data storage and analysis.
- **SQL**: For querying and generating insights.

---

## Conclusion
This project demonstrates the end-to-end process of extracting, cleaning, and analyzing retail sales data using a combination of **Python** and **SQL**. By performing these steps, valuable insights were gained regarding product performance, regional sales trends, and year-over-year comparisons, enabling better decision-making for businesses.
