Class {
	#name : 'SgMInfoContacto',
	#superclass : 'SgMBase',
	#instVars : [
		'telefono',
		'personaContacto'
	],
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'accessing' }
SgMInfoContacto >> personaContacto [

	^ personaContacto
]

{ #category : 'accessing' }
SgMInfoContacto >> personaContacto: anObject [

	personaContacto := anObject
]

{ #category : 'accessing' }
SgMInfoContacto >> telefono [

	^ telefono
]

{ #category : 'accessing' }
SgMInfoContacto >> telefono: anObject [

	telefono := anObject
]
