Class {
	#name : #IRPushFloat32RegisterElement,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRPushFloat32RegisterElement >> accept: aVisitor [
	
	^ aVisitor visitPushFloat32RegisterElement: self
]
