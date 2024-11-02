%{
    #include<stdio.h>
    int Total_Integer=0;
    int Total_Float=0;
    int Total_Identifier=0;
    int Total_Error=0;
%}
%option noyywrap

%%

^-?[0-9]+$ {
    // Matches a single line with a positive or negative integer, including 0
    printf("Integer : %s\n", yytext);
    Total_Integer++;
}

^-?[0-9]+\.[0-9]+$ {
    // Matches a single line with a positive or negative float, with at least one digit before and after the decimal point
    printf("Float : %s\n", yytext);
    Total_Float++;
}

^[a-zA-Z][a-zA-Z0-9_]*$ {
    // Matches a single line with a valid identifier
    printf("Identifier : %s\n", yytext);
    Total_Identifier++;
}

^.*$ {
    // Any other line is treated as an error, including lines with spaces, semicolons, or invalid formats
    printf("Error : %s\n", yytext);
    Total_Error++;
}

[\n]+ {
    // Ignore blank lines
}

%%

int main()
{
    yylex();
    printf("Total_Integer = %d\n", Total_Integer);
    printf("Total_Float = %d\n", Total_Float);
    printf("Total_Identifier = %d\n", Total_Identifier);
    printf("Total_Error = %d\n", Total_Error);
    return 0;
}
