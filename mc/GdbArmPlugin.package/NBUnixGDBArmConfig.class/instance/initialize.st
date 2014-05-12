as yet unclassified
initialize 
	Cogit allSubclassesDo: [ :each | each initializeWithOptions: (VMMaker new instVarNamed: 'optionsDictionary') ]