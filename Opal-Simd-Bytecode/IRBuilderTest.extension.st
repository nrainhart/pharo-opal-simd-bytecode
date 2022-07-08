Extension { #name : #IRBuilderTest }

{ #category : #'*Opal-Simd-Bytecode' }
IRBuilderTest >> testAddVector [

	| iRMethod aCompiledMethod |
	
	iRMethod := IRBuilder buildIR: [ :builder |
		builder
				numArgs: 2; 		
				addTemps: { #firstVector. #secondVector };
				pushTemp: #firstVector;
				pushTemp: #secondVector;
				addFloat64Vector;
				returnTop
		 ].

	aCompiledMethod := iRMethod compiledMethod.
	self assert: (aCompiledMethod isKindOf: CompiledMethod).
	^iRMethod
]
