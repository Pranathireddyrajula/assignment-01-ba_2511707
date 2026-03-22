// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
    {
      product_id: "E1",
      name: "iPhone 14",
      category: "Electronics",
      price: 70000,
      specs: { warranty: "1 year", voltage: "220V", brand: "Apple" },
      features: ["5G", "Dual Camera", "128GB Storage"]
    },
    {
      product_id: "C1",
      name: "Men T-Shirt",
      category: "Clothing",
      price: 999,
      details: { size: "L", color: "Black", material: "Cotton" },
      available_sizes: ["S", "M", "L", "XL"]
    },
    {
      product_id: "G1",
      name: "Milk",
      category: "Groceries",
      price: 50,
      expiry_date: "2024-12-30",
      nutrition: { calories: 150, protein: "8g" }
    }
  ]);
  
  
  // OP2: find Electronics with price > 20000
  db.products.find({
    category: "Electronics",
    price: { $gt: 20000 }
  });
  
  
  // OP3: find groceries expiring before 2025-01-01
  db.products.find({
    category: "Groceries",
    expiry_date: { $lt: "2025-01-01" }
  });
  
  
  // OP4: updateOne — add discount_percent
  db.products.updateOne(
    { product_id: "E1" },
    { $set: { discount_percent: 10 } }
  );
  
  
  // OP5: create index on category field and explain why
  db.products.createIndex({ category: 1 });
  
// Index improves query performance when filtering by category.Without an index, MongoDB scans every document in the collection
// to find matching categories — this is called a collection scan.As the product catalog grows to thousands of items, this gets slow.
// An index on category lets MongoDB jump directly to relevant documents,making queries like OP2 and OP3 significantly faster.
// The value "1" means the index is sorted in ascending order.