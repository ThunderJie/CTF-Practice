#include<stdio.h>
void exploit()
{
    system("/bin/sh");
}
void func()
{
    char str[0x20];
    read(0, str, 0x50);
    printf(str);
    read(0, str, 0x50);
}
int main()
{
    func();
    return 0;
}
