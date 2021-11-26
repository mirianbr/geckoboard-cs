-- Simple count
select count(*) from ticket 

-- Opened and closed between
select min(opened_at) as "Start date", max(opened_at) as "End date" from ticket
select min(closed_at) as "Start date", max(closed_at) as "End date" from ticket

-- SLA
select made_sla,  
	100.0 * cnt / sum(cnt) over() as perc
from (
	select made_sla::character varying as made_sla, count(*) as cnt
	from ticket
	group by made_sla
) as q

-- Tickets opened/day
select opened_at::timestamp, count(*) 
from ticket
group by opened_at
order by 1;

-- Tickets closed/day
select closed_at::timestamp, count(*) 
from ticket
group by closed_at
order by 1;

-- Reassignments
select reassignments, count(*) from
(select 
	case when reassignment_count = 0 then '0 - Not once' 
		 when reassignment_count = 1 then '1 - Once' 
		 when reassignment_count = 2 then '2 - Twice'
		 when reassignment_count >= 3 then '3 - 3+ times'
		 else '4 - No information'
	end as reassignments
from ticket) as q
group by reassignments
order by 1;

-- Days to resolution
select extract('day' from min(closed_at::timestamp - opened_at::timestamp)) as min_days
from ticket;

select count(*) from
(select min(closed_at::timestamp - opened_at::timestamp) as min_days
from ticket) as q, ticket
where (closed_at::timestamp - opened_at::timestamp) = q.min_days
group by q.min_days;

select extract('day' from max(closed_at::timestamp - opened_at::timestamp)) as max_days
from ticket;

select count(*) from
(select max(closed_at::timestamp - opened_at::timestamp) as max_days
from ticket) as q, ticket
where (closed_at::timestamp - opened_at::timestamp) = q.max_days
group by q.max_days;

select extract('day' from avg(closed_at::timestamp - opened_at::timestamp)) as avg_days
from ticket;
