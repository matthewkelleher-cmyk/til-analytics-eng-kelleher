# Write your MySQL query statement below
select 
s.student_id
, s.student_name 
, sub.subject_name  
, sum(if(sub.subject_name = e.subject_name, 1 , 0)) as attended_exams
from 
students as s 
cross join subjects as sub 
left join examinations as e 
on s.student_id = e.student_id 
group by 
 s.student_id 
,sub.subject_name 
order by 
s.student_id 
, sub.subject_name 


----input test, try and failed 1/15 tests
# Write your MySQL query statement below
-- select 
-- s.student_id
-- , s.student_name 
-- , sub.subject_name  
-- , sum(if(sub.subject_name = e.subject_name, 1 , 0)) as attended_exams
-- from 
-- students as s 
-- cross join subjects as sub 
-- left join examinations as e 
-- on s.student_id = e.student_id 
-- group by 
--  s.student_id 
-- ,sub.subject_name 
-- order by 
-- s.student_name 
-- , sub.subject_name 

--Error with this output is that I grouped by student_name when the student name "Alice" appeared twice, once at student_id 1 and the other as 3 
---OUTPUT 
| student_id | student_name | subject_name | attended_exams |
| ---------- | ------------ | ------------ | -------------- |
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
#EXPECTED
| student_id | student_name | subject_name | attended_exams |
| ---------- | ------------ | ------------ | -------------- |
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 3          | Alice        | Math         | 0              |
| 3          | Alice        | Physics      | 0              |
| 3          | Alice        | Programming  | 0              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |