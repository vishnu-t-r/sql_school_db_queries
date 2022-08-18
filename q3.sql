
--3.What is the average marks scored by each student in all the tests the student had appeared?



with t1 as 
(
select a.test_id as test_id,a.user_id as student, a.score as score, b.total_mark as total
		,cast(a.score as decimal)/cast(b.total_mark as decimal)*100 as score_100
from
test_scores a
left join
tests b
on a.test_id = b.id
)

select student,count(student) as test_taken_by_stud,round(sum(score_100)/count(student),2,1) as avg_marks
from t1
group by student



