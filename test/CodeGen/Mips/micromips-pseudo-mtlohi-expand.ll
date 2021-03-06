; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=mipsel-linux-gnu -mcpu=mips32r2 -mattr=+micromips -asm-show-inst < %s |\
; RUN:   FileCheck %s -check-prefixes=MMR2
; RUN: llc -mtriple=mipsel-linux-gnu -mcpu=mips32r2 -mattr=+dsp,+micromips -asm-show-inst < %s |\
; RUN:   FileCheck %s -check-prefixes=MMR2-DSP

define i64 @test(i32 signext %a, i32 signext %b) {
; MMR2-LABEL: test:
; MMR2:       # %bb.0: # %entry
; MMR2-NEXT:    li16 $2, 0 # <MCInst #1700 LI16_MM
; MMR2-NEXT:    # <MCOperand Reg:321>
; MMR2-NEXT:    # <MCOperand Imm:0>>
; MMR2-NEXT:    li16 $3, 1 # <MCInst #1700 LI16_MM
; MMR2-NEXT:    # <MCOperand Reg:322>
; MMR2-NEXT:    # <MCOperand Imm:1>>
; MMR2-NEXT:    mtlo $3 # <MCInst #2008 MTLO_MM
; MMR2-NEXT:    # <MCOperand Reg:322>>
; MMR2-NEXT:    mthi $2 # <MCInst #2001 MTHI_MM
; MMR2-NEXT:    # <MCOperand Reg:321>>
; MMR2-NEXT:    madd $4, $5 # <MCInst #1774 MADD
; MMR2-NEXT:    # <MCOperand Reg:22>
; MMR2-NEXT:    # <MCOperand Reg:23>>
; MMR2-NEXT:    mflo16 $2 # <MCInst #1860 MFLO16_MM
; MMR2-NEXT:    # <MCOperand Reg:321>>
; MMR2-NEXT:    mfhi16 $3 # <MCInst #1854 MFHI16_MM
; MMR2-NEXT:    # <MCOperand Reg:322>>
; MMR2-NEXT:    jrc $ra # <MCInst #1632 JRC16_MM
; MMR2-NEXT:    # <MCOperand Reg:19>>
;
; MMR2-DSP-LABEL: test:
; MMR2-DSP:       # %bb.0: # %entry
; MMR2-DSP-NEXT:    li16 $2, 0 # <MCInst #1700 LI16_MM
; MMR2-DSP-NEXT:    # <MCOperand Reg:321>
; MMR2-DSP-NEXT:    # <MCOperand Imm:0>>
; MMR2-DSP-NEXT:    li16 $3, 1 # <MCInst #1700 LI16_MM
; MMR2-DSP-NEXT:    # <MCOperand Reg:322>
; MMR2-DSP-NEXT:    # <MCOperand Imm:1>>
; MMR2-DSP-NEXT:    mtlo $3, $ac0 # <MCInst #2006 MTLO_DSP
; MMR2-DSP-NEXT:    # <MCOperand Reg:291>
; MMR2-DSP-NEXT:    # <MCOperand Reg:322>>
; MMR2-DSP-NEXT:    mthi $2, $ac0 # <MCInst #1999 MTHI_DSP
; MMR2-DSP-NEXT:    # <MCOperand Reg:253>
; MMR2-DSP-NEXT:    # <MCOperand Reg:321>>
; MMR2-DSP-NEXT:    madd $ac0, $4, $5 # <MCInst #1792 MADD_DSP
; MMR2-DSP-NEXT:    # <MCOperand Reg:26>
; MMR2-DSP-NEXT:    # <MCOperand Reg:22>
; MMR2-DSP-NEXT:    # <MCOperand Reg:23>
; MMR2-DSP-NEXT:    # <MCOperand Reg:26>>
; MMR2-DSP-NEXT:    mflo $2, $ac0 # <MCInst #1862 MFLO_DSP
; MMR2-DSP-NEXT:    # <MCOperand Reg:321>
; MMR2-DSP-NEXT:    # <MCOperand Reg:26>>
; MMR2-DSP-NEXT:    jr $ra # <MCInst #1639 JR_MM
; MMR2-DSP-NEXT:    # <MCOperand Reg:19>>
; MMR2-DSP-NEXT:    mfhi $3, $ac0 # <MCInst #1856 MFHI_DSP
; MMR2-DSP-NEXT:    # <MCOperand Reg:322>
; MMR2-DSP-NEXT:    # <MCOperand Reg:26>>
entry:
  %conv = sext i32 %a to i64
  %conv1 = sext i32 %b to i64
  %mul = mul nsw i64 %conv, %conv1
  %add = add nsw i64 %mul, 1
  ret i64 %add
}
