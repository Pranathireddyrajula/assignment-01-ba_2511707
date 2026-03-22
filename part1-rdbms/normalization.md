## Anomaly Analysis

### Insert Anomaly
In the 'orders_flat.csv', all information such as customer, product, and sales representative is stored in a single row. This means we cannot insert a new product independently without creating an order. For example, if we want to add a new product with product_id = P999, we cannot do so unless we also provide values for 'order_id', 'customer_id', and other fields. Since columns like "order_id" are mandatory, this restricts inserting standalone product or customer data.

### Update Anomaly
The dataset contains repeated customer information across multiple rows. For instance, a customer with the same 'customer_id' appears in multiple orders, and their details such as 'customer_email' and 'customer_city' are repeated. If the email of a customer (e.g., 'customer_id = 'C1') needs to be updated, we must modify every row where that customer appears. If one row is missed, it leads to inconsistent data within the table.

### Delete Anomaly
In the current structure, deleting a single row can result in loss of important information. For example, if a product appears in only one order and that row is deleted, all details related to that product (such as 'product_id', 'product_name', and 'category') are also removed. This means the database loses information about existing products simply because an order was deleted.


## Normalization Justification

storing all data in a single table may appear simpler initially, but it creates several practical issues in real-world scenarios. In the given dataset, customer, product, and sales representative details are repeated across multiple rows. For example, the same 'customer_id' appears in several rows with identical 'customer_name' and 'customer_email'. This redundancy increases storage usage and makes updates more error-prone.

If a customer's email needs to be changed, it must be updated in every row where that customer appears. Missing even one row results in inconsistent data. Similarly, new products or sales representatives cannot be added unless an order exists, which highlights the insert anomaly. Deleting a row may also remove critical information about products or customers, leading to data loss.

Normalization to Third Normal Form (3NF) resolves these issues by separating the data into multiple related tables such as customers, products, orders, and sales representatives. This ensures that each piece of information is stored only once, reducing redundancy and improving consistency. It also allows independent insertion, updating, and deletion of records. Therefore, normalization is not over-engineering but an essential practice for maintaining accurate, scalable, and reliable databases.