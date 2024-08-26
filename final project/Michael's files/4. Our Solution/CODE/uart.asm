#--------------------------------------------------------------
#		    MEMORY Mapped I/O
#--------------------------------------------------------------
#define PORT_LEDR[7-0] 0x800 - LSB byte (Output Mode)
#------------------- PORT_HEX0_HEX1 ---------------------------
#define PORT_HEX0[7-0] 0x804 - LSB byte (Output Mode)
#define PORT_HEX1[7-0] 0x805 - LSB byte (Output Mode)
#------------------- PORT_HEX2_HEX3 ---------------------------
#define PORT_HEX2[7-0] 0x808 - LSB byte (Output Mode)
#define PORT_HEX3[7-0] 0x809 - LSB byte (Output Mode)
#------------------- PORT_HEX4_HEX5 ---------------------------
#define PORT_HEX4[7-0] 0x80C - LSB byte (Output Mode)
#define PORT_HEX5[7-0] 0x80D - LSB byte (Output Mode)
#--------------------------------------------------------------
#define PORT_SW[7-0]   0x810 - LSB byte (Input Mode)
#--------------------------------------------------------------
#define PORT_KEY[3-1]  0x814 - LSB nibble (3 push-buttons - Input Mode)
#--------------------------------------------------------------
#define UTCL           0x818 - Byte 
#define RXBF           0x819 - Byte 
#define TXBF           0x81A - Byte
#--------------------------------------------------------------
#define BTCTL          0x81C - LSB byte 
#define BTCNT          0x820 - Word 
#define BTCCR0         0x824 - Word 
#define BTCCR1         0x828 - Word 
#--------------------------------------------------------------
#define IE             0x82C - LSB byte 
#define IFG            0x82D - LSB byte
#define TYPE           0x82E - LSB byte

# ------------------------ Definitions ------------------------
# s0 '1' when send msg to PC else '0'
# s1 '1' when counter upwards else '0'
# t0 for updating registers
# t1 for fucntion states 
# t2 for BasicTimer counter value 
# t3 for Tx index counter
# t4 for Tx pointer counter
# t5 for KEY1 counter
# t6 for KEY2 counter
# t7 for KEY3 counter
#--------------------------------------------------------------

#---------------------- Data Segment --------------------------
.data 
	IV: 	.word main            # Start of Interrupt Vector Table
		.word UartRX_ISR
		.word UartRX_ISR
		.word UartTX_ISR
	        .word BT_ISR
		.word KEY1_ISR
		.word KEY2_ISR
		.word KEY3_ISR
		
	msg:	.word 0x49 0x20 0x6C 0x6F 0x76 0x65 0x20 0x6D 0x79 0x20 0x4E 0x65 0x67 0x65 0x76 0x0A
	#  	      'I'       'l'  'o'  'v'  'e'       'm'  'y'       'N'  'e'  'g'  'e'  'v' '\n'		
#---------------------- Code Segment --------------------------	
.text
main:	addi $sp,$0,0x800 # $sp=0x800
	addi $s0,$0,0     # clear option 4 pressed flag
	addi $s1,$0, 0    # uart counter up/down flag
	
	addi $t5, $0, 0
	addi $t6, $0, 0
	addi $t7, $0, 0
	
	addi $t0,$0,0x26  
	sw   $t0,0x81C       # BTCTL=0x26(BTIP=6, BTSSEL=0, BTHOLD=1)
	sw   $0,0x820        # BTCNT=0
	addi $t0,$0,0x3B   
	sw   $t0,0x82C       # IE=0x3B (BTIE is disabled, all others enabled)
	sw   $0,0x82D        # IFG=0
	addi $t0,$0,0x0E  
	sw   $t0,0x81C       #  BTCTL=0x0E (BTIP=6, BTSSEL=1, BTHOLD=0 - 50MHz/2^25)
	addi $t0,$0,0x09
	sw   $t0,0x818       # UTCL=0x09 (SWRST=1,115200 BR)
	addi $t0,$0,0x08
	sw   $t0,0x818       # UTCL=0x08 (SWRST=0,115200 BR)
	ori  $k0,$k0,0x01    
	addi $t0,$0,0xAB  # EINT, $k0[0]=1 uses as GIE
	
L:	j    L		    # infinite loop
	
KEY1_ISR: 
	addi $t5,$t5,1  
	sw   $t5,0x804 # write to PORT_HEX0[7-0]
	
	lw   $t0,0x82D # read IFG
	andi $t0,$t0,0xFFF7 
	sw   $t0,0x82D # clr KEY1IFG
	
	beq  $s0, $0, LeaveISR
	addi $t3,$0,0  		# index = 0
	la   $t4, msg		# get pointer
	lw   $t0, 0($t4)	
	sw   $t0,0x81A 		# write to trig TxIntr
	j    LeaveISR
	
KEY2_ISR:
	addi $t6,$t6,1
	sw   $t6,0x805 # write to PORT_HEX1[7-0]
	
	lw   $t0,0x82D # read IFG
	andi $t0,$t0,0xFFEF 
	sw   $t0,0x82D # clr KEY1IFG
	j    LeaveISR

KEY3_ISR:
	addi $t7, $t7, 1
	sw   $t7,0x808 # write to PORT_HEX2[7-0]

	lw   $t0,0x82D # read IFG
	andi $t0,$t0,0xFFDF 
	sw   $t0,0x82D # clr KEY1IFG
	j    LeaveISR

BT_ISR:
	bne  $s1, $0, BT_down
	addi $t2, $t2, 1
	j    SetLEDs
BT_down:addi $t2, $t2, -1
SetLEDs:sw   $t2,0x800
	j    LeaveISR

UartRX_ISR:
	addi $s0, $0, 0
	lw   $t0, 0x819
	
	addi $t1, $0, 0x31
	beq  $t0, $t1, ClearLEDs
	
	addi $t1, $0, 0x32
	beq  $t0, $t1, CountUp
	
	addi $t1, $0, 0x33
	beq  $t0, $t1, CountDown
	
	addi $t1, $0, 0x34
	beq  $t0, $t1, SendMsg
	
	j    LeaveISR
	
ClearLEDs: 	# get '1' from PC
	addi $t0,$0,0x3B  	# BTIE is disabled
	sw   $t0,0x82C       
	sw   $0, 0x800
	j    LeaveISR
	
CountUp:	 # get '2' from PC
	addi $t2, $0, 0		# init timer
	addi $s1, $0, 0		# 0 when count up (1 when down)
	addi $t0,$0,0x3F  	# BTIE is enabled
	sw   $t0,0x82C
	j    LeaveISR
	
CountDown:	# get '3' from PC
	addi $t2, $0, 0xFF	# init timer
	addi $s1, $0, 1		# 1 when count down (0 when up)
	addi $t0,$0,0x3F  	# BTIE is enabled
	sw   $t0,0x82C 
	j    LeaveISR

SendMsg:	# get '4' from PC
	addi $t0,$0,0x3B  	# BTIE is disabled
	sw   $t0,0x82C
	addi $s0, $0, 1		# 1 when send msg (0 when inside funcs)	
	j    LeaveISR

UartTX_ISR:
	addi $t3, $t3, 1
	addi $t4, $t4, 4
	slti $t0, $t3, 16
	beq  $t0, $0, LeaveISR
	lw   $t0, 0($t4)
	sw   $t0, 0x81A
	j    LeaveISR

LeaveISR:
	jr   $k1