GC state
gcPhase
	
	^ (self gcStats at: 2) caseOf: {
		[0] -> ['marking'].
		[1] -> ['sweeping'].
		[2] -> ['compacting'].
	}
		