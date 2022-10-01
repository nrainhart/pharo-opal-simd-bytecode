Extension { #name : #IRPrinter }

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitAddAcrossFloat32Vector: addVector [
	  
	stream nextPutAll: 'addAcrossFloat32Vector'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitAddFloat32Vector: addVector [
	  
	stream nextPutAll: 'addFloat32Vector'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitAddFloat64Vector: addVector [
	  
	stream nextPutAll: 'addFloat64Vector'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitMulFloat32Vector: addVector [
	  
	stream nextPutAll: 'mulFloat32Vector'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitPushFloat32ArrayToRegister: pushArrayToRegister [
	  
	stream nextPutAll: 'pushFloat32ArrayToRegister'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitPushFloat32RegisterElement: pushRegisterElement [
	  
	stream nextPutAll: 'pushFloat32ArrayToRegister'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitPushFloat64ArrayToRegister: pushArrayToRegister [
	  
	stream nextPutAll: 'pushFloat64ArrayToRegister'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitStoreFloat32RegisterIntoArray: storeRegisterIntoArray [
	  
	stream nextPutAll: 'storeFloat32RegisterIntoArray'
]

{ #category : #'*Opal-Simd-Bytecode' }
IRPrinter >> visitStoreFloat64RegisterIntoArray: storeRegisterIntoArray [
	  
	stream nextPutAll: 'storeFloat64RegisterIntoArray'
]
