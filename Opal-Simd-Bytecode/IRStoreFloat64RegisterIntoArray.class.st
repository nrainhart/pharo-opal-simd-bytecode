Class {
	#name : #IRStoreFloat64RegisterIntoArray,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRStoreFloat64RegisterIntoArray >> accept: aVisitor [
	
	^ aVisitor visitStoreFloat64RegisterIntoArray: self
]
