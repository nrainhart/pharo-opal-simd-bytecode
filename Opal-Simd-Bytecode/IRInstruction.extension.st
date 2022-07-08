Extension { #name : #IRInstruction }

{ #category : #'*Opal-Simd-Bytecode' }
IRInstruction class >> addFloat32Vector [
	
	^ IRAddFloat32Vector new
]

{ #category : #'*Opal-Simd-Bytecode' }
IRInstruction class >> addFloat64Vector [ 
	
	^ IRAddFloat64Vector new
]

{ #category : #'*Opal-Simd-Bytecode' }
IRInstruction class >> pushFloat32ArrayToRegister [
	
	^ IRPushFloat32ArrayToRegister new
]

{ #category : #'*Opal-Simd-Bytecode' }
IRInstruction class >> pushFloat64ArrayToRegister [
	
	^ IRPushFloat64ArrayToRegister new
]

{ #category : #'*Opal-Simd-Bytecode' }
IRInstruction class >> storeFloat32RegisterIntoArray [
	
	^ IRStoreFloat32RegisterIntoArray new
]

{ #category : #'*Opal-Simd-Bytecode' }
IRInstruction class >> storeFloat64RegisterIntoArray [
	
	^ IRStoreFloat64RegisterIntoArray new
]
