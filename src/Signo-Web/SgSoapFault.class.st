Class {
	#name : #SgSoapFault,
	#superclass : #Object,
	#instVars : [
		'code',
		'string',
		'actor',
		'detail',
		'qname'
	],
	#category : #'Signo-Web-Utils'
}

{ #category : #'as yet unclassified' }
SgSoapFault class >> code: aCode string: aString [

	^ (self basicNew)
		code: aCode;
		string: aString
]

{ #category : #'as yet unclassified' }
SgSoapFault class >> defaultNamespaceV1_1 [

	^ 'http://www.w3.org/2003/05/soap-envelope'
]

{ #category : #'as yet unclassified' }
SgSoapFault class >> defaultPrefixV1_1 [

	^ 'SOAP_ENV'
]

{ #category : #'as yet unclassified' }
SgSoapFault class >> defaultQname [

	^ SgQName prefix: self defaultPrefixV1_1 uri: self defaultNamespaceV1_1 
]

{ #category : #'as yet unclassified' }
SgSoapFault class >> soapFaultVersionMismatch [

	^ 'VersionMismatch'
]

{ #category : #converting }
SgSoapFault >> asXml [

	| writer |
	writer := XMLWriter new.
	writer tag: self qName prefix,':Fault' with: [ 
		writer tag: self qName prefix,':code' with: code.
		writer tag: self qName prefix,':string' with: string
		 ].
	
	^ writer asString
]

{ #category : #initialization }
SgSoapFault >> code: aCode [

	code := aCode
]

{ #category : #'as yet unclassified' }
SgSoapFault >> qName [

	^ qname ifNil: [ qname := self class defaultQname  ]
]

{ #category : #'as yet unclassified' }
SgSoapFault >> qName: aQName [

	qname := aQName
]

{ #category : #initialization }
SgSoapFault >> string: aString [

	string := aString
]
