/*Exploring the Lead Table*/

SELECT 
COUNT(DISTINCT user_id) as distinct_lead_owner_count,
COUNT(user_id) as lead_owner_count
FROM lead_data_test

/*There is only one instance of a user who owns more than one lead. 3,086 distinct users for 3,087 overall non-unique. The user is -2548249461962245568.*/ 

/*Exploring the Workspace Table*/

SELECT 
COUNT(DISTINCT owner_id),
COUNT(owner_id)
FROM workspace_data_test

/*14,937 distinct users for 15,791 overall non-unique.*/ 

/*QUESTION 1A: Provide a count of workspaces that had a lead generated in October 2022.*/

/*I am assuming there is a one-to-many relationship between leads and workspaces. Therefore, one individual lead created in October can count towards mutiple workspaces.*/

SELECT 
COUNT(DISTINCT workspace_id) as unique_workspaces
FROM workspace_data_test workspace
LEFT JOIN lead_data_test lead ON workspace.owner_id = lead.user_id --left join lead table with workspace table where workspace.owner_id is equal to lead.owner_id
WHERE lead.user_id IS NOT NULL --filter to workspaces with  matching lead from the lead table using lead.user_id column 
AND lead_month = "10/1/2022" --filter to leads created in Oct 2022 with lead.lead_month column


/*685 Unique Workspaces have had a lead created in October 2022*/

