

main:

main__prologue:


main__body:
	li	$a0, 6
	jal	mul_by_100

	move	$a0, $v0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall


main__epilogue:

	jr	$ra


mul_by_100:
	mul	$t1, $a0, 100

	move	$v0, $t1
	jr	$ra