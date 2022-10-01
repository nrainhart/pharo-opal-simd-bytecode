Class {
	#name : #IRAddAcrossFloat32Vector,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRAddAcrossFloat32Vector >> accept: aVisitor [
	
	^ aVisitor visitAddAcrossFloat32Vector: self
]
