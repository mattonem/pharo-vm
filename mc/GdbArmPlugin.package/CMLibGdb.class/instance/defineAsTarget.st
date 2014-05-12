as yet unclassified
defineAsTarget
	gen puts:
	'add_custom_target(', self buildTarget , ' 
		DEPENDS 		
		"${libSim}"
	)'.
	