🛒 Instacart Consumer Behaviour Analysis - SQL Project

An end-to-end SQL analytics project built on the Instacart Market Basket Analysis Kaggle dataset. The project covers database design, data loading and 15 analytical queries ranging from basic aggregations to advanced window functions.

_____________________________________________________________________________________________________________________________

🗄️ Database & Tools

Database: PostgreSQL 18

Editor: VS Code with SQLTools extension

Dataset: Instacart Kaggle Competition dataset - 3.4M orders, 32M order line items, 206K users, 49K products

_____________________________________________________________________________________________________________________________

📁 Project Structure

<img width="641" height="481" alt="Screenshot 2026-05-26 122950" src="https://github.com/user-attachments/assets/3d877262-12ec-49d1-b711-95782e17018f" />


_____________________________________________________________________________________________________________________________

🗂️ Schema Design
The database is normalized across 5 tables:

<img width="636" height="134" alt="Screenshot 2026-05-26 123109" src="https://github.com/user-attachments/assets/287737a9-81ce-436b-8ba5-09eef43b31c9" />


_____________________________________________________________________________________________________________________________

### Key Findings & Insights

### 🛒 Weekend Dominance & Staffing Implications

Saturday (600,905 orders) and Sunday (587,478) together account for **35% of all weekly orders**, yet represent only 2 out of 7 days. Wednesday is the quietest day at 426,339 orders, 29% fewer than Saturday. For a business, this creates a clear operational signal: warehouse staffing, delivery driver scheduling, and inventory replenishment should be front-loaded to the weekend. Midweek promotions or discounts could help redistribute demand and reduce weekend fulfilment pressure.

### ⏰ The 9-5 Shopping Window

**71% of all orders are placed during standard working hours (9am–5pm)**, suggesting Instacart's user base shops during the day rather than evenings. This is likely driven by the convenience use case, ordering groceries for same-day or next-day delivery. However, late night shoppers (9pm–11pm) place the **largest average basket orders at 11 items**, versus 9–10 items during peak daytime hours. Strategically, Instacart can maximize growth by tailoring experiences to these behaviors by:

1. Optimizing daytime operations for speed, convenience, and repeat ordering.
2. Optimizing late-evening experiences for discovery, cross-selling, and larger basket conversion.

### 🥑 Organic Premium & Produce Dominance

The top 9 most ordered products are all from produce, and **7 of the top 10 are organic variants** (Organic Strawberries, Organic Baby Spinach, Organic Hass Avocado, Organic Avocado, Organic Whole Milk). Banana leads at 472,565 orders, 24% more orders than the second most popular product. This reveals a customer base that is health-conscious and willing to pay an organic premium. The dominance of produce also explains why it has the highest absolute order volume (9.47M orders) despite having only 1,684 products in the catalogue.

### 🔁 Habitual vs Discovery Categories

Reorder rate data reveals a clear split between **habitual categories** and **discovery-driven categories**:

- **High reorder (habit):** Dairy eggs 67%, Beverages 65.3%, Produce 65% - customers buy these on autopilot, replenishing staples regularly.
- **Low reorder (discovery):** Personal care 32.1%, Pantry 34.7%, International 36.9% - customers try these products but don't consistently return.

Personal care has the lowest reorder rate (32.1%) despite being the largest catalogue by product count (6,563 products). This suggests customers browse and experiment widely in personal care but rarely commit to a brand long-term. A business could use this to drive personalised recommendations, for example, if a customer buys a personal care product once, proactively re-surfacing it 30 days later could meaningfully improve retention in that category.

### 💗 The Popular But Not Sticky Problem

54 products have been ordered more than 10,000 times yet have a reorder rate below 50%. Extra Virgin Olive Oil leads this group with 50,255 orders but only a 47.7% reorder rate. Other notable entries include Fresh Ginger Root (24,130 orders, 48.4% reorder) and Organic Butternut Squash (19,847 orders, 46.7% reorder). These products are clearly in demand, customers know and want them, but something is breaking the repurchase cycle. Possible explanations include price sensitivity, substitution with competitors, or long consumption cycles. These 54 products represent a high-priority retention opportunity.

### 🤝 Cross-Selling Through Product Affinity

The top product pairs reveal a consistent pattern, **Banana and Bag of Organic Bananas appear in 8 of the top 10 co-purchased pairs**, confirming their role as the anchor product in Instacart baskets. The strongest non-banana pairing is Organic Strawberries + Organic Hass Avocado at 40,794 co-purchases, suggesting a health-conscious shopper segment that consistently places orders with fresh fruit. This data directly supports product placement and recommendation engine decisions, for example, bundling these pairs in homepage carousels or "frequently bought together" features would likely increase basket sizes with minimal friction.

### 📙 Catalogue vs Volume Mismatch

There is a significant **catalogue-to-volume mismatch** across departments. Personal Care has the most products (6,563) but generates only 447,123 total orders. Produce has one of the smallest catalogues (1,684 products) yet generates 9.47M orders, 21x more volume than Personal Care. This suggests Instacart's catalogue is heavily weighted towards low-velocity categories. From a merchandising perspective, produce and dairy earn disproportionate shelf space relative to their catalogue size and should be the focus of any availability and freshness guarantees, since stockouts in these departments would have the highest customer impact.

### 📈 Growing Customer Engagement

**3,756 users (1.8% of all users)** showed consistent basket growth across every single order they placed, each successive order contained more items than the previous one. While this is a small segment, it represents Instacart's most engaged and highest-potential customers. Identifying and nurturing this segment through loyalty programmes or early access to new products could have significant lifetime value implications.


_____________________________________________________________________________________________________________________________


📝 Query Index

**1.** How many orders were placed on each day of the week? 

**2.** What are the top 10 aisles with the most products listed in the product catalog?

**3.** How many products are in each department? 

**4.** What percentage of orders were placed between 9am and 5pm (working hours)?

**5.** How many users placed only a single order vs multiple orders?

**6.** What are the top 10 most ordered products? 

**7.** Which 5 departments have the highest reorder rate?

**8.** What is the average basket size per day of the week? (basket size = number of products per order)

**9.** Which products that have been ordered more than 10,000 times but have a reorder rate below 50%. These are popular but not sticky products.

**10.** Which hour of the day has the largest average basket size?

**11.** For each user, find their most frequently ordered product. 

**12.** Rank the top 5 products in each department by order volume using a window function. Return department, product name, order count, and rank.

**13.** Find users whose basket size has consistently grown - meaning every order has more items than the previous one.

**14.** What are the top 10 product pairs most commonly bought together in the same order?

**15.** For each department, show what percentage of its total orders came from reorders vs first-time purchases, and rank departments by reorder rate.

