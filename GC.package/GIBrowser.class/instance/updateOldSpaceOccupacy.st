as yet unclassified
updateOldSpaceOccupacy

	| segmentCount segmentDataStart segmentInfoCount |
	segmentCount := self gcStats at: 8.
	
	self oldSpaceMorphs size ~= segmentCount
		ifTrue: [self oldSpaceMorphs: ((Array new: segmentCount) 
					collect: [:ea | GIOccupationMorph new 
								limit: 1; 
								yourself]).
					
				self changed: #oldSpaceVisualisation].
	
	segmentDataStart := 9.
	segmentInfoCount := 5.
	
	0 to: segmentCount - 1
		do: [:index | | baseindex segmentStart segmentSize segmentOccupation containsPinned getsCompacted | 
			baseindex := segmentDataStart + (index * segmentInfoCount).
			segmentStart := self gcStats at: baseindex.
			segmentSize := self gcStats at: baseindex + 1. 
			segmentOccupation := self gcStats at: baseindex + 2. 
			containsPinned := self gcStats at: baseindex + 3. 
			getsCompacted := self gcStats at: baseindex + 4. 
			
			"calculation here is the counterpart to how it is set in the vm"
			(self oldSpaceMorphs at: index + 1) 
				occupationPercentage: (segmentOccupation asFloat / 16rFFFF)]
	
	