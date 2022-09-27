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
				  baseline: 'SMark'
					with: [ spec repository: 'github://guillep/SMark' ];
			     package: 'Opal-Simd-Bytecode-Tests'
			     	with: [ spec requires: #( 'Opal-Simd-Bytecode' ) ];
			     package: 'Opal-Simd-Bytecode-Benchmarks'
			     	with: [ spec requires: #( 'Opal-Simd-Bytecode' 'SMark' ) ].
				spec group: 'default' with: #( 'Opal-Simd-Bytecode' 'Opal-Simd-Bytecode-Tests' ).
				spec group: 'dev' with: #( 'default' 'Opal-Simd-Bytecode-Benchmarks' ).
				 ]
]
