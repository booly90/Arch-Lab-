.data  
	i: .word 2
	g: .word 3
	h: .word 4
	f: .word 5
.text
	la $s0,i         #load address
	lw $t1,0($s0)	#$t1=i
	lw $t2,4($s0)	#$t2=g
	lw $t3,8($s0)	#$t3=h
	lw $t4,12($s0)	#$t4=f
	
