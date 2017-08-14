#include <string.h>

#include <oci.h>


int main()
{
    OCIEnv      *myenvhp;
    OCIServer   *mysrvhp;
    OCIError    *myerrhp;
    OCISession  *myusrhp;
    OCISvcCtx   *mysvchp;

    char *username = "hr";
    char *password = "hr";

    //initialize enviroment -- mode: threaded|object
    (void) OCIEnvCreate( &myenvhp, OCI_THREADED|OCI_OBJECT, (void *)0, 
        0, 0, 0, (size_t)0, (void **)0 );
    //allocate a server handle
    (void) OCIHandleAlloc( (void *)myenvhp, (void **)&mysrvhp, 
        OCI_HTYPE_SERVER, 0, (void **)0 );
    //allocate a error handle    
    (void) OCIHandleAlloc( (void *)myenvhp, (void **)mysrvhp, 
        OCI_HTYPE_ERROR, 0, (void **)0 );
    //create a server context
    (void) OCIServerAttach( mysrvhp, myerrhp, (text *)"inst1_alias",
        strlen ("inst1_alias"), OCI_DEFAULT);
    //allocate a service handle
    (void) OCIHandleAlloc( (void *)myenvhp, (void **)&mysvchp,
        OCI_HTYPE_SVCCTX, 0, (void **)0 );
    //set the server attribute in the service context handle
    (void) OCIAttrSet( (void *)mysvchp, OCI_HTYPE_SVCCTX, 
        (void *)mysrvhp, (ub4)0, OCI_ATTR_SERVER, myerrhp );
    //allocate a user session handle 
    (void) OCIHandleAlloc( (void *)myenvhp, (void **)&myusrhp, 
        OCI_HTYPE_SESSION, 0, (void **)0 );
    //set user name
    (void) OCIAttrSet( (void *)myusrhp, OCI_HTYPE_SESSION,
        (void *)username, (ub4)strlen(username), OCI_ATTR_USERNAME, myerrhp );
    //set password
    (void) OCIAttrSet( (void *)myusrhp, OCI_HTYPE_SESSION,
        (void *)password, (ub4)strlen(password), OCI_ATTR_PASSWORD, myerrhp );
    
    (void) OCISessionBegin( (void *)mysvchp, myerrhp, myusrhp,
        OCI_CRED_RDBMS, OCI_DEFAULT );
    
    (void) OCIAttrSet( (void *)mysvchp, OCI_HTYPE_SVCCTX, 
        (void *)myusrhp, (ub4)0, OCI_ATTR_SESSION, myerrhp );
    
    return 0;
}