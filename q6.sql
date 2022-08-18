
--6. What is the average percentage of marks scored by each student in all the tests the student had appeared?


select student,student_name
		,avg(percent_100) as avg_percent--over(partition by student) as avg_percent
from
(
select a.test_id, a.user_id as student, a.score, b.total_mark,u.name as student_name
		,(cast(a.score as decimal)/cast(b.total_mark as decimal))*100 as percent_100
from
test_scores a
left join
tests b on a.test_id = b.id
left join 
users u on a.user_id = u.id
) c
group by student,student_name
order by student_name

