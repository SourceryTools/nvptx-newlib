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

	.version 3.1
	.target	sm_30
	.address_size 64

// BEGIN GLOBAL FUNCTION DEF: printf
.extern .func (.param.u32 retval) vprintf (.param.u64 fmt, .param.u64 valist);
.visible .func (.param.u32 retval) printf (.param.u64 fmt, .param.u64 valist)
{
	.reg.u64	r1, r2;
	.param.u64	outfmt, outvalist;
	.param.u32	inretval;
	ld.param.u64	r1, [fmt];
	ld.param.u64	r2, [valist];
	st.param.u64	[outfmt], r1;
	st.param.u64	[outvalist], r2;
	call (inretval), vprintf, (outfmt, outvalist);
	ld.param.u32	r1, [inretval];
	st.param.u32	[retval], r1;
	ret;
}
