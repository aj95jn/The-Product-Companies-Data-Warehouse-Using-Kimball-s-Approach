SELECT a.`Calendar Sale year` y1, yearlyProfits1, b.`Calendar Sale year` y2, yearlyProfits2
FROM 
(SELECT `Calendar Sale year`, SUM(`Gross Profit`) yearlyProfits1
FROM salesorder_team2_2201.saledate JOIN salesorder_team2_2201.financial_control_analysis_facttable
USING(SaleDate_SK)
GROUP BY `Calendar Sale year`) a
JOIN 
(SELECT `Calendar Sale year`, SUM(`Gross Profit`) yearlyProfits2
FROM salesorder_team2_2201.saledate JOIN salesorder_team2_2201.financial_control_analysis_facttable
USING(SaleDate_SK)
GROUP BY `Calendar Sale year` ) b
ON a.`Calendar Sale year` < b.`Calendar Sale year`
GROUP BY y1, y2
ORDER BY y1, y2;