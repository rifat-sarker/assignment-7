# PostgreSQL FAQ

## 1. What is PostgreSQL?
PostgreSQL একটি ফ্রি ওপেন সোর্স ডাটাবেজ ম্যানেজমেন্ট সিস্টেম যেটি রিলেশনাল এবং নন রিলেশনাল উভয়ই সাপোর্ট করে। এটি অত্যন্ত শক্তিশালী এবং উন্নত ফিচারসমৃদ্ধ। এটি SQL (Structured Query Language) ব্যবহার করে ডাটাবেজ পরিচালনা করে এবং ACID (Atomicity, Consistency, Isolation, Durability) কমপ্লায়েন্স নিশ্চিত করে, যা নিরাপদ ও নির্ভরযোগ্য ডাটাবেজ ট্রান্সঅ্যাকশন নিশ্চিত করে।

## 2. What is the purpose of a database schema in PostgreSQL?
Database Schema হল একটি লজিক্যাল স্ট্রাকচার, যা PostgreSQL ডাটাবেজের বিভিন্ন অবজেক্ট (যেমন টেবিল, ভিউ, ইনডেক্স, ফাংশন, সিকোয়েন্স ইত্যাদি) সংগঠিত ও পরিচালনা করতে ব্যবহৃত হয়। এটি ডাটাবেজ ম্যানেজমেন্টকে আরও কার্যকর এবং দক্ষ করে তোলে।

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
- **Primary Key**: একটি কলাম বা কলামের সেট, যা টেবিলের প্রতিটি রেকর্ডকে অন্যদের থেকে আলাদা (Unique) করে এবং NULL থাকতে পারে না।
- **Foreign Key**: এমন একটি কলাম, যা অন্য একটি টেবিলের Primary Key-র সাথে সম্পর্কিত থাকে। এটি টেবিলগুলোর মধ্যে রিলেশনশিপ তৈরি করতে ব্যবহৃত হয়।

## 4. What is the difference between the VARCHAR and CHAR data types?
- **VARCHAR**: এটি ভ্যারিয়েবল-লেংথ ডেটা টাইপ। শুধুমাত্র প্রকৃত ডেটার সাইজ অনুযায়ী জায়গা নেয়। 
  - উদাহরণ: `VARCHAR(10)` এ "abc" স্টোর করলে মাত্র ৩ ক্যারেক্টার জায়গা নেবে।
- **CHAR**: এটি ফিক্সড-লেংথ ডেটা টাইপ। নির্দিষ্ট সাইজ বরাদ্দ করে রাখে। 
  - উদাহরণ: `CHAR(10)` এ "abc" স্টোর করলে ১০ ক্যারেক্টার জায়গা নেবে।

## 5. Explain the purpose of the WHERE clause in a SELECT statement.
`WHERE` ক্লজ SELECT স্টেটমেন্টে ব্যবহার করা হয় ডেটা ফিল্টার করার জন্য। এটি শর্ত যোগ করে শুধুমাত্র সেই রেকর্ডগুলো রিট্রিভ করে যেগুলো নির্দিষ্ট শর্ত পূরণ করে। 
```sql
SELECT * FROM employees WHERE salary > 50000;
```

## 6. What are the LIMIT and OFFSET clauses used for?
- **LIMIT**: রেজাল্ট সেট থেকে কতগুলো রেকর্ড রিটার্ন করবে তা নির্দেশ করে।
- **OFFSET**: কতগুলো রেকর্ড স্কিপ করে তারপর থেকে রেকর্ড নিবে তা নির্দেশ করে।
```sql
SELECT * FROM products LIMIT 10 OFFSET 20; -- ২১ থেকে ৩০ নম্বর রেকর্ড রিটার্ন করবে।
```

## 7. How can you modify data using UPDATE statements?
`UPDATE` স্টেটমেন্ট দিয়ে টেবিলের বিদ্যমান ডেটা আপডেট করা যায়।
```sql
UPDATE table_name 
SET column1 = value1, column2 = value2
WHERE condition;
```
উদাহরণ:
```sql
UPDATE employees SET salary = 60000 WHERE emp_id = 101;
```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
JOIN অপারেশন একাধিক টেবিল থেকে ডেটা একসাথে রিট্রিভ করার জন্য ব্যবহৃত হয়। PostgreSQL-এ বিভিন্ন ধরনের JOIN আছে:
- **INNER JOIN**: শুধুমাত্র ম্যাচিং রেকর্ড দেখায়।
- **LEFT JOIN**: বাম টেবিলের সব রেকর্ড + ডান টেবিলের ম্যাচিং রেকর্ড।
- **RIGHT JOIN**: ডান টেবিলের সব রেকর্ড + বাম টেবিলের ম্যাচিং রেকর্ড।
- **FULL JOIN**: উভয় টেবিলের সব রেকর্ড।

## 9. Explain the GROUP BY clause and its role in aggregation operations.
`GROUP BY` ক্লজ একই মান বিশিষ্ট রেকর্ডগুলোকে গ্রুপ করে এবং aggregate ফাংশন (যেমন COUNT, SUM, AVG) প্রয়োগ করতে সাহায্য করে।
```sql
SELECT department, COUNT(*) as employee_count
FROM employees
GROUP BY department;
```

## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
Aggregate ফাংশনগুলি (Aggregate Functions) ডেটাবেসে সারি (rows) এর একটি সেটের উপর গণনা সম্পাদন করে এবং একটি একক মান রিটার্ন করে।
- `COUNT()`: একটি কলামের সারির সংখ্যা গণনা করে।
- `SUM()`: একটি সংখ্যাসূচক কলামের মানগুলির যোগফল গণনা করে।
- `AVG()`: একটি সংখ্যাসূচক কলামের মানগুলির গড় গণনা করে।
```sql
SELECT COUNT(column_name) FROM table_name;
SELECT SUM(column_name) FROM table_name;
SELECT AVG(column_name) FROM table_name;
