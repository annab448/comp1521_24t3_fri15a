
main:
	li	$v0, 5	# scanf("%d", &y);
	syscall
	sw	$v0, y

	mul	$t0, $v0, 2	# x = y*2;
	sw	$t0, x
	# x in $t0., y in $v0
	# complicated expressions

	mul	$t2, $t0, $t0 	# x*x
	mul	$t3, $v0, $v0	# y*y
	add	$t2, $t3, $t2	# $t2 = (x*x + y*y)
	mul	$t3, $t0, $v0	# $t2 = xy
	sub	$t2, $t2, $t3	# $t2 = ((x*x + y*y) - x*y)
	mul	$t2, $t2, 2	# $t2 = z = z  = ((x*x + y*y) - x*y) * 2



	# if ((a && z % 2 == 0) || x = 100) {
	# a $t1
	# z $t2
	# x $t0
	beqz	$t1, check_x_100 	# if !a
	mod	$t4, $t2, 2
	bnez	$t4, check_x_100
	b	if

check_x_100:
	bne	$t0, 100, endif

if:
		# do somethinb
endif:
	.data

x:
	.space	4
y:
	.space	4