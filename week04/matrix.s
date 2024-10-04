WIDTH=4
HEIGHT=3

main:
main__prologue:
	begin
	push	$ra

main__body:

	# change(3, 4, M, 2)
	li   $a0, 3
	li   $a1, 4
	la   $a2, M
	li   $a3, 2
	jal  change

	li	$t0, 0			# row = 0
main__row_loop:
	bge	$t0, 3, main__row_end	# while (row < 3) {

	li	$t1, 0			# col = 0
main__col_loop:
	bge	$t1, 4, main__col_end	# while (col < 4) {

	mul	$t2, $t0, WIDTH
	mul	$t2, $t2, 4		# $t2 = row * WIDTH * sizeof(int)
	mul	$t3, $t1, 4		# $t3 = col * sizeof(int)
	add	$t2, $t3, $t2
	lw	$a0, M($t2)		# $a0 = M[row][col]

	li	$v0, 1			# printf("%d", M[row][col])
	syscall

	li	$a0, '\t'		# printf("\t")
	li	$v0, 11
	syscall

	addi	$t1, $t1, 1	# col++
	b main__col_loop
main__col_end:

	li	$v0, 11			# printf("\n")
	li	$a0, '\n'
	syscall

	addi	$t0, $t0, 1	# row++
	b	main__row_loop

main__row_end:

main__epilogue:
	pop	$ra
	end

	jr	$ra

change:
change__prologue:

change__body:

change__epilogue:
	jr	$ra

	.data

M:	.word 1, 2, 3, 4
	.word 3, 4, 5, 6
	.word 5, 6, 7, 8

