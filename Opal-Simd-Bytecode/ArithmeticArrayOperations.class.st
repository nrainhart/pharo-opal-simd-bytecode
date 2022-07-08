Class {
	#name : #ArithmeticArrayOperations,
	#superclass : #Object,
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #adding }
ArithmeticArrayOperations >> addFloat32Vector: arg1 with: arg2 intoVector: result [

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

{ #category : #adding }
ArithmeticArrayOperations >> addFloat64Vector: arg1 with: arg2 intoVector: result [

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

{ #category : #adding }
ArithmeticArrayOperations >> addVectorPrimitive: term1 with: term2 intoVector: result [

	<primitive: 574 error: ec>
	self primitiveFailed
"	^ 1 to: term1 size do: [ :i | 
	  result at: i put: (term1 at: i) + (term2 at: i) ]"
]

{ #category : #adding }
ArithmeticArrayOperations >> addVectorScalar: term1 with: term2 intoVector: result [

	^ 1 to: term1 size do: [ :i | 
	  result at: i put: (term1 at: i) + (term2 at: i) ]
]
