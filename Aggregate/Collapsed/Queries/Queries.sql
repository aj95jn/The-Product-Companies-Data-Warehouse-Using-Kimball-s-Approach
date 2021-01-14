select `Business Name`, `Gross Profit` from aggcollapsed.financial_control_analysis_facttable 
where `Business Name` is not NULL
group by `Business Name` 
order by `Gross Profit` DESC;

select `Business Name`, `Calendar Sale year`, Quantity from  aggcollapsed.financial_control_analysis_facttable 
where `Business Name` is not NULL
group by `Business Name`, `Calendar Sale year`
order by Quantity DESC
