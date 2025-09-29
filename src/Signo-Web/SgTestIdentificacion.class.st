Class {
	#name : 'SgTestIdentificacion',
	#superclass : 'SgBaseView',
	#instVars : [
		'children'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'testing' }
SgTestIdentificacion class >> canBeRoot [ 

	^true
]

{ #category : 'class initialization' }
SgTestIdentificacion class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: 'signo/test/identificacion'
]

{ #category : 'hooks' }
SgTestIdentificacion >> children [ 

	^ children
]

{ #category : 'initialization' }
SgTestIdentificacion >> initialize [

	super initialize.
	children := OrderedCollection
		            with: (SgIdentificacion new addDecoration:
				             (WAMessageDecoration new message:
					              'Identificación del Contribuyente'))
		            with: (SgIdentificacion new addDecoration:
				             (WAMessageDecoration new message:
					              'Identificación conyuge'))
		            with: (SgDeclComplementaria new addDecoration:
				             (WAMessageDecoration new message:
					              'Declaracion complementaria o sustitutiva'))
		            with: ((SgDevengo new periodosValidos: SgMPeriodo trimestrales, SgMPeriodo anual) addDecoration:
				             (WAMessageDecoration new message: 'Devengo'))
]

{ #category : 'as yet unclassified' }
SgTestIdentificacion >> processOkButton [

	Transcript
		show: 'processOkButton';
		cr.
	children do: [ :each |
		each decoratedComponent model validate ifNotEmpty: [
			Transcript
				show: ('Errores en los datos class: [{1}]' format:
							 { each message });
				cr ] ]
]

{ #category : 'rendering' }
SgTestIdentificacion >> renderButtonAreaOn: html [

	html div
		class: 'float-right';
		with: [
			html button
				callback: [ self processOkButton ];
				value: 'Ok'.
			html horizontalRule ]
]

{ #category : 'rendering' }
SgTestIdentificacion >> renderContentOn: html [

	html heading level2 with: 'Test identificacion'.
	html div
		class: 'container';
		with: [
			html form: [
					children do: [ :each |
							html render: each.
							html horizontalRule ].
					self renderButtonAreaOn: html ] ]
]
