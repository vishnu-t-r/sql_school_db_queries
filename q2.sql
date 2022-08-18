
--2.Find the attendance percentage  for each session for each batch.
--Also mention the batch name and users name who has conduct that session




WITH T1 AS
--active students
(
SELECT user_id as student_id
		,batch_id as batch_id
		,active as active
FROM 
student_batch_maps
WHERE active = 'True'
),
T2 AS
(
SELECT id as session_id
		,conducted_by as teacher_id
		,batch_id as batch_id
FROM
sessions
--WHERE batch_id IN (SELECT id as batch_id
					--FROM batches
					--WHERE active = 'True'
					--)
),
T3 AS 
(SELECT T1.student_id
		,T1.active
		,T1.batch_id as batch_id_t1
		,T2.batch_id as batch_id_t2
		,T2.session_id
		,T2.teacher_id		
FROM T1
INNER JOIN
T2
ON T1.batch_id = T2.batch_id
),
T4 AS 
(
SELECT 
		session_id
		,batch_id_t1
		,teacher_id
		,count(student_id) as total_students
FROM T3
GROUP BY session_id
		,batch_id_t1
		,teacher_id
),
T5 AS 
(
SELECT session_id,batch_id,teacher_id,count(student_id) as total_attendance
FROM
(
select e.student_id,e.session_id,e.batch_id,e.conducted_by as teacher_id
from
(
select c.student_id,c.session_id,d.batch_id,d.conducted_by from 
attendances c
join
sessions d
on c.session_id = d.id
) e
left join
(
select a.user_id as user_id,a.batch_id as active_batch,b.batch_id as inactive_batch
from
(select user_id,batch_id
from student_batch_maps as active
where active = 'True')a
join
(
select user_id,batch_id
from student_batch_maps as inactive
where active = 'False')b
on a.user_id = b.user_id
) f
on e.student_id = f.user_id
and e.batch_id = f.inactive_batch
where f.user_id is null and f.inactive_batch is null

) A
GROUP BY session_id,batch_id,teacher_id
)
SELECT T4.session_id
		,T4.batch_id_t1
		,T4.teacher_id
		,T5.total_attendance
		,T4.total_students
		,round((cast(T5.total_attendance as decimal)/cast(T4.total_students as decimal))* 100,2,1) AS attendance_percent
FROM T4
JOIN
T5 ON T4.session_id = T5.session_id
		AND T4.batch_id_t1 = T5.batch_id
		AND T4.teacher_id = T5.teacher_id

