Class {
	#name : #IRAddFloat64Vector,
	#superclass : #IRInstruction,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #visiting }
IRAddFloat64Vector >> accept: aVisitor [
	
	^ aVisitor visitAddFloat64Vector: self
]
