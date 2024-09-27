
main:
	# $t0 = y

	li	$v0, 5		# scanf("%d", &y);
	syscall

	move	$t0, $v0
	sw	$t0, y


	# x = (y + 2000) * (y + 3000);
	add	$t1, $t0, 2000
	addi	$t2, $t0, 3000
	mul	$t1, $t1, $t2		# value x in $t1
	sw	$t1, x


	# b = $t9
	# c = $t8
	# a = $t7

	# and part
	beqz	$t9, or_cond	# if !b, check a
	div	$t6, $t8, 4	# $t6 = c/4
	bge	$t6, 10, or_cond

	b	if statement_inside

or_cond:
	bne	$t7, 9, else


if_statement_inside:
	# do something here!

else:
	jr	$ra

	.data
x:	.space 4		#  int x;
y:	.space 4		# int y;
