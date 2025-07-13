Class {
	#name : #SgSoapHandler,
	#superclass : #WARequestHandler,
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgSoapHandler class >> initialize [

	WAAdmin register: self at: '/soap/test'
]

{ #category : #handling }
SgSoapHandler >> handleFiltered: aRequest [
	
	aRequest respond: [ :response | | tree respHeader respBody |
		response contentType: WAMimeType textPlain.
		
		[ tree := (XMLDOMParser on: aRequest request rawBody) parseDocument ] 
			on: XMLWellFormednessException
			do: [ :ex | | responseMsg | 
				responseMsg := SgSoapMessage new body: (SgSoapFault code: 500 string: ex messageText) asString .
				^ response nextPutAll: responseMsg ].
		 
		respHeader := self processHeader: (tree xpath: '//SOAP_ENV:Header') first.
		respBody := self processBody: (tree xpath: '//SOAP_ENV:Body') first.
		response nextPutAll: respHeader.
		response nextPutAll: respBody
	]
]

{ #category : #'as yet unclassified' }
SgSoapHandler >> processBody: anXml [

	| data  |
	data := OrderedCollection new.
	(anXml allElementsNamed: 'presentador') first elementsDo: [ :e |
			data add: e name -> e contentString.
		 ].
	^ data  
]

{ #category : #'as yet unclassified' }
SgSoapHandler >> processHeader: anXml [

	anXml hasChildren not ifTrue: [ ^ '' ]
]
