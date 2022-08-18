
--7. A student is passed when he scores 40 percent of total marks in a test. 
--Find out how many percentage of students have passed in each test. Also mention the batch name for that test.


with t1 as 
(
select ts.test_id,ts.user_id,ts.score,t.batch_id,t.total_mark
		,(cast(ts.score as decimal)/cast(t.total_mark as decimal))*100 as percent_score
from test_scores ts
left join
tests t on ts.test_id = t.id
),
t2 as
(
select test_id,batch_id
		,count(1) as attended, count(case when percent_score >= 40 then 1
									end) as passed
from t1
group by test_id,batch_id
)
select t.test_id--,t.batch_id
		,b.name as batch_name
		,(cast(passed as decimal)/cast(attended as decimal))*100 as pass_percentage
from t2 t
join
batches b on t.batch_id = b.id
order by 1


