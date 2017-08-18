#include <stdio.h>
#include <string.h>
typedef unsigned char ub1;
ub1 check_escape(const ub1 ch);

int main()
{
    int tc, te, pe;
    char temp_col[8196] = {"\a\b\f\n\r\t\v\\\'\""};
    char temp_escape[8196];    
    char chk_escape;
    char escape[] = {"##"};
    for (tc = 0, te = 0; tc < strlen(temp_col); tc++, te++)
    {
        chk_escape = check_escape(temp_col[tc]);
        if (chk_escape)
        {
            for (pe = 0; pe < strlen(escape); pe++)
            {
                temp_escape[te] = escape[pe];
                te++;
            }
            temp_escape[te] = chk_escape;
        }
        else
        {
            temp_escape[te] = temp_col[tc];
        }
    }
    strcpy(temp_col, temp_escape);
    printf("%s\n", temp_escape);
    printf("%s\n", temp_col);
    return 0;
    
}
ub1 check_escape(const ub1 ch)
{
    switch (ch)
    {
    case '\a':
        return 'a';
        break;
    case '\b':
        return 'b';
        break;
    case '\f':
        return 'f';
        break;
    case '\n':
        return 'n';
        break;
    case '\r':
        return 'r';
        break;
    case '\t':
        return 't';
        break;
    case '\v':
        return 'v';
        break;
    case '\\':
    case '\'':
    case '\"':
        return ch;
        break;
    default:
        return 0;
    }
    return 0;
}