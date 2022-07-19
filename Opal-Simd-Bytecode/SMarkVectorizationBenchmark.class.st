Class {
	#name : #SMarkVectorizationBenchmark,
	#superclass : #SMarkSuite,
	#instVars : [
		'arraySize'
	],
	#category : #'Opal-Simd-Bytecode'
}

{ #category : #benchmarking }
SMarkVectorizationBenchmark class >> benchmarkParameters [

	^ ParametrizedTestMatrix new
		  forSelector: #arraySize addOptions: #( 2 8 32 128 512 2048 "2KiB" 8192 "8KiB" 32768 "32KiB" 131072 "128KiB" 524288 "512KiB" 2097152 "2MiB" );
		"TODO: puchito escalar"
		  yourself
]

{ #category : #benchmarking }
SMarkVectorizationBenchmark class >> defaultProblemSize [
	^ 4194304 "2^22"
]

{ #category : #'as yet unclassified' }
SMarkVectorizationBenchmark class >> runBenchmark [

	<script>
	| run results csvStream csvLines |
	
	run := SMarkVectorizationBenchmark run: 100.
	results := run results.

	csvStream := 'vectorBenchmarkResults.csv' asFileReference writeStream.
	csvLines := results associations collect: [ :result |
		{ result key. (result value collect: [ :i | i total ]) } flattened].
	(NeoCSVWriter on: csvStream) nextPutAll: csvLines.
	csvStream close.
]

{ #category : #benchmarking }
SMarkVectorizationBenchmark >> benchAddFloat32Scalar [
	| a limit x y z |
	x := Float32Array withAll: (1.0 to: arraySize).
	y := Float32Array withAll: (x collect: [:i | i * 10]).
	z := Float32Array new: x size.
	
	a := 1.
	limit := self problemSize.
	a to: limit do: [ :_ |
		ArithmeticArrayOperations new addVectorScalar: x with: y intoVector: z.
	].
]

{ #category : #benchmarking }
SMarkVectorizationBenchmark >> benchAddFloat32Vector [

	| a limit x y z |
	arraySize % 4 = 0 ifFalse: [ ^ nil ].

	x := Float32Array withAll: (1.0 to: arraySize).
	y := Float32Array withAll: (x collect: [ :i | i * 10 ]).
	z := Float32Array new: x size.

	a := 1.
	limit := self problemSize.
	a to: limit do: [ :_ | 
		ArithmeticArrayOperations new
			addFloat32Vector: x
			with: y
			intoVector: z ]
]

{ #category : #benchmarking }
SMarkVectorizationBenchmark >> benchAddFloat64Primitive [
	| a limit x y z |
	x := Float64Array withAll: (1.0 to: arraySize).
	y := Float64Array withAll: (x collect: [:i | i * 10]).
	z := Float64Array new: x size.
	
	a := 1.
	limit := self problemSize.
	a to: limit do: [ :_ |
		ArithmeticArrayOperations new addVectorPrimitive: x with: y intoVector: z.
	].
]

{ #category : #benchmarking }
SMarkVectorizationBenchmark >> benchAddFloat64Scalar [
	| a limit x y z |
	x := Float64Array withAll: (1.0 to: arraySize).
	y := Float64Array withAll: (x collect: [:i | i * 10]).
	z := Float64Array new: x size.
	
	a := 1.
	limit := self problemSize.
	a to: limit do: [ :_ |
		ArithmeticArrayOperations new addVectorScalar: x with: y intoVector: z.
	].
]

{ #category : #benchmarking }
SMarkVectorizationBenchmark >> benchAddFloat64Vector [
	| a limit x y z |
	x := Float64Array withAll: (1.0 to: arraySize).
	y := Float64Array withAll: (x collect: [:i | i * 10]).
	z := Float64Array new: x size.
	
	a := 1.
	limit := self problemSize.
	a to: limit do: [ :_ |
		ArithmeticArrayOperations new addFloat64Vector: x with: y intoVector: z.
	].
]

{ #category : #benchmarking }
SMarkVectorizationBenchmark >> problemSize [

	"Hint for the OMOP that it is part of the meta infrastructure"

	<omniUnenforced>
	| baseProblemSize problemSize |
	baseProblemSize := super problemSize.
	problemSize := baseProblemSize / arraySize.
	^ problemSize
]
