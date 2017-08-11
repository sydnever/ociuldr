# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
cat /home/oracle/Desktop/readme.txt
export XDB_HOL=/home/oracle/Desktop/Database_Track/XMLDB
export ORACLE_HOME=/home/oracle/app/oracle/product/12.1.0/dbhome_1
export LD_LIBRARY_PATH=${ORACLE_HOME}/lib:$LD_LIBRARY_PATH  
export SHARE=/media/sf_app/ociuldr
