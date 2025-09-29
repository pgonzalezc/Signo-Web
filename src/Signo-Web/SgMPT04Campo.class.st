Class {
	#name : 'SgMPT04Campo',
	#superclass : 'Object',
	#instVars : [
		'id',
		'modelo',
		'ejercicio',
		'idAp',
		'nombre',
		'nroreg',
		'posini',
		'longitud',
		'tipo'
	],
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'instance creation' }
SgMPT04Campo class >> from: aTuple [

	^ self new
		  id: (aTuple at: 1);
		  modelo: (aTuple at: 2);
		  ejercicio: (aTuple at: 3);
		  idAp: (aTuple at: 4);
		  nombre: (aTuple at: 5) trim;
		  nroreg: (aTuple at: 6);
		  posini: (aTuple at: 7);
		  longitud: (aTuple at: 8);
		  tipo: (aTuple at: 9) trim
]

{ #category : 'converting' }
SgMPT04Campo >> asArray [

	^ { id . modelo . ejercicio . idAp . nombre . nroreg . posini . longitud . tipo }
]

{ #category : 'accessing' }
SgMPT04Campo >> ejercicio [

	^ ejercicio
]

{ #category : 'accessing' }
SgMPT04Campo >> ejercicio: anObject [

	ejercicio := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> id [

	^ id
]

{ #category : 'accessing' }
SgMPT04Campo >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> idAp [

	^ idAp
]

{ #category : 'accessing' }
SgMPT04Campo >> idAp: anObject [

	idAp := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> key [

	^ modelo asString , ejercicio asString
]

{ #category : 'accessing' }
SgMPT04Campo >> longitud [

	^ longitud
]

{ #category : 'accessing' }
SgMPT04Campo >> longitud: anObject [

	longitud := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> modelo [

	^ modelo
]

{ #category : 'accessing' }
SgMPT04Campo >> modelo: anObject [

	modelo := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> nombre [

	^ nombre
]

{ #category : 'accessing' }
SgMPT04Campo >> nombre: anObject [

	nombre := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> nroreg [

	^ nroreg
]

{ #category : 'accessing' }
SgMPT04Campo >> nroreg: anObject [

	nroreg := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> posini [

	^ posini
]

{ #category : 'accessing' }
SgMPT04Campo >> posini: anObject [

	posini := anObject
]

{ #category : 'accessing' }
SgMPT04Campo >> tipo [

	^ tipo
]

{ #category : 'accessing' }
SgMPT04Campo >> tipo: anObject [

	tipo := anObject
]
