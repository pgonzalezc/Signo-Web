Class {
	#name : 'SgRFPruebas',
	#superclass : 'WARestfulHandler',
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'initialization' }
SgRFPruebas class >> initialize [

	WAAdmin register: self at: '/pruebas/resources'
]

{ #category : 'as yet unclassified' }
SgRFPruebas >> ping [

	<get>
	<path: 'seaside'>
	<produces: 'plain/text'>
	self requestContext respond: [ :response |
		response
			nextPutAll: 'ping SeaSide' ]
]
