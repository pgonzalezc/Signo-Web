Class {
	#name : #Sg319ModelProducto,
	#superclass : #Object,
	#instVars : [
		'tipo',
		'volumen',
		'precio',
		'mappings'
	],
	#category : #'Signo-Web-Models-m319'
}

{ #category : #'as yet unclassified' }
Sg319ModelProducto class >> tipo: aString volumen: aNumber precioLitro: anotherNumber [

	^ (self new)
		setTipo: aString;
		setVolumen: aNumber;
		setPrecioLitro: anotherNumber.
]

{ #category : #'as yet unclassified' }
Sg319ModelProducto class >> volumen: aNumber precioLitro: anotherNumber [

	^ (self new)
		setVolumen: aNumber;
		setPrecioLitro: anotherNumber.
]

{ #category : #accessing }
Sg319ModelProducto >> cuotaIva [

	^ ((volumen * precio * 21.00s2)  / 100.00s2) round: 2
]

{ #category : #'as yet unclassified' }
Sg319ModelProducto >> noInformado [

	^ self tipoNoInformado and: [ self volumenNoInformado and: [ self precioNoInformado ] ]
]

{ #category : #accessing }
Sg319ModelProducto >> precio [
	
	^ precio
]

{ #category : #'as yet unclassified' }
Sg319ModelProducto >> precioNoInformado [

	^ precio isNotNil or: [ precio <= 0.00 ]
]

{ #category : #printing }
Sg319ModelProducto >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' tipo: ';
		print: tipo.
	aStream
		nextPutAll: ' volumen: ';
		print: volumen.
	aStream
		nextPutAll: ' precio: ';
		print: precio.
	aStream
		nextPutAll: ' cuotaIva: ';
		print: self cuotaIva
]

{ #category : #initialization }
Sg319ModelProducto >> setPartidas: aDictionary [

	mappings := aDictionary
]

{ #category : #'as yet unclassified' }
Sg319ModelProducto >> setPrecioLitro: aNumber [

	precio := aNumber round: 2
]

{ #category : #initialization }
Sg319ModelProducto >> setTipo: aString [

	tipo := aString 
]

{ #category : #initialization }
Sg319ModelProducto >> setVolumen: aNumber [

	volumen := (aNumber round: 0) asInteger
]

{ #category : #accessing }
Sg319ModelProducto >> tipo [

	^ tipo
]

{ #category : #'as yet unclassified' }
Sg319ModelProducto >> tipoNoInformado [

	^ tipo isNil or: [ tipo trim isEmpty  ]
]

{ #category : #accessing }
Sg319ModelProducto >> validate [

	| errores |
	errores := OrderedCollection new.
	(self noInformado) ifFalse: [ 
		tipo ifNil: [ errores add: ((SgErrores atCode: 110) widgetId: 'p',(mappings keyAtValue: #tipo)) ].
		volumen ifNil: [ errores add: ((SgErrores atCode: 108) widgetId: 'p',(mappings keyAtValue: #volumen)) ].
		volumen <= 0.00 ifTrue: [ errores add:  ((SgErrores atCode: 111) widgetId: 'p',(mappings keyAtValue: #volumen))].
		precio ifNil: [ errores add: ((SgErrores atCode: 109) widgetId: 'p',(mappings keyAtValue: #precio)) ].
		precio < 1.70 ifTrue: [ errores add: ((SgErrores atCode: 107) widgetId: 'p',(mappings keyAtValue: #precio)) ]
		 ].
	^ errores
]

{ #category : #accessing }
Sg319ModelProducto >> volumen [

	^ volumen
]

{ #category : #'as yet unclassified' }
Sg319ModelProducto >> volumenNoInformado [

	^ volumen isNotNil and: [ volumen <= 0.00 ]
]
