toolbuilder
createTextField: aSymbol with: aBuilder

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: aSymbol;
		yourself
	