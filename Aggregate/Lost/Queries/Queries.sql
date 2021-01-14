select `Product Description`,
(`Gross Profit`/Sales) * 100 `Percentage Profit` from aggregate_lost.financial_control_analysis_facttable f 
join aggregate_lost.product_dim p using(Product_SK)
group by `Product Description`
order by `Percentage Profit` desc;

select `Fiscal Sale year`, `Fiscal Sale quarter`, p.Div, Sales
from aggregate_lost.financial_control_analysis_facttable f join aggregate_lost.product_dim p using(Product_SK)
join aggregate_lost.saledate s using(SaleDate_SK)
group by `Fiscal Sale year`,`Fiscal Sale quarter`, p.Div;