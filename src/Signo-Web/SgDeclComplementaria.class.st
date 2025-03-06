Class {
	#name : #SgDeclComplementaria,
	#superclass : #SgBaseView,
	#instVars : [
		'complementaria',
		'sustitutiva',
		'nroJustAnterior'
	],
	#classVars : [
		'TiposAdmitidos'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
SgDeclComplementaria class >> admiteSustitutiva [

	^ TiposAdmitidos includes: #sustitutiva
]

{ #category : #'as yet unclassified' }
SgDeclComplementaria class >> admiteSustitutiva: aBoolean [

	aBoolean ifTrue: [ TiposAdmitidos add: #sustitutiva ]
	ifFalse: [ TiposAdmitidos remove: #sustitutiva ]
	
]

{ #category : #'class initialization' }
SgDeclComplementaria class >> initialize [

	<script>
	TiposAdmitidos := Set with: #complementaria
]

{ #category : #'as yet unclassified' }
SgDeclComplementaria class >> sustitutivaSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder setting: #admiteSustitutiva)
		target: self;
		label: '¿Admite declaraciones sustitutivas?' translated;
		description:
			'Si se marca el checkbox la vista SgDeclComplementaria mostrará la posibilidad de indicar que la declaración es sustitutiva';
		parent: #greetings
]

{ #category : #'as yet unclassified' }
SgDeclComplementaria >> decorated [

	^ (self decoration class ~= self class)
]

{ #category : #testing }
SgDeclComplementaria >> hasBanner [

	^ self decoration class ~= self class and: [ self decoration class = WAMessageDecoration  ]
]

{ #category : #initialization }
SgDeclComplementaria >> initialize [

	super initialize.
	complementaria := false.
	sustitutiva := false
]

{ #category : #accessing }
SgDeclComplementaria >> model [

	^ SgMDeclComplementaria new
]

{ #category : #rendering }
SgDeclComplementaria >> renderBloqueComplementariaOn: html [

	| texto etiqueta |
	etiqueta := self class admiteSustitutiva
		            ifFalse: [ 'Declaración complementaria.' ]
		            ifTrue: [ 'Declaración sustitutiva.' ].
	self hasBanner ifFalse: [
		html heading
			level: 3;
			with: etiqueta ].
	texto := self textoSegunConfiguracion.
	html paragraph: texto.

	html checkbox
		id: 'checkbox-complementaria';
		callback: [ :value | complementaria := value ].
	html label
		class: 'label-inline';
		for: 'checkbox-complementaria';
		with: [ html strong: etiqueta ].
	html div
		class: 'row';
		with: [
			html div
				class: 'column column-80';
				with: [
					html paragraph:
							'En este caso, consigne a continuación el número de justificante identificativo de la declaración anterior' ].
			html div
				class: 'column column-20';
				with: [
					html label
						for: 'input-just-anterior';
						with: 'Nro. Justificante'.
					html textInput
						id: 'input-just-anterior';
						name: 'input-just-anterior';
						maxLength: 13;
						callback: [ :value | nroJustAnterior := value ];
						value: nroJustAnterior ] ]
]

{ #category : #rendering }
SgDeclComplementaria >> renderContentOn: html [

	html fieldSet: [ self renderBloqueComplementariaOn: html ]
]

{ #category : #'as yet unclassified' }
SgDeclComplementaria >> textoSegunConfiguracion [

	"Devuelve el texto a mostrar en el componente de declaración complementaria si se ha configurado que el modelo
	admite declaración sustitutiva o sólo declaración complementaria"
	^ self class admiteSustitutiva
		  ifFalse: [
			  'Si esta declaración es complementaria de otra declaración anterior correspondiente al mismo concepto, ejercicio y período, indiquelo marcando la siquiente casilla.' ]
		  ifTrue: [
			  'Cuando la presentación de esta declaración tenga por objeto anular o sustituir completamente a otra declaración anterior del mismo ejercicio en el cual se hubieran consignado datos inexactos o erróneos, marque la siguiente casilla y haga constar a continuación el número identificativo de la declaración anterior que se sustituye mediante la nueva' ]
]
