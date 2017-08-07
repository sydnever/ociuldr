#!/bin/sh
./ociuldr user="tytest/tytest" query="select ENAME,JOB,SAL,COMM,dbms_lob.substr(clobs),NULL,to_char(sysdate,'YYYY-MM-DD HH24:MI:SS'),'INSERT','tytest',1,NULL,NULL,NULL,NULL,1,rowid from tytest.TEST_UNIQUE_KEY t" field=",_," escape='^A'  quote='^' null='^AN'   file="/home/oracle/ociuldr/TEST_UNIQUE_KEY.txt" 
