Class {
	#name : 'SgMIdentificacion',
	#superclass : 'SgMBase',
	#instVars : [
		'apellido1',
		'apellido2',
		'nombre',
		'nif'
	],
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'comparing' }
SgMIdentificacion >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ nif = anObject nif
]

{ #category : 'accessing' }
SgMIdentificacion >> apellido1 [

	^ apellido1
]

{ #category : 'accessing' }
SgMIdentificacion >> apellido1: aString [

	apellido1 := aString
]

{ #category : 'accessing' }
SgMIdentificacion >> apellido2 [

	^ apellido2
]

{ #category : 'accessing' }
SgMIdentificacion >> apellido2: aString [

	apellido2 := aString
]

{ #category : 'as yet unclassified' }
SgMIdentificacion >> denominacion [

	^ self isEmpty
		  ifTrue: [ '' ]
		  ifFalse: [
			  self apellido2 trim
				  ifEmpty: [
					  ('{1}, {2}' format: {
							   self apellido1 trim.
							   self nombre trim }) asUppercase ]
				  ifNotEmpty: [
					  ('{1} {2}, {3}' format: {
							   self apellido1 trim.
							   self apellido2 trim.
							   self nombre trim }) asUppercase ] ]
]

{ #category : 'comparing' }
SgMIdentificacion >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ nif hash
]

{ #category : 'initialization' }
SgMIdentificacion >> initialize [ 

	super initialize.
	nif := ''.
	nombre := ''.
	apellido1 := ''.
	apellido2 := ''
]

{ #category : 'testing' }
SgMIdentificacion >> isEmpty [

	^ self apellido1 isEmpty & self apellido2 isEmpty & self nombre isEmpty 
]

{ #category : 'accessing' }
SgMIdentificacion >> nif [

	^ nif
]

{ #category : 'accessing' }
SgMIdentificacion >> nif: aString [

	nif := aString
]

{ #category : 'accessing' }
SgMIdentificacion >> nombre [

	^ nombre
]

{ #category : 'accessing' }
SgMIdentificacion >> nombre: aString [

	nombre := aString
]

{ #category : 'printing' }
SgMIdentificacion >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' nombre: ';
		print: nombre.
	aStream
		nextPutAll: ' nif: ';
		print: nif.
	aStream
		nextPutAll: ' apellido2: ';
		print: apellido2.
	aStream
		nextPutAll: ' apellido1: ';
		print: apellido1
]

{ #category : 'rendering' }
SgMIdentificacion >> renderHtmlOn: html [

	html blockquote: [  
	html definitionList: [
		html definitionTerm: [ html strong: 'NIF' ].
		html definitionData: self nif.
		html definitionTerm: [ html strong: 'Apellidos y nombre' ].
		html definitionData: self denominacion ] ]
]

{ #category : 'rendering' }
SgMIdentificacion >> renderOn: aRenderer [

	aRenderer text: self denominacion
]

{ #category : 'testing' }
SgMIdentificacion >> validate [

	| errores |
	errores := OrderedCollection new.
	nif ifEmpty: [
		errores add:
			('{1}: nif sin informar. Es obligatorio' format:
				 { self class name }) ].
	apellido1 ifEmpty: [
		errores add:
			('{1}: primer apellido sin informar. Es obligatorio' format:
				 { self class name }) ].
	nombre ifEmpty: [
		errores add: ('{1}: nombre sin informar. Es obligatorio ' format:
				 { self class name }) ].

	"Introducir aqui cualquier otra validación que se quiera realizar"
	^ errores
]
