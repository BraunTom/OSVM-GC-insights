toolbuilder
buildWith: aToolBuilder

	| window visualizationPane segmentList |
	
	segmentList := aToolBuilder pluggableListSpec new
		model: self;
		list: #segmentList;
		getIndex: #listIndex;
		setIndex: #listIndex:;
		frame: (LayoutFrame fractions: (0.0 @ 0 corner: 0.1 @ 1));
		yourself.
	
	visualizationPane := aToolBuilder pluggablePanelSpec new
		model: self;
		layout: #vertical;
		children: #memoryVisualisation;
		frame: (LayoutFrame fractions: (0.1 @ 0 corner: 1 @ 1));
		yourself.
	
	window := aToolBuilder pluggableWindowSpec new
		label: 'Memory map';
		model: self;
		children: {segmentList . visualizationPane}
		yourself.
		
	^ aToolBuilder build: window