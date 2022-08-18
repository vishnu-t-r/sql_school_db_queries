
--4.A student is passed when he scores 40 percent of total marks in a test.
--Find out how many students passed in each test. Also mention the batch name for that test.



with t1 as 
(
select a.test_id as test_id,b.batch_id,c.name as batch_name--, a.score as score
		,cast(a.score as decimal)/cast(b.total_mark as decimal)*100 as score_100
from
test_scores a
left join
tests b
on a.test_id = b.id
left join
batches c
on b.batch_id = c.id
),
t2 as 
(
select batch_name,test_id,batch_id,score_100,case when score_100 >= 40 then 'Pass'
							when score_100 < 40 then 'Fail'
							end as Pass_Fail
from t1
where score_100 >= 40
)
select test_id,batch_id,batch_name,count(1) as students_passed
from t2
group by test_id,batch_id,batch_name
order by test_id



/*
select ts.test_id, b.name as batch, count(1) as students_passed
from tests t
left join test_scores ts on t.id = ts.test_id
--join users u on u.id = ts.user_id
join batches b on b.id = t.batch_id
where ((cast(ts.score as decimal)/cast(t.total_mark as decimal))*100) >= 40
group by ts.test_id,b.name
order by 1;
*/