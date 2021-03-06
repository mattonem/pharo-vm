become api
followForwarded: objOop
	"Follow a forwarding pointer.  Alas we cannot prevent forwarders to forwarders
	 being created by lazy become.  Consider the following example by Igor Stasenko:
		array := { a. b. c }.
		- array at: 1 points to &a. array at: 2 points to &b. array at: 3 points to &c Ó
		a becomeForward: b
		- array at: 1 still points to &a. array at: 2 still points to &b. array at: 3 still points to &c
		b becomeForward: c.
		- array at: 1 still points to &a. array at: 2 still points to &b. array at: 3 still points to &c
		- when accessing array first one has to follow a forwarding chain:
		&a -> &b -> c"
	| referent |
	self assert: (self isForwarded: objOop).
	referent := self fetchPointer: 0 ofMaybeForwardedObject: objOop.
	[(self isOopForwarded: referent)] whileTrue:
		[referent := self fetchPointer: 0 ofMaybeForwardedObject: referent].
	^referent