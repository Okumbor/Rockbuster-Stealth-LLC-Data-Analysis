# Rockbuster Stealth LLC Data Analysis Project

## Introduction
Rockbuster Stealth LLC, a movie rental company, is pivoting from traditional physical stores to an online video rental service. This strategic move is in response to growing competition from streaming giants like Netflix and Amazon Prime. As part of the business intelligence (BI) team, this project's goal is to leverage Rockbuster's existing movie licenses to support the launch strategy of the new online platform.

## Project Overview
The project involves loading Rockbuster's comprehensive data into a relational database management system (RDBMS) and utilizing SQL to perform data analysis. The insights derived from this analysis will inform and support strategic decisions for the online video service's launch.

## Key Questions Addressed
- **Revenue Contribution:** Which movies contributed the most and least to revenue gain?
- **Rental Duration:** What was the average rental duration for all videos?
- **Customer Demographics:** Which countries are Rockbuster customers based in? Where are high lifetime value customers located?
- **Sales Analysis:** Do sales figures vary significantly between geographic regions?

## Data Set
The dataset includes information about Rockbuster’s film inventory, customer base, and payment transactions, among other aspects crucial for operational and strategic analysis. This data was loaded into a PostgreSQL database, facilitating complex SQL queries and analysis.
 [Download Report](https://github.com/Okumbor/Rockbuster-Stealth-LLC-Data-Analysis/blob/main/Final%20Report.pdf) 

## Technologies Used
- **PostgreSQL:** Primary language used for querying the database and performing data manipulations.The chosen RDBMS for storing and managing the data effectively.
- **Visualization Tools:** Tableau. [Link!](https://public.tableau.com/app/profile/meshach.okumbor/viz/Rockbuster_17122413369360/Datasummary2?publish=yes)

## Analysis and Results
(SQL queries and a brief description of the results and insights gained from each analysis, possibly including charts or links to visualizations.)

### Example SQL Query
```sql
-- SQL query to find the top 5 revenue-generating movies
SELECT movie_title, SUM(payment_amount) AS total_revenue
FROM payments
JOIN movies ON payments.movie_id = movies.movie_id
GROUP BY movie_title
ORDER BY total_revenue DESC
LIMIT 5;
