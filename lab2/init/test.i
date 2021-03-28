# 1 "test.c"
# 1 "/home/oslab/lab2/init//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "test.c"
# 1 "../include/test.h" 1



int os_test();
# 2 "test.c" 2
# 1 "../include/put.h" 1



void puti(int num);
int puts(const char *s);
# 3 "test.c" 2

int os_test()
{
 const char *msg = "ZJU OS LAB 2             GROUP-XX\n";

    puts(msg);
 while(1) ;

    return 0;
}
