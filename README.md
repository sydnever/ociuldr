ociuldr/syduldr
=======
就先写中文文档吧，转成英文的话，现在没那份精力。

这个工具是一个oracle数据库数据导出工具，很古老，源代码是05年的，原始源代码的发布站anysql似乎已经跪了，反正打不开。

最近实习工作的内容就是处理这个，先能正常运行，然后做一些功能定制，文档工作会陆续来完成。

ociuldr.c在oracle11的环境下运行时错误，tbuldr.c报了一个sql执行的错误，现在以tbuldr为基础进行修改，命名为syduldr。

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

