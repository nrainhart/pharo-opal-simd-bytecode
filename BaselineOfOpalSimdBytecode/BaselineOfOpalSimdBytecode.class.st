Class {
	#name : #BaselineOfOpalSimdBytecode,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpalSimdBytecode
}

{ #category : #baselines }
BaselineOfOpalSimdBytecode >> baseline: spec [

	     <baseline>
	     spec for: #common do: [ 
		     spec
			     package: 'Opal-Simd-Bytecode';
			     package: 'Opal-Simd-Bytecode-Tests'
			     with: [ spec requires: #( 'Opal-Simd-Bytecode' ) ] ]
]
