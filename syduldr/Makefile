all: syduldr

syduldr: syduldr.c 
	gcc -m64 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
	-I${ORACLE_HOME}/rdbms/public \
	-I${ORACLE_HOME}/rdbms/demo \
	-L${ORACLE_HOME}/lib \
	-lclntsh -g \
	-o syduldr syduldr.c

clean:
	rm -rf syduldr
    
