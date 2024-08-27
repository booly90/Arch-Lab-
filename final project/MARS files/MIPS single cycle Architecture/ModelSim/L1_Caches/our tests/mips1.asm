.data
  # Define some data in memory
  var1: .word 10         # variable 1 initialized to 10
  var2: .word 20         # variable 2 initialized to 20
  result: .word 0        # variable to store result
  t2_result: .word 0     # to store $t2
  t3_result: .word 0     # to store $t3
  t4_result: .word 0     # to store $t4
  t5_result: .word 0     # to store $t5
  t6_result: .word 0     # to store $t6
  t7_result: .word 0     # to store $t7
  t8_result: .word 0     # to store $t8
  t9_result: .word 0     # to store $t9
  s0_result: .word 0     # to store $s0
  s1_result: .word 0     # to store $s1
  s2_result: .word 0     # to store $s2
  s3_result: .word 0     # to store $s3
  s4_result: .word 0     # to store $s4
  s5_result: .word 0     # to store $s5
  s6_result: .word 0     # to store $s6
  s7_result: .word 0     # to store $s7
  s8_result: .word 0     # to store $s8

.text
.globl main
main:
  # Load values from memory to registers
  lw   $t0, var1         # Load var1 into $t0
  lw   $t1, var2         # Load var2 into $t1

  # Test ADD, SUB, and ADDI
  add  $t2, $t0, $t1     # $t2 = $t0 + $t1
  sw   $t2, t2_result    # Store $t2 into memory
  sub  $t3, $t1, $t0     # $t3 = $t1 - $t0
  sw   $t3, t3_result    # Store $t3 into memory
  addi $t4, $t0, 5       # $t4 = $t0 + 5
  sw   $t4, t4_result    # Store $t4 into memory

  # Test MUL, AND, OR, XOR
  mul  $t5, $t0, $t1     # $t5 = $t0 * $t1
  sw   $t5, t5_result    # Store $t5 into memory
  and  $t6, $t0, $t1     # $t6 = $t0 & $t1
  sw   $t6, t6_result    # Store $t6 into memory
  or   $t7, $t0, $t1     # $t7 = $t0 | $t1
  sw   $t7, t7_result    # Store $t7 into memory
  xor  $t8, $t0, $t1     # $t8 = $t0 ^ $t1
  sw   $t8, t8_result    # Store $t8 into memory

  # Test ANDI, ORI, XORI
  andi $t9, $t0, 0x0F    # $t9 = $t0 & 0x0F
  sw   $t9, t9_result    # Store $t9 into memory
  ori  $s0, $t0, 0xF0    # $s0 = $t0 | 0xF0
  sw   $s0, s0_result    # Store $s0 into memory
  xori $s1, $t0, 0xAA    # $s1 = $t0 ^ 0xAA
  sw   $s1, s1_result    # Store $s1 into memory

  # Test SLL, SRL
  sll  $s2, $t0, 2       # $s2 = $t0 << 2
  sw   $s2, s2_result    # Store $s2 into memory
  srl  $s3, $t1, 1       # $s3 = $t1 >> 1
  sw   $s3, s3_result    # Store $s3 into memory

  # Test LUI (Load Upper Immediate)
  lui  $s4, 0x1234       # $s4 = 0x12340000
  sw   $s4, s4_result    # Store $s4 into memory

  # Test BEQ, BNE
  beq  $t0, $t1, equal   # If $t0 == $t1, jump to equal
  bne  $t0, $t1, notequal # If $t0 != $t1, jump to notequal

equal:
  addi $s5, $zero, 1     # $s5 = 1 (flag for equal)
  sw   $s5, s5_result    # Store $s5 into memory
  j end

notequal:
  addi $s5, $zero, 0     # $s5 = 0 (flag for not equal)
  sw   $s5, s5_result    # Store $s5 into memory

  # Test SLT, SLTI
  slt  $s6, $t0, $t1     # $s6 = 1 if $t0 < $t1, else $s6 = 0
  sw   $s6, s6_result    # Store $s6 into memory
  slti $s7, $t0, 15      # $s7 = 1 if $t0 < 15, else $s7 = 0
  sw   $s7, s7_result    # Store $s7 into memory

  # Test J, JR, JAL
  jal  func              # Jump to function
  j end

func:
  addi $t8, $zero, 42    # $s8 = 42
  sw   $t8, s8_result    # Store $s8 into memory
  jr   $ra               # Return from function

end:
  # Infinite loop to stop execution
  j end
