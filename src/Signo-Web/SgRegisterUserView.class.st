Class {
	#name : 'SgRegisterUserView',
	#superclass : 'SgBaseView',
	#instVars : [
		'email',
		'password',
		'passwordbis',
		'apellidos',
		'nombre'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'as yet unclassified' }
SgRegisterUserView >> cancelar [

	self answer: ''
]

{ #category : 'as yet unclassified' }
SgRegisterUserView >> registrar [
	"Procedemos a validar y registrar los datos introducidos por el usuario en el formulario"

	password ~= passwordbis ifTrue: [ self addError: (SgErrores atCode: 100) ].
	(apellidos isNil or: [ apellidos trim isEmpty ]) ifTrue: [
		self addError: (SgErrores atCode: 101) ].
	email ifNil: [ self addError: (SgErrores atCode: 102) ].
	(nombre isNil or: [ nombre trim isEmpty ]) ifTrue: [
		self addError: (SgErrores atCode: 103) ].
	(password isNil or: [ password trim isEmpty ]) ifTrue: [
		self addError: (SgErrores atCode: 104) ].
	(passwordbis isNil or: [ passwordbis trim isEmpty ]) ifTrue: [
		self addError: (SgErrores atCode: 105) ].

	SgUsuariosRegistrados insertModel: (SgUsuarioRegistrado new
			 setEmail: email address;
			 setApellidos: apellidos;
			 setNombre: nombre;
			 setPassword: password).
			
	self answer
]

{ #category : 'rendering' }
SgRegisterUserView >> renderButtonCancelarOn: html [

	html button
		class: 'button button-outline';
		callback: [ self cancelar ];
		value: 'Cancelar'
]

{ #category : 'rendering' }
SgRegisterUserView >> renderButtonRegistrarOn: html [

	html button
		class: 'button';
		callback: [ self registrar ];
		value: 'Registrar'
]

{ #category : 'rendering' }
SgRegisterUserView >> renderContentOn: html [

	html div
		class: 'container';
		with: [
			html heading
				level: 3;
				with: 'Registro de usuario'.
			html paragraph:
				'Introduzca los siguientes datos para darse de alta en el sistema'.
			self renderErroresOn: html.
			html form: [
				self renderInputEmailOn: html.
				self renderInputApellidosOn: html.
				self renderInputNombreOn: html.
				self renderInputPasswordOn: html.
				self renderInputPasswordBisOn: html.

				html div
					style: 'text-align: right';
					with: [
						self renderButtonRegistrarOn: html.
						self renderButtonCancelarOn: html ] ] ]
]

{ #category : 'rendering' }
SgRegisterUserView >> renderErroresOn: html [

	errores ifNotEmpty: [ html render: (SgErroresView with: errores) ]
]

{ #category : 'rendering' }
SgRegisterUserView >> renderInputApellidosOn: html [

	html fieldSet: [ 
		html label for: 'input-apellidos'; with: 'Apellidos'.
		html textInput id: 'input-apellidos'; name: 'apellidos'; value: apellidos ;callback: [ :value | apellidos := value ]; placeholder: 'Introduzca sus apellidos' ]
]

{ #category : 'rendering' }
SgRegisterUserView >> renderInputEmailOn: html [

	html fieldSet: [
		html label
			for: 'input-email';
			with: 'Correo electrónico'.
		html emailInput
			id: 'input-email';
			name: #email;
			value: email;
			callback: [ :value | email := value ];
			placeholder: 'Introduzca su correo electrónico' ]
]

{ #category : 'rendering' }
SgRegisterUserView >> renderInputNombreOn: html [

	html fieldSet: [
		html label
			for: 'input-nombre';
			with: 'Nombre'.
		html textInput
			id: 'input-nombre';
			name: 'nombre';
			value: nombre;
			callback: [ :value | nombre := value ];
			placeholder: 'Introduzca su nombre' ]
]

{ #category : 'rendering' }
SgRegisterUserView >> renderInputPasswordBisOn: html [

	html fieldSet: [
		html label
			for: 'input-passwordbis';
			with: 'Repita su contraseña'.
		html passwordInput
			id: 'input-passwordbis';
			name: 'passwordbis';
			value: passwordbis ;
			callback: [ :value | passwordbis  := value ];
			placeholder: 'reintroduzca su contraseña' ]
]

{ #category : 'rendering' }
SgRegisterUserView >> renderInputPasswordOn: html [

	
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
