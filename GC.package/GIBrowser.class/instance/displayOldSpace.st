display
displayOldSpace

	self updateVisualizationCount.
	self updateVisualizations
	self segments 
		do: [:segment | self displaySegment: segment]