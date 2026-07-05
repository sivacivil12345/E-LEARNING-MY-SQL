# 📊 E-Learning Platform Purchase Analysis (MySQL Project)
## 📌 Project Overview
This project focuses on analyzing purchase data from an e-learning platform using MySQL. The goal is to understand learner behavior, course performance, and revenue trends by working with relational data.

## 🎯 Objectives
- Design a relational database using MySQL
- Perform data exploration using SQL joins
- Apply aggregation and filtering techniques
- Generate insights on learner purchases and course performance
## 🛠️ Tools & Technologies
- Database: MySQL
- Language: SQL
- Documentation: MS Word
## 🗂️ Dataset Description
The project uses three main tables:

### 1. Learners
- learner_id (Primary Key)
- full_name
- country
### 2. Courses
- course_id (Primary Key)
- course_name
- category
- unit_price
### 3. Purchases
- purchase_id (Primary Key)
- learner_id (Foreign Key)
- course_id (Foreign Key)
- quantity
- purchase_date
## 🔗 Data Exploration
Used different types of SQL joins:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
These helped combine data across tables to analyze purchase details.

## 📊 Key Analytical Queries
- Total spending by each learner
- Top 3 most purchased courses
- Revenue by course category
- Learners purchasing from multiple categories
- Courses with no purchases
## 📈 Key Insights
📌 High Revenue Categories: Data Analytics and Programming courses generate the highest revenue.

📌 Top Performing Courses: A small number of courses contribute to most sales.

📌 Learner Behavior: Some learners purchase from multiple categories, showing strong engagement.

📌 Geographical Trends: India has the highest number of learners.

📌 Low Performing Courses: Some courses have little or no purchases.

## 💡 Recommendations
- Increase marketing for high-performing categories
- Promote low-performing courses using offers and discounts
- Encourage multi-course purchases through bundles
- Focus on high-performing regions like India
- Improve visibility of less popular courses

## 🏁 Conclusion
This project demonstrates how SQL can be used to analyze real-world data, extract meaningful insights, and support business decision-making in an e-learning platform.
