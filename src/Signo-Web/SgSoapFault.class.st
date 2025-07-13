Class {
	#name : #SgSoapFault,
	#superclass : #SgSoap,
	#instVars : [
		'code',
		'string',
		'actor',
		'detail'
	],
	#category : #'Signo-Web-Utils'
}

{ #category : #'as yet unclassified' }
SgSoapFault class >> code: aCode string: aString [

	^ (self basicNew)
		code: aCode;
		string: aString
]

{ #category : #converting }
SgSoapFault >> asString [

	| writer |
	writer := XMLWriter new.
	writer tag: self prefix,':Fault' with: [ 
		writer tag: self prefix,':code' with: code asString.
		writer tag: self prefix,':string' with: string
		 ].
	
	^ writer asString
]

{ #category : #initialization }
SgSoapFault >> code: aCode [

	code := aCode
]

{ #category : #initialization }
SgSoapFault >> string: aString [

	string := aString
]
