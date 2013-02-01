#!/usr/bin/python

import sys
from ctypes import *
from platform import machine
from struct import pack

#import resource
#stacksize = 80 * 1024 * 1024
#stacksize = 63 * 1024 * 1024 # OSX
#resource.setrlimit(resource.RLIMIT_STACK, (stacksize, stacksize))

obj = [
 0x41,0x57,                          # push   %r15
 0x41,0x56,                          # push   %r14
 0x41,0x55,                          # push   %r13
 0x41,0x54,                          # push   %r12
 0x55,                               # push   %rbp
 0x89,0xfd,                          # mov    %edi,%ebp
 0x53,                               # push   %rbx
 0x48,0x81,0xec,0x90,0x63,0x00,0x00, # sub    $0x6390,%rsp
 0x8b,0x16,                          # mov    (%rsi),%edx
 0x83,0xff,0x01,                     # cmp    $0x1,%edi
 0x89,0x54,0x24,0x88,                # mov    %edx,-0x78(%rsp)
 0x0f,0x8e,0xd7,0x00,0x00,0x00,      # jle    400769 <p81+0xf9>
 0x8d,0x47,0xfe,                     # lea    -0x2(%rdi),%eax
 0x48,0x8d,0x0c,0x85,0x04,0x00,0x00, # lea    0x4(,%rax,4),%rcx
 0x00,                               # 
 0x31,0xc0,                          # xor    %eax,%eax
 0x90,                               # nop
 0x03,0x54,0x06,0x04,                # add    0x4(%rsi,%rax,1),%edx
 0x89,0x54,0x04,0x8c,                # mov    %edx,-0x74(%rsp,%rax,1)
 0x48,0x83,0xc0,0x04,                # add    $0x4,%rax
 0x48,0x39,0xc8,                     # cmp    %rcx,%rax
 0x75,0xef,                          # jne    4006a0 <p81+0x30>
 0x48,0x63,0xc5,                     # movslq %ebp,%rax
 0x44,0x8d,0x74,0x2d,0x00,           # lea    0x0(%rbp,%rbp,1),%r14d
 0x44,0x8d,0x6d,0x01,                # lea    0x1(%rbp),%r13d
 0x4c,0x8d,0x3c,0x85,0x00,0x00,0x00, # lea    0x0(,%rax,4),%r15
 0x00,                               # 
 0x48,0x8d,0x5c,0x86,0x04,           # lea    0x4(%rsi,%rax,4),%rbx
 0x89,0xef,                          # mov    %ebp,%edi
 0x45,0x31,0xdb,                     # xor    %r11d,%r11d
 0x41,0xbc,0x01,0x00,0x00,0x00,      # mov    $0x1,%r12d
 0x0f,0x1f,0x00,                     # nopl   (%rax)
 0x49,0x63,0xc3,                     # movslq %r11d,%rax
 0x48,0x63,0xd7,                     # movslq %edi,%rdx
 0x45,0x89,0xd9,                     # mov    %r11d,%r9d
 0x8b,0x44,0x84,0x88,                # mov    -0x78(%rsp,%rax,4),%eax
 0x03,0x43,0xfc,                     # add    -0x4(%rbx),%eax
 0x47,0x8d,0x14,0x33,                # lea    (%r11,%r14,1),%r10d
 0x41,0x29,0xf9,                     # sub    %edi,%r9d
 0x89,0x44,0x94,0x88,                # mov    %eax,-0x78(%rsp,%rdx,4)
 0x43,0x8d,0x44,0x1d,0x00,           # lea    0x0(%r13,%r11,1),%eax
 0x48,0x89,0xda,                     # mov    %rbx,%rdx
 0xeb,0x1b,                          # jmp    400718 <p81+0xa8>
 0x0f,0x1f,0x00,                     # nopl   (%rax)
 0x8b,0x0a,                          # mov    (%rdx),%ecx
 0x01,0xf1,                          # add    %esi,%ecx
 0x4c,0x63,0xc0,                     # movslq %eax,%r8
 0x83,0xc0,0x01,                     # add    $0x1,%eax
 0x48,0x83,0xc2,0x04,                # add    $0x4,%rdx
 0x44,0x39,0xd0,                     # cmp    %r10d,%eax
 0x42,0x89,0x4c,0x84,0x88,           # mov    %ecx,-0x78(%rsp,%r8,4)
 0x74,0x1d,                          # je     400735 <p81+0xc5>
 0x41,0x8d,0x0c,0x01,                # lea    (%r9,%rax,1),%ecx
 0x48,0x63,0xc9,                     # movslq %ecx,%rcx
 0x8b,0x74,0x8c,0x88,                # mov    -0x78(%rsp,%rcx,4),%esi
 0x8d,0x48,0xff,                     # lea    -0x1(%rax),%ecx
 0x48,0x63,0xc9,                     # movslq %ecx,%rcx
 0x8b,0x4c,0x8c,0x88,                # mov    -0x78(%rsp,%rcx,4),%ecx
 0x39,0xce,                          # cmp    %ecx,%esi
 0x7c,0xcf,                          # jl     400700 <p81+0x90>
 0x03,0x0a,                          # add    (%rdx),%ecx
 0xeb,0xcf,                          # jmp    400704 <p81+0x94>
 0x41,0x83,0xc4,0x01,                # add    $0x1,%r12d
 0x41,0x01,0xeb,                     # add    %ebp,%r11d
 0x01,0xef,                          # add    %ebp,%edi
 0x4c,0x01,0xfb,                     # add    %r15,%rbx
 0x41,0x39,0xec,                     # cmp    %ebp,%r12d
 0x75,0x92,                          # jne    4006d8 <p81+0x68>
 0x44,0x89,0xe8,                     # mov    %r13d,%eax
 0xba,0x4f,0x00,0x00,0x00,           # mov    $0x4f,%edx
 0x0f,0xaf,0xc2,                     # imul   %edx,%eax
 0x48,0x98,                          # cltq   
 0x8b,0x44,0x84,0x88,                # mov    -0x78(%rsp,%rax,4),%eax
 0x48,0x81,0xc4,0x90,0x63,0x00,0x00, # add    $0x6390,%rsp
 0x5b,                               # pop    %rbx
 0x5d,                               # pop    %rbp
 0x41,0x5c,                          # pop    %r12
 0x41,0x5d,                          # pop    %r13
 0x41,0x5e,                          # pop    %r14
 0x41,0x5f,                          # pop    %r15
 0xc3,                               # retq   
 0x44,0x8d,0x6f,0x01,                # lea    0x1(%rdi),%r13d
 0xeb,0xd7,                          # jmp    400746 <p81+0xd6>
 0x90,                               # nop
]

#from p81 import obj

code = create_string_buffer(''.join(map(chr, obj)))
addr = addressof(code)
ps = pythonapi.getpagesize()
size=(ps - 1) & addr + len(code)
if pythonapi.mprotect(addr&-ps, size, 7) < 0:
    print("mprotect error, addr=%#x" % (addr))
    exit()

mat=[]
n=0
for line in open('matrix.txt'):
    mat += map(int, line.split(','))
    n +=1

p = create_string_buffer(''.join(map(lambda i: pack("i", i), mat)))
print(cast(code, CFUNCTYPE(c_int, c_int, c_void_p))(n, p))
