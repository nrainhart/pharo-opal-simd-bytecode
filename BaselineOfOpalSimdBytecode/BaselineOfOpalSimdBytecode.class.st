Class {
	#name : #BaselineOfOpalSimdBytecode,
	#superclass : #Object,
	#category : #BaselineOfOpalSimdBytecode
}

{ #category : #baselines }
BaselineOfOpalSimdBytecode >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'Opal-Simd-Bytecode' ]
]
