Class {
	#name : 'SgDatePickerTestView',
	#superclass : 'SgBaseView',
	#instVars : [
		'children',
		'selection'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'testing' }
SgDatePickerTestView class >> canBeRoot [ 
		
	^ true
]

{ #category : 'class initialization' }
SgDatePickerTestView class >> initialize [ 

	<script>
	WAAdmin register:  self asApplicationAt: 'signo/test/datepicker'
]

{ #category : 'hooks' }
SgDatePickerTestView >> children [

	^ children
]

{ #category : 'as yet unclassified' }
SgDatePickerTestView >> columnsDefs [

	^ OrderedCollection new
		  add:
			  (WAReportColumn
				   selector: #modelo
				   title: 'Modelo');
		  add: ((WAReportColumn
				    selector: #ejercicio
				    title: 'Ejercicio'
				    onClick: [ :row |
					    Transcript
						    show: row asString;
						    cr ]) sortBlock: nil);
		  add:
			  (WAReportColumn
				   selector: #idAp
				   title: 'Id.Ap.'
				   onClick: [ :row |
					   Transcript
						   show: row asString;
						   cr ]);
		  add:
			  (WAReportColumn selector: #tipo title: 'Tipo' onClick: [ :row |
				   self
					   call: (SgCamposReportTestView new
							    modelo: row modelo;
							    ejercicio: row ejercicio)
					   onAnswer: [  ] ]);
		  add:
			  ((WAReportColumn selector: #procedimiento title: 'Procedimiento')
				   sortBlock: nil);
		  add:
			  ((WAReportColumn
				    selector: #tramitep
				    title: 'Tramite Presentación') sortBlock: nil);
		  add:
			  ((WAReportColumn selector: #tramitec title: 'Tramite Consulta')
				   sortBlock: nil);
		  add:
		  (WAReportColumn selector: #finiciopres title: 'Fecha Inicio Pres.');
		  add:
		  ((WAReportColumn selector: #umbral title: 'Umbral') sortBlock: nil);
		  add: ((WAReportColumn selector: #grabarSes title: 'Grabar Ses.?')
				   sortBlock: nil);
		  add: ((WAReportColumn selector: #apControl title: 'Ap. Control?')
				   sortBlock: nil);
		  yourself
]

{ #category : 'initialization' }
SgDatePickerTestView >> initialize [

	super initialize.
	children := OrderedCollection with: (WATableReport new
			             columns: self columnsDefs;
			             rows: (SgGestionTablas modelosDelEjercicio: 2023))
]

{ #category : 'accessing' }
SgDatePickerTestView >> model [ 

	^ nil
]

{ #category : 'rendering' }
SgDatePickerTestView >> renderContentOn: html [

	html div class: 'container'; with: [ 
		self children do: [ :each | html render: each ] ]
]
