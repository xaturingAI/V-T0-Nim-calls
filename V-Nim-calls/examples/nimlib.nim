# nimlib.nim - A simple Nim library that can be called from V
# Compile with: nim c --app:lib --out:libnimlib.so nimlib.nim

import std/strutils

proc addNumbers(a: cint, b: cint): cint {.exportc: "addNumbers", dynlib.} =
  ## Function to add two numbers, exported for C/V interop
  return a + b

proc greet(name: cstring): cstring {.exportc: "greet", dynlib.} =
  ## Function to greet someone, exported for C/V interop
  let greeting = "Hello, " & $name & "!"
  result = cstring(greeting)

proc calculateFibonacci(n: cint): cint {.exportc: "calculateFibonacci", dynlib.} =
  ## Calculate fibonacci number, exported for C/V interop
  if n <= 1:
    return n
  var a: cint = 0
  var b: cint = 1
  for i in 2..n:
    let temp = a + b
    a = b
    b = temp
  return b