*GdbArmPlugin
importStaticLibrary: targetName location: importedLocation

	self puts: 'add_library(', targetName,' STATIC IMPORTED)'.
	self puts: 'set_property(TARGET ', targetName,' PROPERTY IMPORTED_LOCATION "', importedLocation ,'")'.

	self addExternalLibrary: targetName