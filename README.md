# 🛍️ Data Digger — E-Commerce Store Database

Welcome to **Data Digger**! 🚀

Data Digger is a MySQL-based database project designed to manage the basic data of an e-commerce store. It stores customer details, order information, product details, and order records. This project is useful for learning and practicing SQL queries and database management.

## 📌 Project Overview

The main goal of this project is to organize e-commerce store data in a structured database and perform common database operations using SQL.

With this project, you can:
- 👥 Store and manage customer information.
- 🧾 Maintain customer order records.
- 📦 Store product prices and stock details.
- 🛒 Record products and quantities included in orders.
- 🔍 Search and retrieve specific records.
- ✏️ Update existing information.
- 🗑️ Delete selected records.
- 📊 Analyze order amounts and product sales.

## 🧰 Technologies Used

- 🐬 **MySQL** — Relational database management system
- 💻 **SQL** — Used to create tables and manage data

## 🗂️ Database Structure

The database name is **`data_digger`**. It contains four tables:

### 👥 1. Customers

The `Customers` table stores customer details.

| Column | Description |
|---|---|
| `Customer_id` | Unique ID for each customer; primary key |
| `Name` | Customer's name |
| `Email` | Customer's email address |
| `Address` | Customer's address |

### 🧾 2. Orders

The `Orders` table stores order information.

| Column | Description |
|---|---|
| `Order_id` | Unique ID for each order; primary key |
| `Customer_id` | ID of the customer who placed the order; foreign key |
| `Order_date` | Date the order was placed |
| `Total_amount` | Total amount recorded for the order |

### 📦 3. Products

The `Products` table stores product and inventory information.

| Column | Description |
|---|---|
| `Product_id` | Unique ID for each product; primary key |
| `Product_name` | Name of the product |
| `Price` | Product price |
| `Stock` | Available stock quantity |

### 🛒 4. Order_Details

The `Order_Details` table stores details about the products included in each order.

| Column | Description |
|---|---|
| `Order_detail_id` | Unique ID for each order-detail record; primary key |
| `Order_id` | Related order ID; foreign key |
| `Product_id` | Related product ID; foreign key |
| `Quantity` | Number of units ordered |
| `Sub_Total` | Subtotal recorded for the order-detail record |

## 🔗 Table Relationships

The tables are connected using primary keys and foreign keys:

- 👤 One customer can place multiple orders.
- 🧾 Each order belongs to a customer.
- 🛒 An order-detail record connects an order with a product.
- 🔗 `Orders.Customer_id` references `Customers.Customer_id`.
- 🔗 `Order_Details.Order_id` references `Orders.Order_id`.
- 🔗 `Order_Details.Product_id` references `Products.Product_id`.

These relationships help keep related data organized across the database.

## ⚙️ Project Features

### 👥 Customer Management
- Add sample customer records.
- Display all customer details.
- Update a customer's address.
- Delete a customer who has no related orders.
- Search for a customer by name.

### 🧾 Order Management
- Add sample orders.
- Display all orders.
- Retrieve orders placed by a particular customer.
- Update an order's total amount.
- Delete an order by its ID.
- Find orders placed within the last 30 days.
- Calculate the highest, lowest, and average order amounts.

### 📦 Product Management
- Add sample products.
- Display all product records.
- Sort products by price in ascending or descending order.
- Update a product's price.
- Delete products that are out of stock.
- Find products priced between a specified minimum and maximum.
- Calculate the highest and lowest product prices.

### 📊 Order Details and Sales Analysis
- Add order-detail records.
- Retrieve details for a specific order.
- Calculate total revenue from the recorded subtotals.
- Find the top three products by total quantity ordered.
- Count the number of order-detail records for a particular product.

## 🧠 SQL Concepts Practiced

This project provides practice with the following SQL concepts:

