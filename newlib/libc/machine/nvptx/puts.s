// Support file for nvptx in newlib.
// Copyright (c) 2014 Mentor Graphics.

// The authors hereby grant permission to use, copy, modify, distribute,
// and license this software and its documentation for any purpose, provided
// that existing copyright notices are retained in all copies and that this
// notice is included verbatim in any distributions. No written agreement,
// license, or royalty fee is required for any of the authorized uses.
// Modifications to this software may be copyrighted by their authors
// and need not follow the licensing terms described here, provided that
// the new terms are clearly indicated on the first page of each file where
// they apply.

        .version        3.1
        .target sm_30
        .address_size 64

// BEGIN GLOBAL FUNCTION DEF: puts
.const .align 1 .u8 $LC0[4] = { 37, 115, 10, 0 };
.extern .func (.param.u32 retval) vprintf (.param.u64 fmt, .param.u64 valist);
.visible .func (.param.u32 retval) puts (.param.u64 s)
{
	.reg.u64	r1, r2, r3;
	.param.u32	inretval;
	.param.u64	fmt, valist;
       	.local.b64	vaary[1];

	cvta.const.u64	r1, $LC0;
	ld.param.u64	r2,[s];
	st.param.u64	[fmt], r1;
	st.local.u64	[vaary], r2;
	cvta.local.u64	r3, vaary;
	st.param.u64	[valist], r3;
	call (inretval), vprintf, (fmt, valist);
	ld.param.u32	r1, [inretval];
	st.param.u32	[retval], r1;
}
// END FUNCTION DEF
