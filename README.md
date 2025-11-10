# 🛒 Market Analysis SQL Project  

## 📊 Project Overview  
This project performs **comprehensive market and customer analysis** using SQL queries to uncover key insights about user behavior, product performance, and purchasing trends.  
The goal is to help businesses optimize **marketing strategies, inventory management, and customer satisfaction** through data-driven decision-making.  

---

## 🎯 Objectives  
The analysis focuses on answering 20 key business questions related to:
1. Top-performing aisles and departments  
2. Product reorder trends and customer loyalty  
3. Purchase patterns by day and time  
4. User order frequency and average basket size  
5. Product performance across departments and aisles  

---

## 🧠 Business Questions Solved  

1️⃣ What are the top 10 aisles with the highest number of products?  
2️⃣ How many unique departments are there in the dataset?  
3️⃣ What is the distribution of products across departments?  
4️⃣ What are the top 10 products with the highest reorder rates?  
5️⃣ How many unique users have placed orders in the dataset?  
6️⃣ What is the average number of days between orders for each user?  
7️⃣ What are the peak hours of order placement during the day?  
8️⃣ How does order volume vary by day of the week?  
9️⃣ What are the top 10 most ordered products?  
🔟 How many users have placed orders in each department?  
11️⃣ What is the average number of products per order?  
12️⃣ What are the most reordered products in each department?  
13️⃣ How many products have been reordered more than once?  
14️⃣ What is the average number of products added to the cart per order?  
15️⃣ How does the number of orders vary by hour of the day?  
16️⃣ What is the distribution of order sizes (number of products per order)?  
17️⃣ What is the average reorder rate for products in each aisle?  
18️⃣ How does the average order size vary by day of the week?  
19️⃣ Who are the top 10 users with the highest number of orders?  
20️⃣ How many products belong to each aisle and department?  

---

## 🧾 Dataset Information  

### **1️⃣ Aisles Dataset**
| Column | Description |
|---------|--------------|
| `aisle_id` | Unique identifier for the aisle *(Primary Key)* |
| `aisle` | Name of the aisle |

### **2️⃣ Departments Dataset**
| Column | Description |
|---------|--------------|
| `department_id` | Unique identifier for the department *(Primary Key)* |
| `department` | Name of the department |

### **3️⃣ Order_Products_Prior Dataset**
| Column | Description |
|---------|--------------|
| `order_id` | Unique identifier for the order *(Primary Key)* |
| `product_id` | Unique identifier for the product |
| `add_to_cart_order` | Sequence in which the product was added to the cart |
| `reordered` | Indicates if the product was reordered (1 = Yes, 0 = No) |

### **4️⃣ Orders Dataset**
| Column | Description |
|---------|--------------|
| `order_id` | Unique identifier for the order *(Primary Key)* |
| `user_id` | Unique identifier for the user |
| `eval_set` | Evaluation set type (prior/train/test) |
| `order_number` | Order sequence number for the user |
| `order_dow` | Day of the week order was placed |
| `order_hour_of_day` | Hour of the day order was placed |
| `days_since_prior_order` | Number of days since last order |

### **5️⃣ Products Dataset**
| Column | Description |
|---------|--------------|
| `product_id` | Unique identifier for the product *(Primary Key)* |
| `product_name` | Name of the product |
| `aisle_id` | Aisle to which product belongs |
| `department_id` | Department to which product belongs |

---

## 🧩 Tools & Technologies Used  
- **SQL** (MySQL / PostgreSQL) — for querying, aggregations, and joins  
- **Excel / Power BI** — for visualization and KPI reporting *(optional)*  
- **Jupyter Notebook (optional)** — for presenting SQL output with insights  

---

## 🧠 Key Insights & Outcomes  
✅ Identified **top 10 aisles** and **departments** driving majority of sales  
✅ Found that most orders are placed between **9 AM – 7 PM**  
✅ Observed **high reorder rates** for essential grocery items  
✅ Discovered **weekly purchasing patterns** showing weekend spikes  
✅ Calculated **average basket size and reorder ratios** for better product placement  

---

## 🚀 Business Impact  
This project helps organizations to:  
- Improve **inventory planning** and reduce stockouts  
- Optimize **marketing campaigns** based on buying behavior  
- Enhance **customer retention** through reorder tracking  
- Strengthen **data-driven decision-making** with product-level insights  

---
## 🏁 Conclusion  
The Market Analysis SQL Project demonstrates how structured data querying and business intelligence techniques can transform raw sales data into valuable insights — driving better strategic and operational decisions across retail environments.
