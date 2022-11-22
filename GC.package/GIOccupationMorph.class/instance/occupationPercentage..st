accessing
occupationPercentage: anObject

	occupationPercentage := anObject clampLow: 0 high: 1.
	self changed