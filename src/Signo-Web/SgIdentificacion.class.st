"
Componente que gestiona la recogida de los datos de la identificación de un usuario, tiene las siguientes variables de instancia:

- title : titulo que identificará el componente (Por defecto 'Identificación')
- identificacion: <SgMIdentificacion> con los datos de la identificación que son (NIF,Apellido1,Apellido2,Nombre)

"
Class {
	#name : #SgIdentificacion,
	#superclass : #SgBaseView,
	#instVars : [
		'identificacion'
	],
	#classVars : [
		'ApellidosSplitted'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
SgIdentificacion class >> apellidosSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder setting: #apellidosSplitted)
		target: SgIdentificacion;
		label: '¿Recogida de los apellidos por separado?' translated;
		description:
			'Si se marca el checkbox los apellidos se recogen pon separado (Primer apellido, Segundo apellido), sino
		se recogen ambos en un sólo campo (Apellidos)';
		parent: #greetings
]

{ #category : #'as yet unclassified' }
SgIdentificacion class >> apellidosSplitted [

	^ ApellidosSplitted ifNil: [ ApellidosSplitted := false ]
]

{ #category : #'as yet unclassified' }
SgIdentificacion class >> apellidosSplitted: aBoolean [

	ApellidosSplitted := aBoolean
]

{ #category : #'as yet unclassified' }
SgIdentificacion >> answerIdentificacion [

	self answer: self identificacion
]

{ #category : #accessing }
SgIdentificacion >> identificacion [

	identificacion ifNil: [ identificacion := SgMIdentificacion new ].
	^ identificacion
]

{ #category : #accessing }
SgIdentificacion >> model [

	^ self identificacion
]

{ #category : #rendering }
SgIdentificacion >> renderContentOn: html [

	html fieldSet: [
		html div
			class: 'row';
			with: [
				html div
					class: 'column column-20';
					with: [ self renderFieldNifOn: html ].
				html div
					class: 'column';
					with: [ self renderFieldNombreOn: html ] ].

		self class apellidosSplitted
			ifFalse: [ self renderFieldApellidosOn: html ]
			ifTrue: [
				self renderFieldApellido1On: html.
				self renderFieldApellido2On: html ] ]
]

{ #category : #rendering }
SgIdentificacion >> renderField: aName withLength: aNumber On: html [

	| iden |
	iden := 'field-{1}' format: { aName }.
	html fieldSet: [
		html label
			for: iden;
			with: aName.
		html textInput
			id: iden;
			name: iden;
			maxLength: 45;
			value: (self identificacion perform: aName);
			callback: [ :value | identificacion perform: aName with: value ] ]
]

{ #category : #rendering }
SgIdentificacion >> renderFieldApellido1On: html [

		html label
			for: 'field-apellido1';
			with: 'Primer apellido'.
		html textInput
			id: 'field-apellido1';
			name: 'field-apellido1';
			maxLength: 75;
			value: self identificacion apellido1;
			callback: [ :value | identificacion apellido1: value ] 
]

{ #category : #rendering }
SgIdentificacion >> renderFieldApellido2On: html [

		html label
			for: 'field-apellido2';
			with: 'Segundo apellido'.
		html textInput
			id: 'field-apellido2';
			name: 'field-apellido2';
			maxLength: 75;
			value: self identificacion apellido2;
			callback: [ :value | identificacion apellido2: value ] 
]

{ #category : #rendering }
SgIdentificacion >> renderFieldApellidosOn: html [

	html label
		for: 'field-apellidos';
		with: 'Apellidos'.
	html textInput
		id: 'field-apellidos';
		name: 'field-apellidos';
		maxLength: 75;
		value: self identificacion apellido1;
		callback: [ :value |
			identificacion apellido1: value.
			identificacion apellido2: '' ]
]

{ #category : #rendering }
SgIdentificacion >> renderFieldNifOn: html [

	html label
		for: 'field-nif';
		with: 'N.I.F'.
	html textInput
		id: 'field-nif';
		name: 'field-nif';
		maxLength: 9;
		style: 'width: 12em';
		value: self identificacion nif;
		callback: [ :value | identificacion nif: value ]
]

{ #category : #rendering }
SgIdentificacion >> renderFieldNombreOn: html [

		html label
			for: 'field-nombre';
			with: 'Nombre'.
		html textInput
			id: 'field-nombre';
			name: 'field-nombre';
			maxLength: 45;
			value: self identificacion nombre;
			callback: [ :value | identificacion nombre: value ] 
]
