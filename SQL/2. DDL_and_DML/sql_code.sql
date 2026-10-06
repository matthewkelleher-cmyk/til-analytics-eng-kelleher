--create target and source tables
--to prevent the target table from being altered with each exericse, a copy of it will be made each time it's used

create table target (
    id int, 
    value varchar
)
;