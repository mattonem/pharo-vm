as yet unclassified
build
	gen
		puts:
			'
add_custom_command(OUTPUT "${gdbDir}/Makefile"
	COMMAND ./configure CFLAGS="-m32" LDFLAGS="-m32" --enable-sim --target=arm-linux --disable-gdb
	WORKING_DIRECTORY "${gdbDir}"
	DEPENDS "${unpackTarget}"
	COMMENT "Configuring gdb library"
)
'.
	gen
		puts:
			'
add_custom_command(OUTPUT "${libSim}"
	COMMAND make
	WORKING_DIRECTORY "${gdbDir}"
	DEPENDS "${gdbDir}/Makefile"
	COMMENT "Building simulator gdb library"
)'.
