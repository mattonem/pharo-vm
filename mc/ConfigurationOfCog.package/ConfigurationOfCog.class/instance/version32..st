versions
version32: spec
	<version: '3.2' imports: #('1.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec author: 'IgorStasenko'.
		spec timestamp:  '9/5/2011 16:05'.
		
		spec
			package: 'FFI-Pools' with: 'FFI-Pools-eem.3';
			package: 'SharedPool-Speech' with: 'SharedPool-Speech-dtl.2';
			package: 'Balloon-Engine-Pools' with: 'Balloon-Engine-Pools-JB.2';
			package: 'Alien-Core' with: 'Alien-Core-IgorStasenko.68';
			package: 'Sound' with: 'Sound-StephaneDucasse.62';
			package: 'VMConstruction-Plugins-OSProcessPlugin' 
				with: 'VMConstruction-Plugins-OSProcessPlugin.oscog-eem.31';
			package: 'Freetype-Plugin' with: 'Freetype-Plugin-IgorStasenko.61';
			package: 'ObjectiveC-Plugin' with: 'ObjectiveC-Plugin-John M McIntosh.20';
			package: 'Cog' with: 'Cog-eem.45';
			package: 'VMMaker-oscog' with: 'VMMaker-oscog-IgorStasenko.123';
			package: 'Qwaq-VMProfiling-Plugins' with: 'Qwaq-VMProfiling-Plugins-JB.5';
			package: 'Applescript-Core' with: 'Applescript-Core-SeanDeNigris.2';		
			package: 'CMakeVMMaker' with: 'CMakeVMMaker-IgorStasenko.136' ].