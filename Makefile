all: ociuldr 

ociuldr: ociuldr.c
	gcc -m64 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
	 -I/u01/app/oracle/11.2.0/db_1/rdbms/public \
	 -I/u01/app/oracle/11.2.0/db_1/rdbms/demo \
	 -L/u01/app/oracle/11.2.0/db_1/lib -lclntsh \
	 -o ociuldr ociuldr.c
	# gcc -m64 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I${ORACLE_HOME}/rdbms/public -I${ORACLE_HOME}/rdbms/demo -L${ORACLE_HOME}/lib -lclntsh -o ociuldr.bin ociuldr.c
	# gcc -m32 -g -Bsymbolic -t -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I${ORACLE_HOME}/include -L${ORACLE_HOME}/lib32 -Wl,-i -o ociuldr ociuldr.c -lm -Wl,-Bdynamic -lclntsh

clean:
	rm -rf ociuldr

