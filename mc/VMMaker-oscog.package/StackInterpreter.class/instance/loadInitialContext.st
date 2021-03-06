initialization
loadInitialContext
	<inline: false>
	| activeProc activeContext |
	self cCode: [] inSmalltalk: [self initExtensions].
	objectMemory leakCheckFullGC ifTrue:
		[objectMemory clearLeakMapAndMapAccessibleObjects.
		 self assert: objectMemory checkHeapIntegrity].
	activeProc := self activeProcess.
	activeContext := objectMemory fetchPointer: SuspendedContextIndex ofObject: activeProc.
	self marryContextInNewStackPageAndInitializeInterpreterRegisters: activeContext