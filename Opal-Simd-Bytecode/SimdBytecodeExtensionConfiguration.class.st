Class {
	#name : #SimdBytecodeExtensionConfiguration,
	#superclass : #BytecodeMappedInlinePrimitiveConfiguration,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #configuring }
SimdBytecodeExtensionConfiguration class >> configure: instructionClient [

	{ 
		#addFloat64Vector.
		#pushFloat64ArrayToRegister.
		#storeFloat64RegisterIntoArray.
		#addFloat32Vector.
		#pushFloat32ArrayToRegister.
		#storeFloat32RegisterIntoArray } withIndexDo: [ :handler :index | 
		| extensionBytecodeNumber |
		extensionBytecodeNumber := index - 1.
		instructionClient
			addMappedInlinePrimitiveHandler: handler
			at: extensionBytecodeNumber ]
]
