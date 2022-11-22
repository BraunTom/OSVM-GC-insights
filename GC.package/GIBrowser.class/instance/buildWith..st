toolbuilder
buildWith: aToolBuilder

	| window pane paneChildren edenPane oldSpacePane |
	
	paneChildren := OrderedCollection new.
	
	{#gcMode . #gcPhase}
		do: [:each | paneChildren add: (self createTextField: each with: aToolBuilder)].
		
	edenPane := aToolBuilder pluggablePanelSpec new
		model: self;
		layout: #vertical;
		children: #edenMorphVisualisation;
		yourself.
		
	paneChildren add: edenPane.
	
	oldSpacePane := aToolBuilder pluggablePanelSpec new
		model: self;
		layout: #vertical;
		children: #oldSpaceVisualisation;
		yourself.
		
	paneChildren add: oldSpacePane.
	
	pane := aToolBuilder pluggablePanelSpec new
		model: self;
		layout: #vertical;
		frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1));
		children: paneChildren;
		yourself.

	window := aToolBuilder pluggableWindowSpec new
		label: 'GC vis';
		model: self;
		children: {pane}
		yourself.
		
	
	^ aToolBuilder build: window