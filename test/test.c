#include <stdio.h>
#include <openssl/crypto.h>
#include <openssl/err.h>
#include <openssl/fips.h>

int main()
{
#ifdef OPENSSL_FIPS 
    if(!FIPS_mode_set(1)) 
    {
        fprintf(stderr, "MSG: \n");
        ERR_load_crypto_strings();
        ERR_print_errors_fp(stderr);
        exit(1); 
    } 
    else
        fprintf(stderr,"*** IN FIPS MODE ***\n");

#else
    fprintf(stderr, "NO DEFINE_FIPS !\n");
#endif 
}

