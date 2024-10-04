FLAG_ROWS = 6
FLAG_COLS = 12

main:

	li	$t0, 0		# row = 0
main__row_loop:
	bge	$t0, FLAG_ROWS, main__row_end

	li	$t1, 0		# col = 0
main__col_loop:
	bge	$t1, FLAG_COLS, main__col_end

	# printf("%c", flag[row][col]);
	mul	$t2, $t0, FLAG_COLS	# $t2 = row * sizof(row)
	add	$t2, $t2, $t1		#       + col
	lb	$a0, flag($t2)

	li	$v0, 11
	syscall


	addi	$t1, $t1, 1	# col ++
	b	main__col_loop
	
main__col_end:
	li	$v0, 11		# printf("\n");
	li	$a0, '\n'
	syscall

	addi	$t0, $t0, 1
	b	main__row_loop

main__row_end:
	
	jr	$ra		# return;	


	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
