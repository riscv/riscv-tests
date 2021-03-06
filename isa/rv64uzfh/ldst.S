# See LICENSE for license details.

#*****************************************************************************
# ldst.S
#-----------------------------------------------------------------------------
#
# This test verifies that flw, fld, fsw, and fsd work properly.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_CASE(2, a0, 0xcafe1000deadbeef, la a1, tdat; flh f1, 4(a1); fsh f1, 20(a1); ld a0, 16(a1))
  TEST_CASE(3, a0, 0x1337d00dabad0001, la a1, tdat; flh f1, 0(a1); fsh f1, 24(a1); ld a0, 24(a1))

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

tdat:
.word 0xbf800001
.word 0x40001000
.word 0x40400000
.word 0xc0800000
.word 0xdeadbeef
.word 0xcafebabe
.word 0xabad1dea
.word 0x1337d00d

RVTEST_DATA_END
