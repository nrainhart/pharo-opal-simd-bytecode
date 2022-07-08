Extension { #name : #SimdBytecodeTest }

{ #category : #'*SimdBytecode' }
SimdBytecodeTest >> addFloat32Vector: arg1 with: arg2 intoVector: result [

	<opalBytecodeMethod>
	"Note: only handles arrays with a number of elements that is a multiple of 4"
	^ IRBuilder buildIR: [ :builder |
		builder
				numArgs: 3; 		
				addTemps: { #firstVector. #secondVector. #thirdVector. #i. #end };

				pushLiteral: 0;
				storeTemp: #i;
				popTop;

				pushTemp: #firstVector;
				send: #size;
				storeTemp: #end;
				popTop;
				jumpBackTarget: #loop;

				pushTemp: #end;
				pushTemp: #i;
				send: #=;
				jumpAheadTo: #exit if: true;

					pushTemp: #i;
					pushTemp: #firstVector;
					pushFloat32ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat32ArrayToRegister;

					addFloat32Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat32RegisterIntoArray;
					popTop;

				pushTemp: #i;
				pushLiteral: 4;
				send: #+;
				storeTemp: #i;
				popTop;

				jumpBackTo: #loop;
				jumpAheadTarget: #exit;
				pushTemp: #thirdVector;
				returnTop
		 ].
]

{ #category : #'*SimdBytecode' }
SimdBytecodeTest >> addFloat64Vector: arg1 with: arg2 intoVector: result [

	<opalBytecodeMethod>
	"Note: only handles arrays with a number of elements that is a multiple of 2"
	^ IRBuilder buildIR: [ :builder |
		builder
				numArgs: 3; 		
				addTemps: { #firstVector. #secondVector. #thirdVector. #i. #end };

				pushLiteral: 0;
				storeTemp: #i;
				popTop;

				pushTemp: #firstVector;
				send: #size;
				storeTemp: #end;
				popTop;
				jumpBackTarget: #loop;

				pushTemp: #end;
				pushTemp: #i;
				send: #=;
				jumpAheadTo: #exit if: true;

					pushTemp: #i;
					pushTemp: #firstVector;
					pushFloat64ArrayToRegister;

					pushTemp: #i;
					pushTemp: #secondVector;
					pushFloat64ArrayToRegister;

					addFloat64Vector;

					pushTemp: #i;
					pushTemp: #thirdVector;
					storeFloat64RegisterIntoArray;
					popTop;

				pushTemp: #i;
				pushLiteral: 2;
				send: #+;
				storeTemp: #i;
				popTop;

				jumpBackTo: #loop;
				jumpAheadTarget: #exit;
				pushTemp: #thirdVector;
				returnTop
		 ].
]

{ #category : #'*SimdBytecode' }
SimdBytecodeTest >> testFloat32ArraySumUsingVectorBytecode [
	| x y result z |

	x := Float32Array withAll: #(1.0 2.0 3.0 4.0).
	y := Float32Array withAll: #(10.0 20.0 30.0 40.0).
	z := Float32Array new: 4.

	result := self addFloat32Vector: x with: y intoVector: z.

	self assertCollection: result equals: (Float32Array withAll: #(11.0 22.0 33.0 44.0)).
]

{ #category : #'*SimdBytecode' }
SimdBytecodeTest >> testFloat64ArraySumUsingVectorBytecode [
	| x y result z |

	x := Float64Array withAll: (1.0 to: 6.0).
	y := Float64Array withAll: (x collect: [:i | i * 10]).
	z := Float64Array new: x size.

	result := self addFloat64Vector: x with: y intoVector: z.

	self assertCollection: result equals: (Float64Array withAll: #(11.0 22.0 33.0 44.0 55.0 66.0)).
]
