--there are some errors here.
create table test_objects nologging as select rownum id, a.* from dba_objects where 1=2;  
declare  
    l_cnt number;  
    l_rows number:=&1;  
begin  
    insert /*+ append */ into test_objects select rownum, a.* from dba_objects a;  
    l_cnt:=sql%rowcount;  
    commit;  
    while(l_cnt<l_rows)  
    loop  
    insert /*+ append */ into test_objects select rownum+l_cnt,  
            owner,object_name,subobject_name,  
            object_id,data_object_id,  
            object_type,created,last_ddl_time,  
            timestamp,status,temporary,  
            generated,secondary  
            from test_objects  
            where rownum<=l_rows-l_cnt;  
            l_cnt:=l_cnt+sql%rowcount;  
        commit;  
    end loop;  
end;  
alter table test_objects add constraint test_objects_pk primary key (id); 
exec dbms_stats.gather_table_stats('PAOLOLIU','TEST_OBJECTS'); 