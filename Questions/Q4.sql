/*Question 4: What is our highest revenue company segment and company sales combination?*/

SELECT 
CONCAT(company_segment,' ',company_sales_region) as company_segment_and_sales_region, --using CONCAT() to combine segment + sales region
SUM(ARR) as total_ARR, --using SUM() to find total ARR by group
SUM(MRR) as total_MRR --using SUM() to find total MRR by group
FROM workspace_data_test_table
GROUP BY 1 --grouping by concacted sales region and segment
ORDER BY 2 DESC

/*The highest revenue Sales Region + Company Segment is Micro NA with 25,794 ARR and 2149.5 MRR*/
