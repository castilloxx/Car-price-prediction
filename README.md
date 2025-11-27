# 📊 Car Price Analytics — SQL | Excel | Power BI  
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)  
![Tools](https://img.shields.io/badge/Tools-SQL%20%7C%20Excel%20%7C%20PowerBI-orange)  
![Dashboard](https://img.shields.io/badge/Interactive-Dashboard-yellow)  
![Data](https://img.shields.io/badge/Data%20Size-2.5k%2B%20Rows-lightgrey)

A complete end-to-end data analytics project exploring **what drives used car pricing** using **MySQL, Excel, and Power BI visualizations**.  
The goal was to uncover **price patterns, depreciation behavior, and feature-based value differences** across brands, mileage, engine size, fuel type & car age.

---

## 🚀 Project Objectives
- Clean & prepare raw car listings dataset  
- Explore pricing trends using SQL analysis  
- Visualize insights via Power BI dashboard  
- Identify factors influencing car market value  
- Generate actionable recommendations for buyers, sellers & dealerships  

---

## 🛠 Tools and & Skills Application
| Tool/Skill | Application |
|---|---|
| **MySQL** | Cleaning, transformations, EDA queries |
| **Excel** | Formatting, missing value handling |
| **Power BI** | Dashboard visualization & interactive reporting |
| **Data Analysis** | Trend discovery, correlation study, insight extraction |

## 📂 Dataset Details  
The dataset includes:  
- `Car_id` - Unique identifier for each car listing
- `Brand` - Manufacturer of the vehicle (e.g., Toyota, Honda, Tesla)
- `Year` - Manufacturing year of the car
- `Engine_size` - Engine displacement
- `Fuel_type` - Fuel category (Petrol, Diesel, Electric, Hybrid)
- `Transmission` - Gear system (Manual or Automatic)
- `Milage` - Total kilometers/miles driven
- `Condition` - Physical condition (New, Used, Like New etc.)
- `Price` - Selling price/value of the car
- `Model` - Specific model name (e.g., Corolla, Civic, Mustang)
- `Age` - Number of years since the car was manufactured
- `Price_Bucket` - Groups cars into pricing tiers

---

## 📁 Workflow Breakdown

### Data Cleaning
- Removed duplicates & irrelevant entries  
- Standardized categories (Brand, Model, Fuel Type, Transmission and condition)  
- Corrected inconsistent values  
- Imputed missing engine sizes based on similar model segments  

### Exploratory SQL Analysis

## Data exloration (MySQL)
- Created calculated fields for:
  - **Age**
  - **Price Bucket**
- Average price by brand
- Average price by brand and year (to see depreciation patterns)
- Price vs Mileage correlation
- Condition effect on price
- Popular models by count and their average price

Example Queries:

```sql
-- Average price per brand
SELECT brand, COUNT(*) AS n, AVG(price) AS avg_price
FROM car_price_prediction_staging
GROUP BY brand
ORDER BY avg_price DESC;

-- Prive vs milage
SELECT price, mileage 
FROM car_price_prediction_staging 
WHERE price IS NOT NULL AND mileage IS NOT NULL;

-- Average price per condition
SELECT `condition`, COUNT(*) AS n, AVG(price) AS avg_price
FROM car_price_prediction_staging
GROUP BY `condition`
ORDER BY avg_price DESC;
```

## 📊 Dashboard Visualizations
The **Power BI Dashboard** includes:  
✔ **Top models by count and average price**  
✔ **Milage by price**  
✔ **Price Distribution**  
✔ **Price By Brand**  
✔ **Count of car Listings by Brand** 
✔ **Car listings count by transmission**
✔ **Average price by condition**
✔ **Average price by age**  
✔ **Price Distribution By Transmission** 
✔ **Price Distribution By Fuel Type**
✔ **Count of car Listings by fuel_type**
✔ **Average Milage By Age Bucket**

## 📈 Key Insights  
#🔥 Pricing Behavior
- Price declines sharply after 8–10 years of age
- Mileage shows negative correlation with price

#🔥 Branding & Market View
- Toyota & audi lead in listing frequency → strong consumer confidence
- luxury brands retain premium pricing
- High brand loyalty observed in mid-high range market

#🔥 Feature Influence
- Automatic transmission cars cost slightly more than manual
- Manual Cars Make more money than automatic cars

## Recomendations
- **Buyers** - Best value zone found in 8–12 year old low-mileage cars
- **Sellers** -	Highlight engine size, mileage, transmission for price lift
- **Dealerships** -	Stock more Japanese brands to increase unit turnover
- **Analysts** -	Track monthly pricing for potential seasonal market trends
- **Investors** - EU premium brands show stable value retention → high ROI resale market



