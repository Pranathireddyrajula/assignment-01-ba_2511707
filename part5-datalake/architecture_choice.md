## Architecture Recommendation

For a food delivery startup dealing with GPS logs, customer reviews, payment transactions, and restaurant menu images, I would go with a Data Lakehouse.

A Data Warehouse wouldn't work here because it only handles structured data well. Payment transactions fit in a warehouse, but GPS logs are continuous streams, reviews are plain text, and menu images are just files. You'd end up with half your data living outside the system.

A plain Data Lake also falls short. It can store everything in any format, but has no proper querying layer. If someone wants to ask "which restaurants get the best reviews from our most frequent customers?", a raw data lake makes that really hard to answer.

A Data Lakehouse solves both problems. It stores raw data in any format like a data lake, but also supports SQL queries and analytics like a warehouse. Tools like Delta Lake or Apache Iceberg make this possible. So the startup can store GPS logs and menu images in one place while still running proper business queries on orders and payments from the same system.

Scalability is another reason. A food delivery startup grows fast. A lakehouse runs on cheap cloud storage and you don't need to keep moving data between separate systems as things scale.

So a Data Lakehouse fits here because the data is too varied for a warehouse and too valuable to just dump in a lake with no way to query it properly.