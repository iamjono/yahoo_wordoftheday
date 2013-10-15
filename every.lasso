[
	/* ===================================
	Thanks Ke Carlton! 
	http://www.lassosoft.com/tagswap/detail/every
	=================================== */
define every(seconds::integer) => {
	local(
		gb =  givenblock,
		v = '_poll_'+#gb->self->type + #gb->methodname,
		last = var(#v),
		since = #last ? #last->secondsBetween(date) | #seconds
	)   
	if(#since >= #seconds) => {
		handle => { var(#v) = date }
		return #gb() || #seconds
	else
		return (#seconds - #since)
	}
}
]