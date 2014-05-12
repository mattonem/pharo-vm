Author useAuthor: 'LoadVMMaker' during: [ 
	Gofer new
    	  url: 'http://ss3.gemstone.com/ss/FileTree';
      	package: 'ConfigurationOfFileTree';
      	load.
	(Smalltalk at: #ConfigurationOfFileTree) load.

	Gofer new
		squeaksource: 'MetacelloRepository';
		package: 'ConfigurationOfCog';
		load.	
	(Smalltalk at: #ConfigurationOfCog) loadGit.
	Gofer new
   		url:'http://www.smalltalkhub.com/mc/maxmattone/GdbARMPlugin/main';   			package: 'ConfigurationOfGdbArmPlugin';
    		load.
	(Smalltalk at: #ConfigurationOfGdbArmPlugin) loadBleedingEdge ].

(Smalltalk saveAs: 'generator') 
    ifFalse: [ Smalltalk snapshot: false andQuit: true ].
