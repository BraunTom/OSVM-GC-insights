as yet unclassified
updateStats

	self gcStats: self getGCInfo.
	self changed: #gcMode.
	self changed: #gcPhase.
	
	self updateEdenOccupacy.
	self updateOldSpaceOccupacy