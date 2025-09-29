Class {
	#name : 'SgTest01Model',
	#superclass : 'Object',
	#instVars : [
		'id',
		'clave',
		'valor'
	],
	#category : 'Signo-Web-DBs',
	#package : 'Signo-Web',
	#tag : 'DBs'
}

{ #category : 'instance creation' }
SgTest01Model class >> fromTuple: aTuple [

	"La tupla contiene 3 campos siendo estos id, clave y valor"
	^ self new
		setId: (aTuple at: 1);
		setClave: (aTuple at: 2);
		setValor: (aTuple at: 3)
]

{ #category : 'accessing' }
SgTest01Model >> clave [

	^ clave
]

{ #category : 'accessing' }
SgTest01Model >> id [

	^ id
]

{ #category : 'initialization' }
SgTest01Model >> setClave: aString [

	clave := aString
]

{ #category : 'as yet unclassified' }
SgTest01Model >> setId: anInteger [

	id := anInteger
]

{ #category : 'initialization' }
SgTest01Model >> setValor: aString [

	valor := aString
]

{ #category : 'accessing' }
SgTest01Model >> valor [

	^ valor
]
