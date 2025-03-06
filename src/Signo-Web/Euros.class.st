Class {
	#name : #Euros,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'Signo-Web-Models'
}

{ #category : #'instance creation' }
Euros class >> new: aNumber [

	^ (self new) value: aNumber
]

{ #category : #arithmetic }
Euros >> + aNumber [

	| operand |
	operand := (aNumber isKindOf: Number)
		           ifTrue: [ self class new: aNumber ]
		           ifFalse: [ aNumber ].
	(aNumber isKindOf: self class) ifFalse: [
		Error signal: 'Invalid parameter' ].

	^ self class new: (self value + operand value)
]

{ #category : #accessing }
Euros >> value [

	^ value
]

{ #category : #accessing }
Euros >> value: aNumber [

	value := aNumber asScaledDecimal: 2
]
