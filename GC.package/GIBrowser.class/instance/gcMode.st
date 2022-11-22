GC state
gcMode

	^ (self gcStats at: 1) caseOf: {
		[0] -> ['stop-the-world GC'].
		[1] -> ['incremental GC'].
	}
		