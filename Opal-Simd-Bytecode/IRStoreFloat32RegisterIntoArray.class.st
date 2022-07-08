Class {
	#name : #IRStoreFloat32RegisterIntoArray,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRStoreFloat32RegisterIntoArray >> accept: aVisitor [
	
	^ aVisitor visitStoreFloat32RegisterIntoArray: self
]
