debug printing
shortPrintFrameAndCallers: theFP
	<inline: false>
	<var: #theFP type: #'char *'>
	(stackPages couldBeFramePointer: theFP) ifFalse: [^nil].
	self shortPrintFrame: theFP.
	self shortPrintFrameAndCallers: (self frameCallerFP: theFP)