simulation support
doOrDefer: aBlock
	<doNotGenerate>
	"Either evaluate aBlock immediately if in the uiProcess or defer aBlock as a UI message"
	Processor activeProcess == UIManager default uiProcess
		ifTrue: [aBlock value]
		ifFalse: [WorldState addDeferredUIMessage: aBlock]