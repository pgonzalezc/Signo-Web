Class {
	#name : 'SgSoap',
	#superclass : 'Object',
	#instVars : [
		'qname'
	],
	#category : 'Signo-Web-Utils',
	#package : 'Signo-Web',
	#tag : 'Utils'
}

{ #category : 'as yet unclassified' }
SgSoap class >> defaultNamespaceV1_1 [

	^ 'http://www.w3.org/2003/05/soap-envelope'
]

{ #category : 'as yet unclassified' }
SgSoap class >> defaultPrefixV1_1 [

	^ 'SOAP_ENV'
]

{ #category : 'as yet unclassified' }
SgSoap class >> defaultQname [

	^ SgQName prefix: self defaultPrefixV1_1 uri: self defaultNamespaceV1_1 
]

{ #category : 'as yet unclassified' }
SgSoap class >> soapFaultVersionMismatch [

	^ 'VersionMismatch'
]

{ #category : 'tests - printing' }
SgSoap >> prefix [

	^ self qName prefix
]

{ #category : 'as yet unclassified' }
SgSoap >> qName [

	^ qname ifNil: [ qname := self class defaultQname  ]
]

{ #category : 'as yet unclassified' }
SgSoap >> qName: aQName [

	qname := aQName
]
