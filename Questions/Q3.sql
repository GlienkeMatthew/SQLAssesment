/*Question 3: A user/owner can have more than one workspace. Provide a list of all workspaces where the owner has more than one and rank each workspace by the created date (i.e. if there are workspaces created on the same date, they should both appear)*/

WITH owner_workspace_count AS (
SELECT 
owner_id,
COUNT(DISTINCT workspace_id) as workspace_count
FROM workspace_data_test_table
GROUP BY 1
) --CTE to calculate the individual workspaces owned by each owner for reference in query

SELECT 
workspace.owner_id,
workspace.workspace_id,
created_at,
RANK(workspace_id) OVER (PARTITION BY workspace.owner_id ORDER BY created_at ASC) as workspace_creation_ranking --RANK() window function partitioned by owner_id ordered by the creation date of the workspace
FROM workspace_data_test_table workspace
LEFT JOIN owner_workspace_count count ON workspace.owner_id = count.owner_id --left join to CTE for reference of workspace_count column
WHERE workspace_count > 1 --usage of CTE reference to filter out owners with only a singular workspace
ORDER BY 1, 4
