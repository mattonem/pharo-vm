as yet unclassified
setVariables
	super setVariables.
	gen 
		set: #libSim to: self unpackedDirName ;
		set: #gdbDir toString: '${libSourcesDir}'.
		