Class {
	#name : #SgLoginView,
	#superclass : #WAComponent,
	#instVars : [
		'email',
		'password',
		'errores'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
SgLoginView >> checkAuthen [
	"Verificamos que los valores de la autenticación sea correctos"

	Transcript
		show: 'checkAuthen: ';
		show: (email ifNotNil: [email address] ifNil: ['']);
		show: ' : ';
		show: self password;
		cr
]

{ #category : #'as yet unclassified' }
SgLoginView >> checkData [
	"Verificamos que los parámetros recibidos email y password contiene valores que 
	son los esperados por la aplicación"

	email ifNil: [ errores add: 'Correo electronico debe informarse, es obligatorio' ].
	(password isNil or: [ password trim isEmpty ]) ifTrue: [
		errores add: 'Contraseña debe informarse, es obligatoria' ]
]

{ #category : #'as yet unclassified' }
SgLoginView >> doLogin [

	self checkData.
	self checkAuthen.

	self answer
]

{ #category : #accessing }
SgLoginView >> email [

	^ email
]

{ #category : #'as yet unclassified' }
SgLoginView >> gotoEmailConfirmationView [

	self call: (SgEmailConfirmationView new)
]

{ #category : #initialization }
SgLoginView >> initialize [ 

	super initialize .
	errores := OrderedCollection new
]

{ #category : #accessing }
SgLoginView >> password [

	^ (SHA256 hashMessage: password) base64Encoded 
]

{ #category : #rendering }
SgLoginView >> renderAnchorForgetPasswordOn: html [

	html div
		with: [
			html anchor
				callback: [ self gotoEmailConfirmationView ];
				with: '¿Olvidó su contraseña?' ]
]

{ #category : #rendering }
SgLoginView >> renderButtonLoginOn: html [

	html button class: 'button button-outline'; callback: [ self doLogin ]; value: 'Login'
]

{ #category : #rendering }
SgLoginView >> renderContentOn: html [

	html div
		class: 'container';
		with: [
			errores isNotEmpty
				ifTrue: [ (SgErroresView with: errores) renderOn: html ]. html div
				style: 'text-align: center';
				with: [
					html image
						width: 128;
						height: 128;
						url: '/static-files/img/usuario-sin-foto.png' ].
			self renderLoginFormOn: html ]
]

{ #category : #rendering }
SgLoginView >> renderInputEmailOn: html [

	html fieldSet: [
		html label
			for: 'input-email';
			with: 'Correo electrónico'.
		html emailInput
			id: 'input-email';
			name: 'email';
			value: email;
			placeholder: 'Introduzca un correo electronico';
			callback: [ :value | email := value ] ]
]

{ #category : #rendering }
SgLoginView >> renderInputPasswordOn: html [

	html fieldSet: [
		html label
			for: 'input-password';
			with: 'Contraseña'.
		html passwordInput
			id: 'input-password';
			name: 'password';
			value: password;
			callback: [ :value | password := value ];
			placeholder: 'introduzca su contraseña' ]
]

{ #category : #rendering }
SgLoginView >> renderLoginFormOn: html [

	html form
		id: 'login-form';
		with: [
			self renderInputEmailOn: html.
			self renderInputPasswordOn: html.
			self renderAnchorForgetPasswordOn: html.
			html div
				style: 'text-align: right';
				with: [ self renderButtonLoginOn: html ] ]
]

{ #category : #updating }
SgLoginView >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot stylesheet url:
		'/static-files/css/milligram-1.4.1/milligram.min.css'
]
