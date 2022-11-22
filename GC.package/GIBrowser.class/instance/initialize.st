initialize-release
initialize

	self edenMorph: GIOccupationMorph new.
	self oldSpaceMorphs: OrderedCollection new.
	self updateStats
	