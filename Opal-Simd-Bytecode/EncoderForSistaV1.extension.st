Extension { #name : #EncoderForSistaV1 }

{ #category : #'*Opal-Simd-Bytecode' }
EncoderForSistaV1 >> genAddFloat32Vector [
	
	stream nextPut: 236; nextPut: 3.
]

{ #category : #'*Opal-Simd-Bytecode' }
EncoderForSistaV1 >> genAddFloat64Vector [
	
	stream nextPut: 236; nextPut: 0.
]

{ #category : #'*Opal-Simd-Bytecode' }
EncoderForSistaV1 >> genPushFloat32ArrayToRegister [
	
	stream nextPut: 236; nextPut: 4.
]

{ #category : #'*Opal-Simd-Bytecode' }
EncoderForSistaV1 >> genPushFloat64ArrayToRegister [
	
	stream nextPut: 236; nextPut: 1.
]

{ #category : #'*Opal-Simd-Bytecode' }
EncoderForSistaV1 >> genStoreFloat32RegisterIntoArray [
	
	stream nextPut: 236; nextPut: 5.
]

{ #category : #'*Opal-Simd-Bytecode' }
EncoderForSistaV1 >> genStoreFloat64RegisterIntoArray [
	
	stream nextPut: 236; nextPut: 2.
]
