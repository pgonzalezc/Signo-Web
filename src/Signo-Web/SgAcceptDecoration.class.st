Class {
	#name : 'SgAcceptDecoration',
	#superclass : 'WADecoration',
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'actions' }
SgAcceptDecoration >> doAccept [

	| decorated |
	decorated := self decoratedComponent.
	decorated answerIdentificacion
]

{ #category : 'rendering' }
SgAcceptDecoration >> renderContentOn: html [

	html form: [
		self renderNextOn: html.
		html div
			class: 'float-right';
			with: [
				html button
					callback: [ self doAccept ];
					with: 'Aceptar' ] ]
]
