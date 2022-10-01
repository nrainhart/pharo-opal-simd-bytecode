Extension { #name : #IRTranslator }

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitAddAcrossFloat32Vector: anAddVector [

	^ gen addAcrossFloat32Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitAddFloat32Vector: anAddVector [

	^ gen addFloat32Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitAddFloat64Vector: anAddVector [

	^ gen addFloat64Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitMulFloat32Vector: anAddVector [

	^ gen mulFloat32Vector
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitPushFloat32ArrayToRegister: pushArrayToRegister [
	^ gen pushFloat32ArrayToRegister
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitPushFloat32RegisterElement: pushRegisterElement [
	^ gen pushFloat32RegisterElement 
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitPushFloat64ArrayToRegister: pushArrayToRegister [
	^ gen pushFloat64ArrayToRegister
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitStoreFloat32RegisterIntoArray: storeRegisterIntoArray [
	^ gen storeFloat32RegisterIntoArray
]

{ #category : #'*Opal-Simd-Bytecode' }
IRTranslator >> visitStoreFloat64RegisterIntoArray: storeRegisterIntoArray [
	^ gen storeFloat64RegisterIntoArray
]
