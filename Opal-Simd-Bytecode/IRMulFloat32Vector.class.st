Class {
	#name : #IRMulFloat32Vector,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRMulFloat32Vector >> accept: aVisitor [
	
	^ aVisitor visitMulFloat32Vector: self
]
