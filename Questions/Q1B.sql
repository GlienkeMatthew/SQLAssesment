/*QUESTION 1B:  Out of those workspaces, how many of them are paid workspaces?*/

/*I am assuming that if paid_conversion_at is not null then the workspace is paid even if the MRR or ARR is NULL.*/

SELECT 
IF(MRR IS NOT NULL, "Converted Workspace with MRR", "Converted Workspace without MRR") as converted_workspace_MRR_status, --distingush between converted workspaces with MRR and without MRR
COUNT(DISTINCT workspace_id) as unique_workspaces
FROM workspace_data_test workspace
LEFT JOIN lead_data_test lead ON workspace.owner_id = lead.user_id --left join lead table with workspace table where workspace.owner_id is equal to lead.owner_id
WHERE lead.user_id IS NOT NULL --filter to workspaces with matching lead from the lead table using lead.user_id column 
AND lead_month = "10/1/2022" --filter to leads created in Oct 2022 with lead.lead_month column
AND paid_conversion_at IS NOT NULL --filter to workspaces that have converted to paid using workspace.paid_conversion_at
GROUP BY 1

/*25 workspaces that have been converted withour reccuring revenue. 10 workspaces that have been converted with reccuring revenue. For a total of 35.*/
