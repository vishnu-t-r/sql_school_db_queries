
--8. A student can be transferred from one batch to another batch. 
--If he is transferred from batch a to batch b. batch b’s active=true and batch a’s active=false in student_batch_maps.
--At a time, one student can be active in one batch only. One Student can not be transferred more than four times.
--Calculate each students attendance percentage for all the sessions.
with t1 as 
(
select sbm.user_id as student--,sbm.batch_id--,sbm.active
		--,s.id as session_id
		,count(1) as total_session
from student_batch_maps sbm
left join 
sessions s on sbm.batch_id = s.batch_id
where active = 'True'
group by sbm.user_id
),
t2 as
(
select c.student_id as student_id
		--,c.session_id,c.batch_id
		,count(1) as session_attended
from
(
select a.student_id,a.session_id,s.batch_id from 
attendances a
join
sessions s on a.session_id = s.id
) c
left join
(
select distinct user_id,batch_id from student_batch_maps
where active = 'False'
) d
on
c.student_id = d.user_id 
and 
c.batch_id = d.batch_id
where d.user_id is null
	and d.batch_id is null
group by c.student_id
)

select t1.student--,t1.total_session,isnull(t2.session_attended,0) as session_attended
		,(cast(isnull(t2.session_attended,0) as decimal)/cast(t1.total_session as decimal))*100 as student_attendance_percentage
from
t1 
left join
t2 on t1.student = t2.student_id
