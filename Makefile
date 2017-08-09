all: ociuldr tbuldr

ociuldr: ociuldr.c 
	gcc -m64 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
	-I${ORACLE_HOME}/rdbms/public \
	-I${ORACLE_HOME}/rdbms/demo \
	-L${ORACLE_HOME}/lib \
	-lclntsh -o ociuldr ociuldr.c
	
	# gcc -m32 -g -Bsymbolic -t -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I${ORACLE_HOME}/include -L${ORACLE_HOME}/lib32 -Wl,-i -o ociuldr ociuldr.c -lm -Wl,-Bdynamic -lclntsh

tbuldr: tbuldr.c 
	gcc -m64 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
	-I${ORACLE_HOME}/rdbms/public \
	-I${ORACLE_HOME}/rdbms/demo \
	-L${ORACLE_HOME}/lib \
	-lclntsh -o tbuldr tbuldr.c

clean:
	rm -rf ociuldr tbuldr
    
