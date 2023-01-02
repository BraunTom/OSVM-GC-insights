as yet unclassified
drawOn: aCanvas

	| width origin currentXPosition currentYPosition yStep colorArray |
	width := self width.
	origin := self position.
	currentXPosition := 0.
	currentYPosition := 0.
	yStep := 2.
	colorArray := {Color red . Color blue}.
	

	aCanvas fillRectangle: self bounds color: Color white.
	
	segmentData do: [:ea | | objectsWidth |
		objectsWidth := ea bitAnd: 16rFFFFFFFFFFFFFF.
		
		[(currentXPosition + objectsWidth) < width
			ifTrue: [aCanvas 
						fillRectangle: (origin + (currentXPosition @ currentYPosition )
										corner: origin + (currentXPosition + objectsWidth @ (currentYPosition + (yStep))))
						color: (colorArray at: (ea >> 56) + 1).
						
						currentXPosition := currentXPosition + objectsWidth.
						
						"we drew everything we had to. Do not continue"
						false]
			ifFalse:[aCanvas 
						fillRectangle: (origin + (currentXPosition @ currentYPosition  )
										corner: origin + (width @ (currentYPosition + (yStep))))
						color: (colorArray at: (ea >> 56) + 1).
						
						objectsWidth := (currentXPosition + objectsWidth) - width.
						currentYPosition := currentYPosition + yStep.
						currentXPosition := 0.
						
						currentYPosition > self height
							ifTrue: [^ self].
						
						"there ist still work left. continue onwards"
						true]] whileTrue.
				
				
					
	]