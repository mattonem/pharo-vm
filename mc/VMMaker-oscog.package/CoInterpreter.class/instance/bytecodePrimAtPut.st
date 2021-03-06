common selector sends
bytecodePrimAtPut
	"BytecodePrimAtPut will only succeed if the receiver is in the atCache.
	Otherwise it will fail so that the more general primitiveAtPut will put it in the
	cache after validating that message lookup results in a primitive response.
	 Override to insert in the atCache here.  This is necessary since once there
	 is a compiled at:[put:] primitive method (which doesn't use the at: cache) the
	 only way something can get installed in the atCache is here."
	| index rcvr atIx value |
	value := self internalStackTop.
	index := self internalStackValue: 1.
	rcvr := self internalStackValue: 2.
	((objectMemory isIntegerObject: rcvr) not
	 and: [objectMemory isIntegerObject: index]) ifTrue:
		[atIx := (rcvr bitAnd: AtCacheMask) + AtPutBase.  "Index into atPutCache"
		 (atCache at: atIx+AtCacheOop) ~= rcvr ifTrue:
			[lkupClass := objectMemory fetchClassOfNonInt: rcvr.
			 messageSelector := self specialSelector: 17.
			 (self lookupInMethodCacheSel: messageSelector class: lkupClass) ifFalse:
				[argumentCount := 2.
				 ^self commonSend].
			 primitiveFunctionPointer == #primitiveAtPut
				ifTrue: [self install: rcvr inAtCache: atCache at: atIx string: false]
				ifFalse:
					[primitiveFunctionPointer == #primitiveStringAtPut
						ifTrue: [self install: rcvr inAtCache: atCache at: atIx string: true]
						ifFalse:
							[argumentCount := 2.
							 ^self commonSend]]].
		 self successful ifTrue:
			[self commonVariable: rcvr at: (objectMemory integerValueOf: index) put: value cacheIndex: atIx].
		 self successful ifTrue:
			[self fetchNextBytecode.
			 ^self internalPop: 3 thenPush: value].
		 self initPrimCall].

	messageSelector := self specialSelector: 17.
	argumentCount := 2.
	self normalSend