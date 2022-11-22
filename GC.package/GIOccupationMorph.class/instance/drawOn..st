drawing
drawOn: aCanvas

	aCanvas 
		frameAndFillRectangle: (self bounds withRight: self bounds left + (self extent x * self occupationPercentage) floor)
		fillStyle: self filledColor
		borderStyle: self borderStyle.
		
	aCanvas 
		frameAndFillRectangle: (self bounds withLeft: self bounds left + (self extent x * self occupationPercentage) ceiling)
		fillStyle: self emptyColor
		borderStyle: self borderStyle.
		
	aCanvas
		line: (self bounds left + (self bounds width * self limit)) @ self bounds top
		to: (self bounds left + (self bounds width * self limit)) @ self bounds bottom
		width: 3
		color: Color black.
		
	aCanvas 
		drawString: (self occupationPercentage * 100) truncated asString
		at:self bounds center