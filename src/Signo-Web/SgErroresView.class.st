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

	html div
		id: 'area-errores';
		with: [
			html blockquote: [ errores do: [ :each | each renderOn: html ] ] ]
]

{ #category : #rendering }
SgErroresView >> renderOn: html [

	html div class: 'area-errores'; with: [ 
		html blockquote: [ 
			html unorderedList: [ 
				errores do: [ :each | html listItem: each ]
				 ]
			 ]
		 ]
]
