
main:
	# $t0 = string
	# $t1 = length

	la	$t0, string	# char *s = &string[0];
	li	$t1, 0


string_loop_cond:

	lb	$t2, $t0	# $t2 = *s
	beq	$t2, '\0', string_loop_end

	# length++
	# s++
	b string_loop_cond

string_loop_end:
	jr	$ra



   .data
string:
   .asciiz  "...."
