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

	aRequest respond: [ :response | |payload tree|
		response contentType: WAMimeType textPlain.
		
		payload := aRequest request postFields at: 'payload'.
		response nextPutAll: payload; nextPut: Character cr; nextPut: Character cr.
		
		tree := (XMLDOMParser on: payload) parseDocument.
		
		response nextPutAll: (tree xpath: '//soap:Header') first; nextPut: Character cr; nextPut: Character cr.
		response nextPutAll: (tree xpath: '//soap:Body') first
	]
]
