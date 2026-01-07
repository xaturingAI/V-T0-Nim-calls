// vlib.v - V library that exports functions for Nim to call
// Compile with: v -cc gcc -shared -o libvlib.so vlib.v

@[export: 'v_add_numbers']
fn add_numbers(a int, b int) int {
	return a + b
}

@[export: 'v_greet']
fn greet(name &u8) &u8 {
	// For now, return a simple hardcoded string to test the export mechanism
	return c'Hello from V!'
}

@[export: 'v_calculate_fibonacci']
fn calculate_fibonacci(n int) int {
	if n <= 1 {
		return n
	}
	mut a := 0
	mut b := 1
	for i := 2; i <= n; i++ {
		mut temp := a + b
		a = b
		b = temp
	}
	return b
}

// Helper function to convert C string to V string
fn to_str(cstr &u8) string {
	if cstr == 0 {
		return ''
	}
	mut str := ''
	mut i := 0
	for {
		unsafe {
			if cstr[i] == 0 {
				break
			}
			str += cstr[i].str()
			i++
		}
	}
	return str
}