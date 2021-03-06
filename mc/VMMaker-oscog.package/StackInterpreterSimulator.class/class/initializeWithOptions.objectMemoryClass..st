class initialization
initializeWithOptions: optionsDictionaryOrArray objectMemoryClass: objectMemoryClassOrNil
	"The relevant ObjectMemory and Interpreter classes must be initialized in order.
	 This happens notionally every time we start the simulator,
	 but in fact happens when ever we instantiate a simulator."
	| optionsDictionary |
	optionsDictionary := optionsDictionaryOrArray isArray
							ifTrue: [Dictionary newFromPairs: optionsDictionaryOrArray]
							ifFalse: [optionsDictionaryOrArray].
	(objectMemoryClassOrNil ifNil: [self objectMemoryClass])
		initializeWithOptions: optionsDictionary.

	StackInterpreter initializeWithOptions: optionsDictionary