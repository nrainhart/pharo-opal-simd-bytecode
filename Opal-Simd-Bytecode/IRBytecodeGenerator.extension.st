Extension { #name : #IRBytecodeGenerator }

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> addAcrossFloat32Vector [

	stack pop: 1.
	stack push.
	
	^ encoder genAddAcrossFloat32Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> addFloat32Vector [

	stack pop: 2.
	stack push.
	
	^ encoder genAddFloat32Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> addFloat64Vector [

	stack pop: 2.
	stack push.
	
	^ encoder genAddFloat64Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> mulFloat32Vector [

	stack pop: 2.
	stack push.
	
	^ encoder genMulFloat32Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> pushFloat32ArrayToRegister [

	stack pop: 2.
	stack push.
	
	^ encoder genPushFloat32ArrayToRegister
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> pushFloat32RegisterElement [

	stack pop: 2.
	stack push.
	
	^ encoder genPushFloat32RegisterElement
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> pushFloat64ArrayToRegister [

	stack pop: 2.
	stack push.
	
	^ encoder genPushFloat64ArrayToRegister
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> storeFloat32RegisterIntoArray [

	stack pop: 3.
	stack push.
	
	^ encoder genStoreFloat32RegisterIntoArray
]

{ #category : #'*Opal-Simd-Bytecode' }
IRBytecodeGenerator >> storeFloat64RegisterIntoArray [

	stack pop: 3.
	stack push.
	
	^ encoder genStoreFloat64RegisterIntoArray
]
