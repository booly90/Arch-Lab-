.data  
	a1: .word 1
	b1: .word 2
	c1: .word 3
	d1: .word 4
	a2: .word 0
	b2: .word 0
	c2: .word 0
	d2: .word 0
.text

	lw $t1,a1		
	lw $t2,b1		
	lw $t3,c1		
	lw $t4,d1		
	
	sw $t1,a2		
	sw $t2,b2		
	sw $t3,c2		
	sw $t4,d2			
	
END:	beq $0,$0,END	
