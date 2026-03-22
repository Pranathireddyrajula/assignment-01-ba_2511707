## Storage Systems

For Goal 1, predicting patient readmission, I went with Snowflake as the data warehouse. The ML model needs a lot of clean historical data to work with — things like past treatments, lab results, and diagnoses. Snowflake is good for this because it is designed for large analytical queries, not just storing rows.

For Goal 2, letting doctors search patient history in plain English, I used Pinecone as the vector database. The problem here is that doctor notes are just free-form text. You cannot run a normal SQL query on them. So the notes get converted into embeddings and stored in Pinecone, which can then find the most relevant ones based on meaning when a doctor types a question.

For Goal 3, the monthly reports, Snowflake works here too. Management reports are basically just big aggregation queries — total costs by department, bed occupancy over time, things like that. That is exactly what a data warehouse is built for.

For Goal 4, the ICU vitals, I used InfluxDB. ICU monitors send data every few seconds continuously. A normal relational database would struggle with that kind of volume and frequency. InfluxDB is a time-series database, meaning it is specifically built to handle fast, sequential numerical data like this.

MySQL is also there as the OLTP layer for live day-to-day operations — admissions, prescriptions, active records.

## OLTP vs OLAP Boundary

MySQL is the OLTP side. It handles things that are happening right now — a nurse updating a patient's medication, a new admission being registered. The data is always changing and needs to be accurate immediately.

The OLAP side starts at Snowflake. Data moves there through the ETL pipeline after being cleaned. At that point it is not being updated anymore — it is just being read and analyzed. The ETL pipeline is the actual boundary between the two. On one side you have live operations, on the other side you have historical analysis.

## Trade-offs

The main trade-off is that this design uses five different storage systems. That means more things to set up, more things that can break, and more skills the team needs to have. For a hospital that does not already have a data engineering team, this could be overwhelming.

The way to handle this is to use managed versions of these tools. Snowflake, Pinecone, and InfluxDB are all available as fully managed cloud services, meaning the provider handles maintenance and scaling. You do not need to run your own servers. That cuts down a lot of the operational work. It is also worth having clear ownership so one person or team knows each part of the system well rather than everyone knowing a little bit of everything.