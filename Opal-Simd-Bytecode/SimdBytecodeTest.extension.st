Extension { #name : #SimdBytecodeTest }

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
