Class {
	#name : #Sg319ModelProducto,
	#superclass : #Object,
	#instVars : [
		'tipo',
		'volumen',
		'precio',
		'cuotaIva'
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

	cuotaIva := ((volumen * precio * 21.00s2)  / 100.00s2) round: 2.
	^ cuotaIva
]

{ #category : #accessing }
Sg319ModelProducto >> precio [
	
	^ precio
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
		print: cuotaIva
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

	volumen := aNumber round: 2
]

{ #category : #accessing }
Sg319ModelProducto >> tipo [

	^ tipo
]

{ #category : #accessing }
Sg319ModelProducto >> volumen [

	^ volumen
]
