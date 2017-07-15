#############################################################################-80
# My First ASM Program
.data
newline:        .byte 10, 0
promptOne:      .asciiz "Please enter an integer > "
promptTwo:      .asciiz "Please enter Byte position (0 - 3) > "
promptThree:    .asciiz "Please enter a bit to sum (0 or 1) > "
numberOf:	    .asciiz "The number of "
in:	    .asciiz "'s in "
is:	    .asciiz " is: "
space:	    .asciiz " "

.text
main:
 
    # Prompt for an integer
    li $v0, 0x00000004
    la $a0, promptOne 
    syscall
    
    # Read user input Integer
    li   $v0, 0x00000005
    syscall
    move $s1, $v0    # move integer read into $s1
    
    # Prompt for an byte position
    li $v0, 0x00000004
    la $a0, promptTwo
    syscall
    
    # Read Integer
    li   $v0, 0x00000005
    syscall
    move $s2, $v0    # move byte position read into $s2
    
    # Prompt for bit (0 or 1)
    li $v0, 0x00000004
    la $a0, promptThree 
    syscall
    
    # Read Integer
    li   $v0, 0x00000005
    syscall
    move $s3, $v0    # move "0 or 1" read into $s3    
    
 
    #-------- Printing Final Statement ----------------#
    # Print output message
    li $v0, 0x00000004
    la $a0, numberOf  
    syscall
    
    # print 0 or 1 (s3)
    li $v0, 0x00000001
    add $a0, $s3, $zero
    syscall
    
    # Print in
    li $v0, 0x00000004
    la $a0, in
    syscall
    
    # Print user input integer (s1)
    li $v0, 0x00000001
    add $a0, $s1, $zero
    syscall
    
    li $v0, 0x00000004
    la $a0, is
    syscall
    
    # Move the given integer to the given byte address
    # $s0 is temporary variable
       
    sll $s0, $s2, 0x00000003	# multiply the given bite by 8 to get 
    srlv $s0, $s1, $s0		# move the given integer to the desired
    not $s6, $s3
   
    xor $s7, $s0, $s6

    andi $s5, $s7, 0x00000001	# save the last bit of s0 in s5

    srl $s4, $s0, 0x0000001	# shift s0 to one bit on right
    xor $s7, $s4, $s6 
    andi $s7, $s7, 0x00000001
    add $s5, $s5, $s7
    srl $s4, $s0, 0x0000002
    xor $s7, $s4, $s6
    andi $s7, $s7, 0x00000001
    add $s5, $s5, $s7
    srl $s4, $s0, 0x0000003
    xor $s7, $s4, $s6
    andi $s7, $s7, 0x00000001
    add $s5, $s5, $s7
    srl $s4, $s0, 0x0000004
    xor $s7, $s4, $s6
    andi $s7, $s7, 0x00000001
    add $s5, $s5, $s7
    srl $s4, $s0, 0x0000005
    xor $s7, $s4, $s6
    andi $s7, $s7, 0x00000001
    add $s5, $s5, $s7
    srl $s4, $s0, 0x0000006
    xor $s7, $s4, $s6
    andi $s7, $s7, 0x00000001
    add $s5, $s5, $s7
    srl $s4, $s0, 0x0000007
    xor $s7, $s4, $s6
    andi $s7, $s7, 0x00000001
    add $s5, $s5, $s7

    
    # Print Integer
    add $a0, $s5, $zero
    li   $v0, 0x00000001
    syscall
    
    
    #-------------- Final Statement End -------------#

    li $v0, 0x0000000a          # exit
    syscall
