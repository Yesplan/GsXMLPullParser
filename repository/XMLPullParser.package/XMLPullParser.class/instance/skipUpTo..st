tokenizing
skipUpTo: delimiter 
	| nextChar |
	self unpeek.
	[self atEnd or: [(nextChar := self nextChar) == delimiter]] whileFalse: [].
	nextChar == delimiter 
		ifFalse: 
			[XPPStructureException signal: 'XML no delimiting ' , delimiter printString , ' found']