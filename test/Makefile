all: hello_oci null_escape

hello_oci: hello_oci.c 
	gcc -m64 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
	-I${ORACLE_HOME}/rdbms/public \
	-I${ORACLE_HOME}/rdbms/demo \
	-L${ORACLE_HOME}/lib \
	-lclntsh -g -o hello_oci hello_oci.c

null_escape: null_escape.c
	gcc -Wall null_escape.c -o null_escape -g

clean:
	rm -rf hello_oci null_escape
    
