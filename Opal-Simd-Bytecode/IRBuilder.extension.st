Extension { #name : #IRBuilder }

{ #category : #'*Opal-Simd-Bytecode' }
IRBuilder >> addFloat32Vector [

	self add: (IRInstruction addFloat32Vector)
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBuilder >> addFloat64Vector [

	self add: (IRInstruction addFloat64Vector)
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBuilder >> pushFloat32ArrayToRegister [

	self add: (IRInstruction pushFloat32ArrayToRegister)
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBuilder >> pushFloat64ArrayToRegister [

	self add: (IRInstruction pushFloat64ArrayToRegister)
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBuilder >> storeFloat32RegisterIntoArray [

	self add: (IRInstruction storeFloat32RegisterIntoArray)
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBuilder >> storeFloat64RegisterIntoArray [

	self add: (IRInstruction storeFloat64RegisterIntoArray)
]
