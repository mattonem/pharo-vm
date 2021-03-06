initialization
generateCaptureCStackPointers: captureFramePointer
	"Generate the routine that writes the current values of the C frame and stack pointers into
	 variables.  These are used to establish the C stack in trampolines back into the C run-time.

	 This is a presumptuous quick hack for x86.  It is presumptuous for two reasons.  Firstly
	 the system's frame and stack pointers may differ from those we use in generated code,
	 e.g. on register-rich RISCs.  Secondly the ABI may not support a simple frameless call
	 as written here (for example 128-bit stack alignment on Mac OS X)."
	| startAddress |
	<inline: false>
	self allocateOpcodes: 32 bytecodes: 0.
	initialPC := 0.
	endPC := numAbstractOpcodes - 1.
	startAddress := methodZoneBase.
	captureFramePointer ifTrue:
		[self MoveR: FPReg Aw: self cFramePointerAddress].
	"Capture the stack pointer prior to the call."
	backEnd leafCallStackPointerDelta = 0
		ifTrue: [self MoveR: SPReg Aw: self cStackPointerAddress]
		ifFalse: [self MoveR: SPReg R: TempReg.
				self AddCq: backEnd leafCallStackPointerDelta R: TempReg.
				self MoveR: TempReg Aw: self cStackPointerAddress].
	self RetN: 0.
	self outputInstructionsForGeneratedRuntimeAt: startAddress.
	self recordGeneratedRunTime: 'ceCaptureCStackPointers' address: startAddress.
	ceCaptureCStackPointers := self cCoerceSimple: startAddress to: #'void (*)(void)'