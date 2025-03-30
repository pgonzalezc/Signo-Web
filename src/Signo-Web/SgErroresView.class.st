Class {
	#name : #SgErroresView,
	#superclass : #WAComponent,
	#instVars : [
		'errores'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'instance creation' }
SgErroresView class >> with: aCollection [

	^ (self new)
		errores: aCollection
]

{ #category : #accessing }
SgErroresView >> errores: aCollection [

	errores := aCollection copy.
	aCollection removeAll
]

{ #category : #rendering }
SgErroresView >> renderContentOn: html [

	errores ifNotEmpty: [ 
		html div
			id: 'areaErrores';
			with: [
				html blockquote: [ errores do: [ :each | each renderOn: html ] ] ].
			errores removeAll ]
]

{ #category : #rendering }
SgErroresView >> renderOn: html [

	self renderContentOn: html
]
