Class {
	#name : #SgEmailConfirmationView,
	#superclass : #WAComponent,
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
SgEmailConfirmationView >> doReturn [

	self answer
]

{ #category : #rendering }
SgEmailConfirmationView >> renderContentOn: html [

	html div
		class: 'container';
		with: [
			html heading
				level1;
				with: 'Confirmación de cuenta de correo'.
			html form: [
				html div style: 'text-align: right'; with: [ 
					html button class: 'button button-outline'; callback: [ self doReturn ]; value: 'Enviar'
					 ]
				]]
]

{ #category : #updating }
SgEmailConfirmationView >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url: '/static-files/css/milligram-1.4.1/milligram.min.css'
]
