POINT_X_OFFSET = 0
POINT_Y_OFFSET = 4

main:
	la	$t0, P

	lw	$t1, POINT_X_OFFSET($t0) 
	lw	$t2, POINT_Y_OFFSET($t0)

	mul	$t1, $t1, 2
	sw	$t1, POINT_X_OFFSET($t0)

	.data
P:
	.word 6
	.word 10
