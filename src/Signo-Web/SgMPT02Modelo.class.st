Class {
	#name : #SgMPT02Modelo,
	#superclass : #Object,
	#instVars : [
		'id',
		'modelo',
		'ejercicio',
		'idAp',
		'tipo',
		'procedimiento',
		'tramitep',
		'tramitec',
		'aplicacion',
		'umbral',
		'finiciopres',
		'grabarSes',
		'apControl'
	],
	#category : #'Signo-Web-Models'
}

{ #category : #'instance creation' }
SgMPT02Modelo class >> fromTuple: aTuple [

	^ self new
		  id: (aTuple at: 1);
		  modelo: (aTuple at: 2);
		  ejercicio: (aTuple at: 3) asInteger;
		  idAp: (aTuple at: 4);
		  tipo: (aTuple at: 5);
		  procedimiento: (aTuple at: 6);
		  tramitep: (aTuple at: 7);
		  tramitec: (aTuple at: 8);
		  aplicacion: (aTuple at: 9);
		  umbral: (aTuple at: 10) asInteger;
			finiciopres: (aTuple at: 11);
			grabarSes: (aTuple at: 12);
			apControl: (aTuple at: 13)
]

{ #category : #accessing }
SgMPT02Modelo >> apControl [

	^ apControl
]

{ #category : #accessing }
SgMPT02Modelo >> apControl: anObject [

	apControl := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> aplicacion [

	^ aplicacion
]

{ #category : #accessing }
SgMPT02Modelo >> aplicacion: anObject [

	aplicacion := anObject
]

{ #category : #converting }
SgMPT02Modelo >> asArray [

	^ {
			self id.
		  self modelo.
		  self ejercicio.
		  self idAp.
		  self tipo.
		  self procedimiento.
		  self tramitep.
		  self tramitec.
		  self aplicacion.
		  self umbral.
		  self finiciopres.
		  self grabarSes.
		  self apControl }
]

{ #category : #accessing }
SgMPT02Modelo >> ejercicio [

	^ ejercicio
]

{ #category : #accessing }
SgMPT02Modelo >> ejercicio: anObject [

	ejercicio := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> finiciopres [

	^ finiciopres
]

{ #category : #accessing }
SgMPT02Modelo >> finiciopres: anObject [

	finiciopres := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> grabarSes [

	^ grabarSes
]

{ #category : #accessing }
SgMPT02Modelo >> grabarSes: anObject [

	grabarSes := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> id [

	^ id
]

{ #category : #accessing }
SgMPT02Modelo >> id: anObject [

	id := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> idAp [

	^ idAp
]

{ #category : #accessing }
SgMPT02Modelo >> idAp: anObject [

	idAp := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> modelo [

	^ modelo
]

{ #category : #accessing }
SgMPT02Modelo >> modelo: anObject [

	modelo := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> procedimiento [

	^ procedimiento
]

{ #category : #accessing }
SgMPT02Modelo >> procedimiento: anObject [

	procedimiento := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> tipo [

	^ tipo
]

{ #category : #accessing }
SgMPT02Modelo >> tipo: anObject [

	tipo := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> tramitec [

	^ tramitec
]

{ #category : #accessing }
SgMPT02Modelo >> tramitec: anObject [

	tramitec := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> tramitep [

	^ tramitep
]

{ #category : #accessing }
SgMPT02Modelo >> tramitep: anObject [

	tramitep := anObject
]

{ #category : #accessing }
SgMPT02Modelo >> umbral [

	^ umbral
]

{ #category : #accessing }
SgMPT02Modelo >> umbral: anObject [

	umbral := anObject
]
