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

	errores := aCollection
]

{ #category : #rendering }
SgErroresView >> renderContentOn: html [

	errores ifNotEmpty: [ 
		html div
			id: 'areaErrores';
			with: [
				html blockquote: [
					html unorderedList: [ errores do: [ :each | html listItem: [each renderOn: html ] ] ] 
				 ] ].
		errores removeAll ]
	ifEmpty: [ html div id: 'areaErrores' ]
]

{ #category : #rendering }
SgErroresView >> renderOn: html [

	self renderContentOn: html
]
