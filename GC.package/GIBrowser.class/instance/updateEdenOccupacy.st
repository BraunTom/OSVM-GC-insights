as yet unclassified
updateEdenOccupacy

	| edenStart edenLimit freeStart scavengeThreshold edenSize occupiedSpace |
	edenStart := self gcStats at: 3.
	edenLimit := self gcStats at: 4.
	freeStart := self gcStats at: 5.
	scavengeThreshold := self gcStats at: 6.
	
	edenSize :=  edenLimit - edenStart.
	occupiedSpace := freeStart - edenStart.

	self edenMorph 
		occupationPercentage: occupiedSpace / edenSize;
		limit: (scavengeThreshold - edenStart) / edenSize
	
	