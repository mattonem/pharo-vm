memory access
byteAt: byteAddress put: byte
	| longWord shift lowBits bpwMinus1 longAddress |
	bpwMinus1 := BytesPerWord-1.
	lowBits := byteAddress bitAnd: bpwMinus1.
	longAddress := byteAddress - lowBits.
	longWord := self longAt: longAddress.
	shift := (bpwMinus1 - lowBits) * 8.
	longWord := longWord
				- (longWord bitAnd: (16rFF bitShift: shift))
				+ (byte bitShift: shift).
	self assert: longAddress < freeStart.
	self longAt: longAddress put: longWord.
	^byte