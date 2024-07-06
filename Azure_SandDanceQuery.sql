-- This Query used for Sand Dance Visualization
-- How popular, costly and quickly delivered are the different food categories?
-- Please refer to Sand Dance Visualization
USE [Sample];

SELECT [dd].[store_primary_category] AS [Cuisine Type],
    [cost] = [dd].[subtotal]/100 ,
    COUNT([dd].[store_primary_category]) AS [Number of orders],
    AVG(DATEDIFF(MINUTE,[dd].[created_at],[dd].[actual_delivery_time])) AS [delivery time in minutes] 
FROM [dbo].[dd_eta] AS [dd]
WHERE [dd].[store_primary_category] <> 'other' 
    AND DATEDIFF(MINUTE,[dd].[created_at],[dd].[actual_delivery_time]) < 300 --less than 300 minutes
GROUP BY [store_primary_category],[dd].[subtotal]/100
ORDER BY COUNT([store_primary_category]) DESC;