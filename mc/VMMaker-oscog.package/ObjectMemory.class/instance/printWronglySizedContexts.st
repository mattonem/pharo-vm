debug printing
printWronglySizedContexts
	"Scan the heap printing the oops of any and all contexts whose size is not either SmallContextSize or LargeContextSize"
	| oop |
	<api>
	oop := self firstAccessibleObject.
	[oop = nil] whileFalse:
		[((self isContextNonInt: oop)
		   and: [self badContextSize: oop]) ifTrue:
			[self printHex: oop; space; printNum: (self byteLengthOf: oop); cr].
		 oop := self accessibleObjectAfter: oop]