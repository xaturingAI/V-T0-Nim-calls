// v_calls_nim.v - V program that calls Nim functions
// Compile with: v -cc gcc -o v_calls_nim v_calls_nim.v nimlib.so

#include "libnimlib.h"

fn C.addNumbers(int, int) int
fn C.greet(&u8) &u8
fn C.calculateFibonacci(int) int

fn main() {
	println('V calling Nim functions...')

	// Test the addNumbers function
	result := C.addNumbers(10, 20)
	println('addNumbers(10, 20) = $result')

	// Test the greet function
	greeting := C.greet(c'V programmer')
	println('Greeting: ${greeting}')

	// Test the calculateFibonacci function
	fib := C.calculateFibonacci(10)
	println('Fibonacci(10) = $fib')
}