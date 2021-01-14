create view Product_per_Bus_per_Div as
select p.Div, p.`Business Name`, p.`Product Description`, f.Sales, f.Cost, f.`Gross Profit` 
from salesorder_team2_2201.product_dim p 
join salesorder_team2_2201.financial_control_analysis_facttable f
using(Product_SK)
where p.`Business Name` is not null
group by p.Div, p.`Business Name`, p.`Product Description`;

select * from product_per_bus_per_div;