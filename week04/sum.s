

main:
	
main__prologue:
	begin
	push	$ra

main__body:
	li	$a0, 11		# int result = sum4(11, 13, 17, 19);
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4


	move	$a0, $v0	# printf("%d\n", result);
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

	li	$v0, 0

main__epilogue:
	pop	$ra
	end

	jr	$ra



sum4:
	# a in $a0, b in $a1, c in $a2, d in $a3
sum4__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2

sum4__body:
	move	$s0, $a2
	move	$s1, $a3

	li	$a0, a
	li	$a1, b
	jal	sum2		# int res1 = sum2(a, b);
	move	$s2, $v0

	move	$a0, $s0
	move	$a1, $s1
	jal	sum2		# int res2 = sum2(c, d);

	move	$a0, $s2
	move	$a1, $v0
	jal	sum2		# return sum2(res1, res2);

sum4__epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra




sum2:
	# x in $a0, y in $a1
sum2__prologue:

sum2__body:
	add	$v0, $a0, $a1	# return x + y;

sum2__epilogue:
	jr	$ra







