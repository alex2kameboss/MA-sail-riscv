// =======================================================================================
// This Sail RISC-V architecture model, comprising all files and
// directories except where otherwise noted is subject the BSD
// two-clause license in the LICENSE file.
//
// SPDX-License-Identifier: BSD-2-Clause
// =======================================================================================

//newtype mregidx = Mregidx : bits(5)
//newtype mregno = Mregno : range(0, 31)

function mregidx_to_mregno (Mregidx(b) : mregidx) -> mregno = Mregno(unsigned(b))
function mregno_to_mregidx (Mregno(b) : mregno) -> mregidx = Mregidx(to_bits(5, b))

function mregidx_offset(Mregidx(r) : mregidx, o : bits(5)) -> mregidx = Mregidx(r + o)
function mregidx_offset_range(Mregidx(r) : mregidx, o : range(0, 31)) -> mregidx = Mregidx(r + o)

overload operator + = { mregidx_offset, mregidx_offset_range }

function mregidx_bits (Mregidx(b) : mregidx) -> bits(5) = b

mapping encdec_mreg : mregidx <-> bits(5) = { Mregidx(r) <-> r }

val mreg_write_callback = pure {c: "mreg_write_callback"} : (mregidx, imt_register) -> unit
function mreg_write_callback(_) = ()

//let zvreg : vregidx = Vregidx(0b00000) // v0, zero register

// vector registers
register mr0 : imt_register
register mr1 : imt_register
register mr2 : imt_register
register mr3 : imt_register
register mr4 : imt_register
register mr5 : imt_register
register mr6 : imt_register
register mr7 : imt_register
register mr8 : imt_register
register mr9 : imt_register
register mr10 : imt_register
register mr11 : imt_register
register mr12 : imt_register
register mr13 : imt_register
register mr14 : imt_register
register mr15 : imt_register
register mr16 : imt_register
register mr17 : imt_register
register mr18 : imt_register
register mr19 : imt_register
register mr20 : imt_register
register mr21 : imt_register
register mr22 : imt_register
register mr23 : imt_register
register mr24 : imt_register
register mr25 : imt_register
register mr26 : imt_register
register mr27 : imt_register
register mr28 : imt_register
register mr29 : imt_register
register mr30 : imt_register
register mr31 : imt_register

mapping mreg_name_raw : bits(5) <-> string = {
    0b00000 <-> "m0",
    0b00001 <-> "m1",
    0b00010 <-> "m2",
    0b00011 <-> "m3",
    0b00100 <-> "m4",
    0b00101 <-> "m5",
    0b00110 <-> "m6",
    0b00111 <-> "m7",
    0b01000 <-> "m8",
    0b01001 <-> "m9",
    0b01010 <-> "m10",
    0b01011 <-> "m11",
    0b01100 <-> "m12",
    0b01101 <-> "m13",
    0b01110 <-> "m14",
    0b01111 <-> "m15",
    0b10000 <-> "m16",
    0b10001 <-> "m17",
    0b10010 <-> "m18",
    0b10011 <-> "m19",
    0b10100 <-> "m20",
    0b10101 <-> "m21",
    0b10110 <-> "m22",
    0b10111 <-> "m23",
    0b11000 <-> "m24",
    0b11001 <-> "m25",
    0b11010 <-> "m26",
    0b11011 <-> "m27",
    0b11100 <-> "m28",
    0b11101 <-> "m29",
    0b11110 <-> "m30",
    0b11111 <-> "m31"
}

mapping mreg_name : mregidx <-> string = { Mregidx(i) <-> mreg_name_raw(i) }

function rM (Mregno(r) : mregno) -> imt_register = {
  match r {
    0 => mr0,
    1 => mr1,
    2 => mr2,
    3 => mr3,
    4 => mr4,
    5 => mr5,
    6 => mr6,
    7 => mr7,
    8 => mr8,
    9 => mr9,
    10 => mr10,
    11 => mr11,
    12 => mr12,
    13 => mr13,
    14 => mr14,
    15 => mr15,
    16 => mr16,
    17 => mr17,
    18 => mr18,
    19 => mr19,
    20 => mr20,
    21 => mr21,
    22 => mr22,
    23 => mr23,
    24 => mr24,
    25 => mr25,
    26 => mr26,
    27 => mr27,
    28 => mr28,
    29 => mr29,
    30 => mr30,
    31 => mr31,
  }
}

function wM (Mregno(r) : mregno, m : imt_register) -> unit = {
  match r {
    0 => mr0 = m,
    1 => mr1 = m,
    2 => mr2 = m,
    3 => mr3 = m,
    4 => mr4 = m,
    5 => mr5 = m,
    6 => mr6 = m,
    7 => mr7 = m,
    8 => mr8 = m,
    9 => mr9 = m,
    10 => mr10 = m,
    11 => mr11 = m,
    12 => mr12 = m,
    13 => mr13 = m,
    14 => mr14 = m,
    15 => mr15 = m,
    16 => mr16 = m,
    17 => mr17 = m,
    18 => mr18 = m,
    19 => mr19 = m,
    20 => mr20 = m,
    21 => mr21 = m,
    22 => mr22 = m,
    23 => mr23 = m,
    24 => mr24 = m,
    25 => mr25 = m,
    26 => mr26 = m,
    27 => mr27 = m,
    28 => mr28 = m,
    29 => mr29 = m,
    30 => mr30 = m,
    31 => mr31 = m,
  };

  mreg_write_callback(mregno_to_mregidx(Mregno(r)), m);
}

function rM_bits(i: mregidx) -> imt_register = rM(mregidx_to_mregno(i))

function wM_bits(i: mregidx, data: imt_register) -> unit = {
  wM(mregidx_to_mregno(i)) = data
}

overload M = {rM_bits, wM_bits, rM, wM}

function init_mregs() -> unit = {
  let zero_mreg : imt_register = struct {
    width = zeros(),
    height = zeros(),
    prf_x = zeros(),
    prf_y = zeros(),
    dtype = NONE
  };
  mr0  = zero_mreg;
  mr1  = zero_mreg;
  mr2  = zero_mreg;
  mr3  = zero_mreg;
  mr4  = zero_mreg;
  mr5  = zero_mreg;
  mr6  = zero_mreg;
  mr7  = zero_mreg;
  mr8  = zero_mreg;
  mr9  = zero_mreg;
  mr10 = zero_mreg;
  mr11 = zero_mreg;
  mr12 = zero_mreg;
  mr13 = zero_mreg;
  mr14 = zero_mreg;
  mr15 = zero_mreg;
  mr16 = zero_mreg;
  mr17 = zero_mreg;
  mr18 = zero_mreg;
  mr19 = zero_mreg;
  mr20 = zero_mreg;
  mr21 = zero_mreg;
  mr22 = zero_mreg;
  mr23 = zero_mreg;
  mr24 = zero_mreg;
  mr25 = zero_mreg;
  mr26 = zero_mreg;
  mr27 = zero_mreg;
  mr28 = zero_mreg;
  mr29 = zero_mreg;
  mr30 = zero_mreg;
  mr31 = zero_mreg
}

