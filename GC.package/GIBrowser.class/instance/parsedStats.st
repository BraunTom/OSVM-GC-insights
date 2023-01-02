as yet unclassified
parsedStats

	| info stats segmentData staticStatCount segmentDataCount oldSpaceSegmentCount |
	info := self getGCInfo.
	stats := Dictionary new.
	
	{
		#gcMode.
		#gcPhase.
		#edenStart.
		#edenLimit.
		#freeStart.
		#scavengeThreshold.
		#statSurvivorCount.
		#oldSpaceSegmentCount
	} withIndexDo: [:each :index| stats at: each put: (info at: index)].
	
	staticStatCount := stats size.
	"contains 5 informations"
	segmentDataCount := 5.
	oldSpaceSegmentCount := stats at: #oldSpaceSegmentCount.
	segmentData := Array new: oldSpaceSegmentCount.
	
	0 to: oldSpaceSegmentCount - 1
		do: [:index | 
			segmentData at: index + 1 put: (Dictionary newFrom: ({
				#segmentStart.
				#segmentSize.
				#segmentOccupation.
				#containsPinned.
				#toBeCompacted
			} withIndexCollect: [:each :i | each -> (info at: staticStatCount + (index * segmentDataCount) + i)]))].
		
	stats at: #oldSpaceSegments put: segmentData.
	
	
	^ stats