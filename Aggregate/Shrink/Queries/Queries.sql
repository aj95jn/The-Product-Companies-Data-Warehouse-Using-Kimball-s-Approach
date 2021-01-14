select count(`Customer Name`) `CUSTOMER COUNT`, `Calendar Sale quarter` from aggshrink.financial_control_analysis_facttable f 
join aggshrink.customer_dim using(Customer_SK) 
join aggshrink.saledate using(SaleDate_SK)
join aggshrink.order_ship_payment_junkdim using(Order_ship_payment_junkdim_SK)
where `Calendar Sale year` = 2005 and `payment method` = 'charge'
group by `Calendar Sale quarter`;

select Name, `Calendar Sale year`, `Calendar Sale quarter`, Sales, `Gross Profit` from aggshrink.financial_control_analysis_facttable f 
join aggshrink.supplier_dim using(Supplier_SK)
join aggshrink.product_dim using(Product_SK)
join aggshrink.saledate using(SaleDate_SK)
where Name is not null
group by Name, `Calendar Sale year`, `Calendar Sale quarter`
Order by `Calendar Sale year`, `Calendar Sale quarter`