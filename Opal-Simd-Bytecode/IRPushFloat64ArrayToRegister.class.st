Class {
	#name : #IRPushFloat64ArrayToRegister,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRPushFloat64ArrayToRegister >> accept: aVisitor [
	
	^ aVisitor visitPushFloat64ArrayToRegister: self
]
