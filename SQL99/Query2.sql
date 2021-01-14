SELECT dt.`Calendar Sale year`, dt.`Calendar Sale quarter`, c.`Customer Name`, SUM(ft.Sales)
FROM salesorder_team2_2201.saledate dt
JOIN salesorder_team2_2201.financial_control_analysis_facttable ft USING(SaleDate_SK)
join salesorder_team2_2201.customer_dim c using(Customer_SK)
where c.`Customer Name` is not null
GROUP BY dt.`Calendar Sale year`, dt.`Calendar Sale quarter`, c.`Customer Name` with rollup;

SELECT dt.`Calendar Sale year`, dt.`Calendar Sale quarter`, c.`Customer Name`, SUM(ft.Sales)
FROM salesorder_team2_2201.saledate dt
JOIN salesorder_team2_2201.financial_control_analysis_facttable ft USING(SaleDate_SK)
join salesorder_team2_2201.customer_dim c using(Customer_SK)
where c.`Customer Name` is not null
GROUP BY dt.`Calendar Sale year`, dt.`Calendar Sale quarter`, c.`Customer Name` with rollup
union
SELECT dt.`Calendar Sale quarter`, c.`Customer Name`, dt.`Calendar Sale year`, SUM(ft.Sales)
FROM salesorder_team2_2201.saledate dt
JOIN salesorder_team2_2201.financial_control_analysis_facttable ft USING(SaleDate_SK)
join salesorder_team2_2201.customer_dim c using(Customer_SK)
where c.`Customer Name` is not null
GROUP BY dt.`Calendar Sale quarter`, c.`Customer Name`, dt.`Calendar Sale year` with rollup
union
SELECT c.`Customer Name`, dt.`Calendar Sale year`, dt.`Calendar Sale quarter`, SUM(ft.Sales)
FROM salesorder_team2_2201.saledate dt
JOIN salesorder_team2_2201.financial_control_analysis_facttable ft USING(SaleDate_SK)
join salesorder_team2_2201.customer_dim c using(Customer_SK)
where c.`Customer Name` is not null
GROUP BY c.`Customer Name`, dt.`Calendar Sale year`, dt.`Calendar Sale quarter` with rollup;