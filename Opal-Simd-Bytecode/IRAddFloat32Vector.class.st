Class {
	#name : #IRAddFloat32Vector,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRAddFloat32Vector >> accept: aVisitor [
	
	^ aVisitor visitAddFloat32Vector: self
]
