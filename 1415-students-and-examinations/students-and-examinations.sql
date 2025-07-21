/* Write your T-SQL query statement below */
with subjoin as
(select *
    ,1 as sjoin
from subjects)

select 
    st.student_id
    ,st.student_name
    ,s.subject_name
    ,count(e.subject_name) as attended_exams
from students st
join subjoin s
    on 1=sjoin
left join Examinations e
    on s.subject_name=e.subject_name
    and st.student_id=e.student_id
group by st.student_id, st.student_name, s.subject_name
order by st.student_id