Class {
	#name : #SgCamposReportTestView,
	#superclass : #SgBaseView,
	#instVars : [
		'rows',
		'modelo',
		'ejercicio'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
SgCamposReportTestView >> columnsDefs [

	^ OrderedCollection new
		  add: (WAReportColumn selector: #idAp title: 'Id.Ap.');
		  add: (WAReportColumn selector: #nombre title: 'Nombre');
		  add: (WAReportColumn selector: #posini title: 'Pos.Inicial');
		  add: (WAReportColumn selector: #longitud title: 'Long.');
		  yourself
]

{ #category : #accessing }
SgCamposReportTestView >> ejercicio: aNumber [

	ejercicio := aNumber
]

{ #category : #accessing }
SgCamposReportTestView >> model [ 

	^ nil
]

{ #category : #accessing }
SgCamposReportTestView >> modelo: aString [

	modelo := aString
]

{ #category : #rendering }
SgCamposReportTestView >> renderContentOn: html [

	html div
		class: 'container';
		with: [
			html heading
				level: 3;
				with: ('Campos del {1}/{2}' format: {
								 modelo.
								 ejercicio }).
			self rows
				ifNotEmpty: [
					html render: (WATableReport new
							 rows: self rows;
							 columns: self columnsDefs).
					html form: [
						html div
							style: 'text-align: right';
							with: [
								html button
									value: 'Cerrar';
									callback: [ self answer ] ] ] ]
				ifEmpty: [
					html strong:
						'El modelo es declarativo y no tiene valores asociados en la tabla de campos' ] ]
]

{ #category : #accessing }
SgCamposReportTestView >> rows [

	^ rows ifNil: [ rows := SgGestionTablas camposDelModelo: modelo ejercicio: ejercicio. ]
]
