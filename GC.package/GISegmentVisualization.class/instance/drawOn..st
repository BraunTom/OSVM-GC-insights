as yet unclassified
drawOn: aCanvas

	| width currentXPosition currentYPosition colorArray |
	width := self width.
	currentXPosition := 0.
	currentYPosition := 0.
	colorArray := {Color red . Color blue}.
	
	segmentData do: [:ea | | objectsWidth |
		objectsWidth := ea bitAnd: 16rFFFFFFFFFFFFFF.
		
		[(currentXPosition + objectsWidth) < width
			ifTrue: [aCanvas 
						line: currentXPosition @ currentYPosition 
						to: currentXPosition + objectsWidth @ currentYPosition  
						color: (colorArray at: (ea >> 56) + 1).
						false]
			ifFalse:[aCanvas 
						line: currentXPosition @ currentYPosition 
						to: width @ currentYPosition  
						color: (colorArray at: (ea >> 56) + 1).
						objectsWidth := (currentXPosition + objectsWidth) - width.
						currentYPosition := currentYPosition + 1.
						currentXPosition := 0.
						true]] whileTrue
					
	]