- `CREATE DATABASE` and `USE`
- `CREATE TABLE`
- `PRIMARY KEY` and `FOREIGN KEY`
- `DESC` to view table structure
- `INSERT INTO` to add records
- `SELECT` to retrieve records
- `WHERE` to filter records
- `UPDATE` to modify records
- `DELETE` to remove records
- `ORDER BY` to sort results
- `BETWEEN` to filter a range
- `CURRENT_DATE` and `INTERVAL` for date filtering
- Aggregate functions: `SUM()`, `MAX()`, `MIN()`, and `AVG()`
- `COUNT()` to count records
- `GROUP BY` to group data
- `LIMIT` to restrict the number of results

## 🚀 How to Run the Project

1. Install MySQL on your computer, or use a tool such as MySQL Workbench.
2. Open your MySQL editor or command-line client.
3. Open the SQL script for the Data Digger project.
4. Create and select the database:

   ```sql
   CREATE DATABASE data_digger;
   USE data_digger;
   ```

5. Create the tables in this order:
   `Customers` → `Orders` → `Products` → `Order_Details`
6. Run the `INSERT INTO` statements to add the sample records.
7. Execute the `SELECT` queries to view the data.
8. Try the `UPDATE`, `DELETE`, sorting, filtering, and aggregate queries to practice SQL.

> ⚠️ **Important:** If you run the script more than once, the database or tables may already exist, and repeated inserts may cause duplicate primary-key errors. Review the script before rerunning it because `UPDATE` and `DELETE` statements change the sample data.

## 💻 Example SQL Queries

### View all customers
```sql
SELECT * FROM Customers;
```

### View orders for customer ID 1
```sql
SELECT * FROM Orders
WHERE Customer_id = 1;
```

### Display products from highest price to lowest
```sql
SELECT * FROM Products
ORDER BY Price DESC;
```

### Calculate total revenue from order details
```sql
SELECT SUM(Sub_Total) AS Total_Revenue
FROM Order_Details;
```

### Find the top three products by quantity ordered
```sql
SELECT Product_id, SUM(Quantity) AS Total_Quantity
FROM Order_Details
GROUP BY Product_id
ORDER BY Total_Quantity DESC
LIMIT 3;
```

## ⚠️ Notes and Limitations

- The database uses sample data for practice and demonstration.
- A customer with existing orders cannot normally be deleted while those orders reference that customer.
- The script deletes out-of-stock products before inserting order-detail records; the supplied sample records do not refer to the deleted product.
- The sample `Sub_Total` values do not consistently equal `Quantity × Price`, and their sum may not match the `Total_amount` values in the `Orders` table. Update these sample values if you want the reports to reflect consistent totals.
- The `COUNT(*)` query counts matching order-detail records, not the total units sold. Use `SUM(Quantity)` to calculate total units sold.
- The last-30-days query uses MySQL date and interval syntax.

## 🌱 Future Improvements

Possible enhancements for this project include:

- 🔐 Add `NOT NULL`, `UNIQUE`, and suitable `CHECK` constraints.
- 🆔 Use `AUTO_INCREMENT` for automatically generated IDs.
- 🔎 Add indexes to columns that are searched frequently.
- 🧮 Calculate subtotals consistently from product price and quantity.
- 📈 Use `JOIN` queries to display product names in sales reports.
- 💳 Add a payments table.
- 🚚 Add order-status tracking.
- 🧪 Add more sample records and test queries.

##🎥 Explanation Video:

https://drive.google.com/file/d/1twc-FY58osGwtWg0S35p0Uy_B6D6a37J/view?usp=sharing


## 🎯 Learning Outcomes

By completing this project, learners can practice designing a relational database, connecting tables with foreign keys, writing SQL queries, managing records, and performing basic sales analysis.

## 🙌 Conclusion

**Data Digger** is a beginner-friendly MySQL project that demonstrates the core concepts of an e-commerce database. It is a useful starting point for building stronger SQL skills and understanding how related data is managed in a relational database.

⭐ **Thank you for checking out Data Digger!** Happy learning and happy coding! 💻🎉

