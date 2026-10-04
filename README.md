# 🍽️ Zomato Restaurant Data Analysis using SQL

A SQL project that explores Zomato restaurant data using MySQL. It covers data cleaning (converting text ratings such as `"4.1/5"` into numbers), aggregation, subqueries, filtering, and conditional classification with `CASE`.

---

## 📌 Project Objectives

- Count the total number of restaurants in the dataset
- Measure how many restaurants accept online orders and table bookings
- Analyse the average cost for two people
- Find the most expensive, highest-rated, and most-voted restaurants
- Clean the `rate` column and use it for numeric analysis
- Compare restaurant types (Dining, Cafes, Buffet, Other) by count and average rating
- Classify restaurants into Budget, Mid-range, and Premium

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL | Database and query execution |
| MySQL Workbench (or any SQL client) | Running and testing queries |
| SQL | Aggregation, subqueries, `CASE`, data cleaning |

---

## 🗂️ Database & Table

- **Database:** `zomato`
- **Table:** `zomato-data-`

### Columns used in the analysis

| Column | Description |
|--------|-------------|
| `name` | Restaurant name |
| `online_order` | Whether online ordering is available (Yes/No) |
| `book_table` | Whether table booking is available (Yes/No) |
| `rate` | Rating stored as text (e.g. `4.1/5`) |
| `votes` | Number of votes received |
| `approx_cost(for two people)` | Approximate cost for two people |
| `listed_in(type)` | Restaurant category (Dining, Cafes, Buffet, Other) |

---

## 🔍 Analysis & Queries

| # | Business Question | SQL Concepts Used |
|---|-------------------|-------------------|
| 1 | How many restaurants are in the dataset? | `COUNT(*)` |
| 2 | How many accept online orders? | `COUNT`, `WHERE` |
| 3 | How many accept table booking? | `COUNT`, `WHERE` |
| 4 | Average approx. cost for two people | `AVG()` |
| 5 | Restaurant with the highest cost for two | Subquery, `MAX()` |
| 6 | Extract numeric rating from `"4.1/5"` text | Type conversion, aliasing |
| 7 | Highest-rated restaurant | Subquery, `MAX()` |
| 8 | Restaurant count per type | `GROUP BY`, `COUNT` |
| 9 | Average rating per type | `GROUP BY`, `AVG` |
| 10 | Restaurants with more than 500 votes and rating above 4.0 | Multiple `WHERE` conditions |
| 11 | Classify as Budget / Mid-range / Premium | `CASE WHEN` |
| 12 | Cafe with the most votes | Subquery, `MAX()` |

### Example query

```sql
-- Classify restaurants by cost for two
SELECT name,
CASE
  WHEN `approx_cost(for two people)` < 400 THEN 'Budget'
  WHEN `approx_cost(for two people)` BETWEEN 400 AND 700 THEN 'Mid-range'
  ELSE 'Premium'
END AS classify_as_budget
FROM `zomato-data-`;
```

The full set of queries is in [`zomato_analysis.sql`](zomato_analysis.sql).

---

## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/<your-repo-name>.git
   ```
2. Open MySQL Workbench (or your preferred SQL client).
3. Create the database and import the dataset into a table named `zomato-data-`:
   ```sql
   CREATE DATABASE zomato;
   USE zomato;
   ```
4. Run the queries from `zomato_analysis.sql` one by one and review the results.

---

## 📈 Key Insights You Can Draw

- What share of restaurants offer online ordering and table booking
- The typical cost for two and how it varies by restaurant type
- Which restaurants are the most popular (votes) and best rated
- How restaurants split across Budget, Mid-range, and Premium

> Add your actual findings here after running the queries (for example, "Dining is the most common restaurant type").

---

## 🔮 Future Improvements

- Add a permanent numeric rating column with `ALTER TABLE` and `UPDATE`
- Handle non-numeric ratings such as `NEW` or `-`
- Compare online-order vs. non-online-order restaurants by average rating
- Visualise the results in Power BI, Tableau, or Excel

---

## 📂 Repository Structure

```
├── README.md
├── zomato_analysis.sql
└── dataset/
    └── zomato_data.csv
```

## 👤 Author

**Your Name**
- GitHub: [@virendra7489](https://github.com/virendra7489)


---
