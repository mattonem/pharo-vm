*GdbArmPlugin
configureGdbARMPlugin: maker
	"extra rules for GdbARMPlugin"

	| libGdb |
	libGdb := self addThirdpartyLibrary: CMLibGdb canonicalName.
	maker set:#gdbDir toString:'${thirdpartyDir}/',CMLibGdb canonicalName,'/',libGdb unpackedDirName.
	maker puts: 'set(linkFlags "${linkFlags} -Wl,-wrap,ARMul_OSHandleSWI")'.
	
	maker importStaticLibrary: 'libsim' location: '${gdbDir}/sim/arm/libsim.a'.
	maker importStaticLibrary: 'opcodes' location: '${gdbDir}/opcodes/libopcodes.a'.	"For some fucking reason, it should come last!! Else won't link properly"
	maker importStaticLibrary: 'bfd' location: '${gdbDir}/bfd/libbfd.a'.
	maker importStaticLibrary: 'iberty' location: '${gdbDir}/libiberty/libiberty.a'.
	
	maker includeDirectories: '${gdbDir} ${gdbDir}/sim/arm ${gdbDir}/include ${gdbDir}/bfd'.
	
	maker addDefinitions: '-DNEED_UI_LOOP_HOOK'.
	maker addDefinitions: '-Wl,-wrap,ARMul_OSHandleSWI'.
	
	maker addCrossSources: #('armulmem' 'sqGdbARMPlugin').
	maker addExternalLibrary: 'z'.
	
	maker addDependency: libGdb buildTarget .
