Class {
	#name : #SimdBytecodeTest,
	#superclass : #TestCase,
	#category : #'Opal-Simd-Bytecode-Tests'
}

{ #category : #'as yet unclassified' }
SimdBytecodeTest >> testCannotOperateOnFloat32ArraySumUsing64BitVectorBytecode [
	| x y result z |

	x := Float32Array withAll: (1.0 to: 4.0).
	y := Float32Array withAll: (x collect: [:i | i * 10]).
	z := Float32Array new: x size.

	result := ArithmeticArrayOperations new addFloat64Vector: x with: y intoVector: z.

	self assertCollection: result equals: (Float64Array withAll: #(11.0 22.0 33.0 44.0)).
]

{ #category : #'as yet unclassified' }
SimdBytecodeTest >> testFloat32ArrayAcrossSumUsingVectorBytecode [
	| x result |

	x := Float32Array withAll: { 7. 9. 9. 2. 7. 3. 9. 8. 7. 1. 0. 0. 0. 0. 0. 0. }.

	result := ArithmeticArrayOperations new luhnVectorial: x.

	self assert: result equals: 5.0."TODO should be 3.0 once luhnVectorial implementation is complete"
]

{ #category : #'*SimdBytecode' }
SimdBytecodeTest >> testFloat32ArraySumUsingVectorBytecode [
	| x y result z |

	x := Float32Array withAll: #(1.0 2.0 3.0 4.0).
	y := Float32Array withAll: #(10.0 20.0 30.0 40.0).
	z := Float32Array new: 4.

	result := ArithmeticArrayOperations new addFloat32Vector: x with: y intoVector: z.

	self assertCollection: result equals: (Float32Array withAll: #(11.0 22.0 33.0 44.0)).
]

{ #category : #'*SimdBytecode' }
SimdBytecodeTest >> testFloat64ArraySumUsingVectorBytecode [
	| x y result z |

	x := Float64Array withAll: (1.0 to: 6.0).
	y := Float64Array withAll: (x collect: [:i | i * 10]).
	z := Float64Array new: x size.

	result := ArithmeticArrayOperations new addFloat64Vector: x with: y intoVector: z.

	self assertCollection: result equals: (Float64Array withAll: #(11.0 22.0 33.0 44.0 55.0 66.0)).
]
