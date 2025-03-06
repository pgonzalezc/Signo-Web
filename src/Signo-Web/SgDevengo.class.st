Class {
	#name : #SgDevengo,
	#superclass : #SgBaseView,
	#instVars : [
		'ejercicio',
		'periodo',
		'fechaInicioPI',
		'fechaFinPI',
		'periodosValidos'
	],
	#classVars : [
		'Settings'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
SgDevengo class >> admiteFechaFinPI [

	^ Settings isNil or: [
		  Settings at: #fechaFinPI ifAbsent: [ false ] ]
]

{ #category : #initialization }
SgDevengo class >> admiteFechaFinPI: aBoolean [

	Settings ifNil: [ Settings := Dictionary new ].
	Settings at: #fechaFinPI put: aBoolean
]

{ #category : #'as yet unclassified' }
SgDevengo class >> admiteFechaInicioPI [

	^ Settings isNil or: [
		  Settings at: #fechaInicioPI ifAbsent: [ false ] ]
]

{ #category : #initialization }
SgDevengo class >> admiteFechaInicioPI: aBoolean [

	Settings ifNil: [ Settings := Dictionary new ].
	Settings at: #fechaInicioPI put: aBoolean
]

{ #category : #'as yet unclassified' }
SgDevengo class >> devengoSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder setting: #admiteFechaInicioPI)
		target: SgDevengo;
		label:
			'¿Debe informar de la fecha de inicio de período impositivo?'
				translated;
		description:
			'Si el modelo debe informar del la fecha de inicio del período impositivo, debe activar esta opción.';
		parent: #greetings.
	(aBuilder setting: #admiteFechaFinPI)
		target: SgDevengo;
		label:
			'¿Debe informar de la fecha de fin de período impositivo?'
				translated;
		description:
			'Si el modelo debe informar del la fecha de fin del período impositivo, debe activar esta opción.';
		parent: #greetings
]

{ #category : #accessing }
SgDevengo >> model [

	^ SgMDevengo new
]

{ #category : #accessing }
SgDevengo >> periodosValidos: aListOfPeriodos [

	periodosValidos := aListOfPeriodos 
]

{ #category : #printing }
SgDevengo >> printOn: aStream [


	aStream nextPutAll: self model asString.
	"aStream
		nextPutAll: 'ejercicio: ';
		nextPutAll: ejercicio asString;
		nextPutAll: ('[{1}]' format: { ejercicio class name });
		cr;
		nextPutAll: 'período: ';
		nextPutAll: periodo asString;
		nextPutAll: ('[{1}]' format: { periodo class name });
		cr;
		nextPutAll: 'fecha Inicio Período Impositivo: ';
		nextPutAll: fechaInicioPI asString;
		nextPutAll: ('[{1}]' format: { fechaInicioPI class name });
		cr;
		nextPutAll: 'fecha Fin Período Impositivo: ';
		nextPutAll: fechaFinPI asString;
		nextPutAll: ('[{1}]' format: { fechaFinPI class name });
		cr"
]

{ #category : #rendering }
SgDevengo >> renderContentOn: html [

	html fieldSet: [
		html div
			class: 'row';
			with: [
				html div
					class: 'column';
					with: [ self renderFieldEjercicioOn: html ].
				html div
					class: 'column';
					with: [ self renderFieldPeriodoOn: html ].
				self class admiteFechaInicioPI ifTrue: [
					html div
						class: 'column';
						with: [ self renderFieldFechaInicioPIOn: html ]].
					self class admiteFechaFinPI ifTrue: [
						html div
							class: 'column';
							with: [ self renderFieldFechaFinPIOn: html ] ] ] ] 
]

{ #category : #rendering }
SgDevengo >> renderFieldEjercicioOn: html [

	html label
							for: 'input-ejercicio';
							with: 'Ejercicio'.
						html textInput
							id: 'input-ejercicio';
							name: 'input-ejercicio';
							value: ejercicio;
							callback: [ :value | ejercicio := value ]
]

{ #category : #rendering }
SgDevengo >> renderFieldFechaFinPIOn: html [

	"render el campo fecha de fin de Periodo Impositivo (PI)"
	html label
		for: 'input-fecha-fin-PI';
		with: 'Fecha Fin Período Impositivo'.
	html dateInput5
		id: 'input-fecha-fin-PI';
		value: fechaFinPI;
		callback: [ :value | fechaFinPI := value asDateAndTime ]
]

{ #category : #rendering }
SgDevengo >> renderFieldFechaInicioPIOn: html [

	"render del campo fecha de inicio del Periodo Impositivo (PI)"
	html label
		for: 'input-fecha-inicio-PI';
		with: 'Fecha Inicio Período Impositivo'.
	html dateInput5
		id: 'input-fecha-inicio-PI';
		value: fechaInicioPI;
		callback: [ :value | fechaInicioPI := value ]
]

{ #category : #rendering }
SgDevengo >> renderFieldPeriodoOn: html [

	html label
		for: 'input-periodo';
		with: 'Período'.
	html select
		id: 'input-periodo';
		callback: [ :value | periodo := value ];
		list: periodosValidos ;
		labels: [ :each | each key , ' - ' , each value ]
]

{ #category : #updating }
SgDevengo >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot beHtml5
]
