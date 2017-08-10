alter table emp add constraint emp_pk primary key(empno);
alter table dept add constraint dept_pl primary key(deptno);
alter table emp add constraint emp_fk_dept foreign key(deptno) references dept;
alter table emp add constraint emp_fk_emp foreign key(mgr) references emp;
