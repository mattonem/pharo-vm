as yet unclassified
setExtraTargetProperties: maker
	super setExtraTargetProperties: maker.
	self addThirdpartyLibraries: #( 
			'libssh2' 
			'libgit2' ).