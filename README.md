ociuldr/syduldr
=======
就先写中文文档吧，转成英文的话，现在没那份精力。

这个工具是一个oracle数据库数据导出工具，很古老，源代码是05年的，原始源代码的发布站anysql似乎已经跪了，反正打不开。

最近实习工作的内容就是处理这个，先能正常运行，然后做一些功能定制，文档工作会陆续来完成。

ociuldr.c在oracle11的环境下运行时错误，tbuldr.c报了一个sql执行的错误，现在以tbuldr为基础进行修改，命名为syduldr。

* 2017-08-14 Create project.        version 0.1
* 2017-08-15 Kill the firt bug.     version 0.2
* 2017-08-17 Add two options: null and escape(escape need more tests)   version 0.3

escape选项的代码能够处理标准形式的C语言字符串，但是在oracle下的表现令我困惑，我还需要更多的测试来确定这个功能是否完成。

----
## 目录结构
old：原始源码

sh：一些脚本

sql：sql脚本

syduldr: 新的源代码

test：一些测试代码

----

需要oracle(建议是11以上)环境，并配置好$ORACLE_HOME

```
export ORACLE_HOME=/u01/app/oracle/11.2.0/db_1
export LD_LIBRARY_PATH=${ORACLE_HOME}/lib:$LD_LIBRARY_PATH
```
编译

```
cd syduldr
make
```

---

    Usage: SYDULDR keyword=value [,keyword=value,...]
     Valid Keywords:
           user     = username/password@tnsname
           query    = select statement, can simply speicify a table name
           sql      = SQL file name
           field    = seperator string between fields
           record   = seperator string between records
           enclose  = fields enclose string
           file     = output file name, default: uldrdata.txt
           head     = print row header(Yes|No,ON|OFF,1|0)
           read     = set DB_FILE_MULTIBLOCK_READ_COUNT at session level
           sort     = set SORT_AREA_SIZE at session level (UNIT:MB) 
           hash     = set HASH_AREA_SIZE at session level (UNIT:MB) 
           serial   = set _serial_direct_read to TRUE if 1 at session level
           trace    = set event 10046 to given level at session level
           table    = table name in the sqlldr control file
           mode     = sqlldr option, INSERT or APPEND or REPLACE or TRUNCATE 
           log      = log file name, prefix with + to append mode
           long     = maximum long field size, default 8192 max 65534
           array    = array fetch size, default 50
           buffer   = sqlldr READSIZE and BINDSIZE, default 16 (MB)
           feedback = display progress every x rows, default 500000
           form     = display rows as form (Yes|No)
           fixlen   = fix length format (Yes|No)

---
