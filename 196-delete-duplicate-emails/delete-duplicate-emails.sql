# Write your MySQL query statement below
delete
from Person 
using Person
    ,Person p1
where Person.id>p1.id and Person.email=p1.email 