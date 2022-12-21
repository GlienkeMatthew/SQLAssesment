/*QUESTION 2:  What is the average workspace member count for leads broken out by Marketing First Touch (please exclude any workspaces from 'Unknown' buckets)?*/

SELECT 
marketing_first_touch,
ROUND(AVG(member_count), 2) as average_member_count --use AVG() function to AVG() numbers in member_count column and then ROUND() to second decimal point
FROM workspace_data_test_table
WHERE marketing_first_touch NOT IN ("Unknown - Mobile Signup", "Unknown - Javascript Tracking Disabled", "Unknown") --exclude workspaces with unknown first marketing touches buckets
--WHERE marketing_first_touch NOT LIKE "%Unknown%" could be used as alternative filter method
GROUP BY 1 --grouping by marketing_first_touch to find average by each group
ORDER BY 2 desc
