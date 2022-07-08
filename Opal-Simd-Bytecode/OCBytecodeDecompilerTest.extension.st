Extension { #name : #OCBytecodeDecompilerTest }

{ #category : #'*Opal-Simd-Bytecode' }
OCBytecodeDecompilerTest >> testAddVector [
	| ir1 ir2 method |
	ir1 := IRBuilderTest new testAddVector.
	method := ir1 compiledMethod.
	ir2 := IRBytecodeDecompiler new decompile: method.
	self deny: ir2 compiledMethod identicalTo: method.
	self assert: ir2 compiledMethod symbolic equals: method symbolic
]
