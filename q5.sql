
--5.A student can be transferred from one batch to another batch. If he is transferred from batch a to batch b. 
--batch b’s active=true and batch a’s active=false in student_batch_maps.
--At a time, one student can be active in one batch only. One Student can not be transferred more than four times. 
--Calculate each students attendance percentage for all the sessions created for his past batch. 
--Consider only those sessions for which he was active in that past batch.


with t1 as
(
select a.user_id as student_id,a.batch_id,b.id as session_id
from 
student_batch_maps a
left join
sessions b
on a.batch_id = b.batch_id
where a.active = 'False'
),
t2 as
(
select student_id,count(1) as session_attended
from
(select c.student_id,d.batch_id,d.session_id
from attendances c
inner join
t1 d
on c.student_id = d.student_id
and c.session_id = d.session_id
) e
group by student_id
),
t3 as
(
select student_id,count(1) as total_session
from t1 
group by student_id
)
select t3.student_id,isnull(t2.session_attended,0) as attendance
			,t3.total_session
			,cast(isnull(t2.session_attended,0) as decimal)/cast(t3.total_session as decimal)*100 as attendance_percent
from t3
left join
t2
on t3.student_id = t2.student_id

