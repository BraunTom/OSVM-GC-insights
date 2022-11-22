toolbuilder
createTextField: aSymbol with: aBuilder

	^ aBuilder pluggableTextSpec new
		model: self;
		readOnly: true;
		getText: aSymbol;
		yourself
	