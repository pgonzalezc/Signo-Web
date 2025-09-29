Class {
	#name : 'SgTest01TableReport',
	#superclass : 'WATableReport',
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'as yet unclassified' }
SgTest01TableReport >> cerrar [ 

	"Cerramos la vista de la tabla y nos dirigimos a la página helloWorld"
	
	self requestContext redirectTo: '/signo/helloWorld'
]
