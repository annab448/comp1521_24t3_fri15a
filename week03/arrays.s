N_SIZE=10

main:
	# $t0	i

	li	$t0, 0		# i = 0
loop_cond:
	bge	$t0, N_SIZE, loop_end

	li	$v0, 5		# scanf("%d", &numbers[i]);
	syscall
	# number in $v0

	# calculate address of numbers[i]
	la	$t1, numbers	# $t1 = &numbers[0]
	mul	$t2, $t0, 4	# $t2 = i*sizeof(element)
	add	$t2, $t2, $t1	# $t2 = &numbers[i]

	sw	$v0, ($t2)

	addi	$t0, $t0, 1
	b	loop_cond

loop_end:
	jr	$ra


	.data
numbers:			# int numbers[N_SIZE] = {0};
	.word	10:0
