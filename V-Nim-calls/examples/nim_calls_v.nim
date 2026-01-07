# nim_calls_v.nim - Nim program that calls V functions
# Compile with: nim c --out=nim_calls_v nim_calls_v.nim -d:release

{.emit: """
#include "libvlib.h"
""".}

proc v_add_numbers*(a: cint, b: cint): cint {.importc: "v_add_numbers", dynlib: "libvlib.so".}
proc v_greet*(name: cstring): cstring {.importc: "v_greet", dynlib: "libvlib.so".}
proc v_calculate_fibonacci*(n: cint): cint {.importc: "v_calculate_fibonacci", dynlib: "libvlib.so".}

proc main() =
  echo "Nim calling V functions..."
  
  # Test the v_add_numbers function
  let result = v_add_numbers(5, 7)
  echo "v_add_numbers(5, 7) = ", result
  
  # Test the v_greet function
  let greeting = v_greet(cstring("Nim programmer"))
  echo "Greeting: ", $greeting
  
  # Test the v_calculate_fibonacci function
  let fib = v_calculate_fibonacci(12)
  echo "v_calculate_fibonacci(12) = ", fib

main()