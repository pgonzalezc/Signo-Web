Class {
	#name : #SgFincaUrbana,
	#superclass : #Object,
	#instVars : [
		'refCatastral',
		'area',
		'nombre',
		'naturaleza'
	],
	#category : #'Signo-Web-Models'
}

{ #category : #accessing }
SgFincaUrbana >> area [

	^ area
]

{ #category : #accessing }
SgFincaUrbana >> area: anObject [

	area := anObject
]

{ #category : #accessing }
SgFincaUrbana >> naturaleza [

	^ naturaleza
]

{ #category : #accessing }
SgFincaUrbana >> naturaleza: aString [

	naturaleza := aString
]

{ #category : #accessing }
SgFincaUrbana >> nombre [

	^ nombre
]

{ #category : #accessing }
SgFincaUrbana >> nombre: anObject [

	nombre := anObject
]

{ #category : #printing }
SgFincaUrbana >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' refCatastral: ';
		print: refCatastral.
	aStream
		nextPutAll: ' area: ';
		print: area.
	aStream
		nextPutAll: ' naturaleza: ';
		print: naturaleza.
	aStream
		nextPutAll: ' nombre: ';
		print: nombre
]

{ #category : #accessing }
SgFincaUrbana >> refCatastral [

	^ refCatastral
]

{ #category : #accessing }
SgFincaUrbana >> refCatastral: anObject [

	refCatastral := anObject
]

{ #category : #rendering }
SgFincaUrbana >> renderHtmlOn: html [

	html tableRow: [ 
		html tableData: self refCatastral .
		html tableData: self area.
		html tableData: self nombre.
		html tableData: self naturaleza ]
]
