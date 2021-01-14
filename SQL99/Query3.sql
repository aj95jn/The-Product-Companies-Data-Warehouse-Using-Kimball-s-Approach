SELECT a.Name, a.`Product Description`, a.Cost1, Count(a.Cost1) Ranking FROM 
(SELECT Name, `Product Description`, sum(Cost) Cost1
FROM salesorder_team2_2201.supplier_dim JOIN salesorder_team2_2201.financial_control_analysis_facttable
USING(Supplier_SK)
join salesorder_team2_2201.product_dim using(Product_SK)
where Name is not null and `Product Description` is not null
GROUP BY Name, `Product Description`) a
JOIN
(SELECT Name, `Product Description`, sum(Cost) Cost2
FROM salesorder_team2_2201.supplier_dim JOIN salesorder_team2_2201.financial_control_analysis_facttable
USING(Supplier_SK)
join salesorder_team2_2201.product_dim using(Product_SK)
where Name is not null and `Product Description` is not null
GROUP BY Name, `Product Description`) b
WHERE a.Cost1 <= b.Cost2
GROUP BY 1, 2
ORDER BY Ranking;