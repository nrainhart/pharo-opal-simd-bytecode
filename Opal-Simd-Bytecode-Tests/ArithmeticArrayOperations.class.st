Class {
	#name : #ArithmeticArrayOperations,
	#superclass : #Object,
	#category : #'Opal-Simd-Bytecode-Tests'
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
ArithmeticArrayOperations >> addFloat32VectorPrimitive: term1 with: term2 intoVector: result [

	<primitive: 575 error: ec>
	self primitiveFailed
"	^ 1 to: term1 size do: [ :i | 
	  result at: i put: (term1 at: i) + (term2 at: i) ]"
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
ArithmeticArrayOperations >> addFloat64VectorPrimitive: term1 with: term2 intoVector: result [

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

{ #category : #adding }
ArithmeticArrayOperations >> luhnScalar: aNumberArray [

	| sum parity |
	sum := 0.
	parity := aNumberArray size - 2 % 2.
	1 to: aNumberArray size do: [ :index | 
		| multiplier multiplied |
		multiplier := index % 2 = parity
			              ifTrue: [ 2 ]
			              ifFalse: [ 1 ].
		multiplied := multiplier * (aNumberArray at: index).
		sum := sum + (self sumDigits: multiplied) ].
	^ 10 - (sum % 10)
]

{ #category : #adding }
ArithmeticArrayOperations >> luhnVectorial: arg1 [

	<opalBytecodeMethod>
	^ IRBuilder buildIR: [ :arg2 |
		  arg2
			  numArgs: 1;
			  addTemps: { #aNumberArray. #sum. #i. #end };
			  pushLiteral: 0;
			  storeTemp: #i;
			  popTop;
			  pushLiteral: Float32Array;
			  pushLiteral: #( 0 0 0 0 );
			  send: #withAll:;
			  storeTemp: #sum;
			  popTop;
			  pushTemp: #aNumberArray;
			  send: #size;
			  storeTemp: #end;
			  popTop;
			  jumpBackTarget: #loop;
			  pushTemp: #end;
			  pushTemp: #i;
			  send: #=;
			  jumpAheadTo: #exit if: true;
			  		pushTemp: #i;
			  		pushTemp: #aNumberArray;
			  		pushFloat32ArrayToRegister;
					
			  		pushLiteral: 0;
			  		pushLiteral: (Float32Array withAll: #( 1.0 2.0 1.0 2.0 ));
			  		pushFloat32ArrayToRegister;
					
			  		mulFloat32Vector;
					"TODO: add bytecodes needed to complete this (!!!)"
					"duplicateTopBytecode" "TODO will this work with vectors?"
					"pushLiteral: 9;"
					"dupFloat32Vector;"
					"cmpGtFloat32Vector;"
					"pushLiteral: 1;"
					"dupFloat32Vector;"
					"andFloat32Vector"
					"addFloat32Vector;"
					
			  		addAcrossFloat32Vector;
					pushLiteral: 0;
			  		pushTemp: #sum;
					pushFloat32ArrayToRegister;
					
					addFloat32Vector;
					
					pushLiteral: 0;
					pushTemp: #sum;
					storeFloat32RegisterIntoArray;
					
			  		popTop;
			  pushTemp: #i;
			  pushLiteral: 4;
			  send: #+;
			  storeTemp: #i;
			  popTop;
			  jumpBackTo: #loop;
			
			  jumpAheadTarget: #exit;
			  "10 - (sum % 10)"
			  pushLiteral: 10.0;
			  
			  pushLiteral: 0;
			  pushLiteral: 0;
			  pushTemp: #sum;
			  pushFloat32ArrayToRegister;
			  pushFloat32RegisterElement;
			  
			  pushLiteral: 10.0;
			  send: #%;
			  send: #-;
			  returnTop ]
]

{ #category : #adding }
ArithmeticArrayOperations >> luhnVectorial: arg1 withSum: sum andMultipliers: multipliers [

	<opalBytecodeMethod>
	^ IRBuilder buildIR: [ :arg2 | 
		  arg2
			  numArgs: 1;
			  addTemps: { #aNumberArray. #sum. #i. #end };
			  pushLiteral: 0;
			  storeTemp: #i;
			  popTop;
			  pushLiteral: sum;
			  storeTemp: #sum;
			  popTop;
			  pushTemp: #aNumberArray;
			  send: #size;
			  storeTemp: #end;
			  popTop;
			  jumpBackTarget: #loop;
			  pushTemp: #end;
			  pushTemp: #i;
			  send: #=;
			  jumpAheadTo: #exit if: true;
			  		pushTemp: #i;
			  		pushTemp: #aNumberArray;
			  		pushFloat32ArrayToRegister;
					
			  		pushLiteral: 0;
			  		pushLiteral: multipliers;
			  		pushFloat32ArrayToRegister;
					
			  		mulFloat32Vector;
					
			  		addAcrossFloat32Vector;
					pushLiteral: 0;
			  		pushTemp: #sum;
					pushFloat32ArrayToRegister;
					
					addFloat32Vector;
					
					pushLiteral: 0;
					pushTemp: #sum;
					storeFloat32RegisterIntoArray;
					
			  		popTop;
			  pushTemp: #i;
			  pushLiteral: 4;
			  send: #+;
			  storeTemp: #i;
			  popTop;
			  jumpBackTo: #loop;
			  jumpAheadTarget: #exit;
			  pushLiteral: 0;
			  pushTemp: #sum;
			  pushFloat32ArrayToRegister;
			  pushLiteral: 0;
			  pushFloat32RegisterElement;
			  returnTop ]
]

{ #category : #'as yet unclassified' }
ArithmeticArrayOperations >> sumDigits: aNumber [

	| number sum |
	number := aNumber.
	sum := 0.
	[number ~= 0] whileTrue: [ 
		sum := sum + (number % 10).
		number := number // 10 ].
	^ sum
]
