// =======================================================================================
// This Sail RISC-V architecture model, comprising all files and
// directories except where otherwise noted is subject the BSD
// two-clause license in the LICENSE file.
//
// SPDX-License-Identifier: BSD-2-Clause
// =======================================================================================

newtype mregidx = Mregidx : bits(5)
newtype mregno = Mregno : range(0, 31)

enum imt_dtypes = {INT_8, INT_16, INT_32, UINT_8, UINT_16, UINT_32, NONE}

struct imt_register = {
	width : xlenbits,
	height : xlenbits,
	prf_x : xlenbits,
	prf_y : xlenbits,
	dtype : imt_dtypes
}

function imtSize (t : imt_dtypes) -> int =
	match t {
		INT_8 => 1,
		INT_16 => 2,
		INT_32 => 4,
		UINT_8 => 1,
		UINT_16 => 2,
		UINT_32 => 4,
		NONE => 4,
	}

function imtIsUnsigned (t : imt_dtypes) -> bool =
	match t {
		INT_8 => false,
		INT_16 => false,
		INT_32 => false,
		UINT_8 => true,
		UINT_16 => true,
		UINT_32 => true,
		NONE => true,
	}

val EXTZ : forall 'n 'm, 'm >= 'n. (implicit('m), bits('n)) -> bits('m)
function EXTZ(m, v) = sail_zero_extend(v, m)

val EXTS : forall 'n 'm, 'm >= 'n. (implicit('m), bits('n)) -> bits('m)
function EXTS(m, v) = sail_sign_extend(v, m)