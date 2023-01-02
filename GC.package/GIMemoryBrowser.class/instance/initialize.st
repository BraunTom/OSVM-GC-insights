initialize-release
initialize

	super initialize.
	self memoryState: self primitiveMemoryState.
	self memoryInfo: GIBrowser new parsedStats