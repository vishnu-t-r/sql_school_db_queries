--1.Calculate the average rating given by students to each teacher for each session created. 
--Also, provide the batch name for which session was conducted.

SELECT --teacher
		teacher_name
		--,batch
		,batch_name
		,session_id
		--,session_id_2
		,AVG(rating) as avg_rating
FROM
(
SELECT users.id as teacher
		,users.name as teacher_name
		--,instructor_batch_maps.batch_id as batch
		,batches.name as batch_name
		,sessions.id as session_id
		--,attendances.session_id as session_id_2
		,attendances.rating as rating

FROM users
INNER JOIN
sessions 
ON users.id = sessions.conducted_by
	--AND instructor_batch_maps.batch_id = sessions.batch_id
LEFT JOIN
attendances 
ON sessions.id = attendances.session_id
LEFT JOIN
batches
ON sessions.batch_id = batches.id
) c

GROUP BY --teacher
		teacher_name
		--,batch
		,batch_name
		,session_id

ORDER BY session_id
	

	