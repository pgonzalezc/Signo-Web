Class {
	#name : #SgDefModeloRFHandler,
	#superclass : #WARestfulHandler,
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgDefModeloRFHandler class >> initialize [

	<script>
	WAAdmin register: self at: '/signo/def-modelos'
]

{ #category : #'as yet unclassified' }
SgDefModeloRFHandler >> camposRespuesta: unModelo ejercicio: unEjercicio [

	<get>
	<path: 'campos/{unModelo}/{unEjercicio}'>
	<produces: 'text/html'>
	| campos |
	campos := SgGestionTablas
		          camposDelModelo: unModelo
		          ejercicio: unEjercicio.

	^ self renderPaginaCampos: campos
]

{ #category : #'as yet unclassified' }
SgDefModeloRFHandler >> ejercicios [
	"Como se trata de un servicio raíz el documento html es completo"

	<get>
	<path: 'ejercicios'>
	<produces: 'text/html'>
	^ WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :aRoot |
			self renderHtmlHeadTitle: 'Lista campos' on: aRoot.
			aRoot bodyAttributes at: 'hx-boost' put: 'true' ];
		render: [ :html |
			html heading
				level: 4;
				with: 'Consulta de modelos por ejercicio'.
			html paragraph:
				'Pulse sobre el ejercicio del que desee informarse de los modelos disponibles'.
			SgGestionTablas ejercicios do: [ :each |
				html anchor
					attributeAt: 'hx-get' put: ('modelos/{1}' format: { each });
					attributeAt: 'hx-target' put: '#modelos';
					url: '#';
					with: each.
				html space ].
			html div id: 'modelos' ]
]

{ #category : #accessing }
SgDefModeloRFHandler >> index [

	<get>
	<path: '/'>
	<provides: 'text/html'>
	self requestContext respond: [ :response | response redirectTo: 'ejercicios' ]
	
]

{ #category : #'as yet unclassified' }
SgDefModeloRFHandler >> modelosDelEjercicio: unEjercicio [

	<get>
	<path: 'modelos/{unEjercicio}'>
	<produces: 'text/html'>
	| modelos |
	modelos := SgGestionTablas modelosDelEjercicio: unEjercicio.
		^ WAHtmlCanvas builder render: [ :html |
		  html table with: [
			  self renderCabecerasModeloOn: html.
			  self renderTablaModelos: modelos On: html ] ]
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderCabecerasCamposOn: html [

	html tableRow: [
		html tableHeading: 'Id.'.
		html tableHeading: 'Modelo'.
		html tableHeading: 'Ejercicio'.
		html tableHeading: 'IdAp'.
		html tableHeading: 'Nombre'.
		html tableHeading: 'Nro. Reg.'.
		html tableHeading: 'Pos. Ini.'.
		html tableHeading: 'Longitud'.
		html tableHeading: 'Tipo' ]
]

{ #category : #'private ' }
SgDefModeloRFHandler >> renderCabecerasModeloOn: html [ 
html tableRow: [
					  html tableHeading: 'Id.'.
					  html tableHeading: 'Modelo'.
					  html tableHeading: 'Ejercicio'.
					  html tableHeading: 'IdAp'.
					  html tableHeading: 'Tipo'.
					  html tableHeading: 'Procedimiento'.
					  html tableHeading: 'IdTramiteP'.
					  html tableHeading: 'IdTramiteC'.
					  html tableHeading: 'Aplicación'.
					  html tableHeading: 'Umbral'.
					  html tableHeading: 'Fecha Inicio'.
					  html tableHeading: '¿Graba Sesión?'.
					  html tableHeading: '¿Ap. Control?' ].
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderHtmlHeadTitle: aTitle on: aRoot [

	aRoot beHtml5.
	aRoot meta charset: 'utf-8'.
	aRoot title: aTitle.
	aRoot stylesheet url:
		'/static-files/css/materialize/materialize.min.css'.
	aRoot javascript url:
		'/static-files/js/materialize//materialize.min.js'.
	aRoot javascript url: '/static-files/js/jquery/jquery.min.js'.
	aRoot javascript url: '/static-files/js/htmx/htmx.min.js'
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderIndex [

	<get>
	<path: 'index/'>
	self requestContext respond: [ :response |
		response redirectTo: '/static-files/testHtmx.html' ]
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderPaginaCampos: campos [

	^ WAHtmlCanvas builder
		  fullDocument: true;
		  rootBlock: [ :aRoot |
			  self renderHtmlHeadTitle: 'Lista campos' on: aRoot ];
		  render: [ :html |
			  html heading
				  level: 3;
				  with: ('Campos del modelo: {1}/{2}' format: {
								   (campos at: 1) modelo.
								   (campos at: 1) ejercicio }).
			  html table class: 'striped'; with: [
				  self renderCabecerasCamposOn: html.
				  self renderTablaCampos: campos on: html ] ]
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderTablaCampos: campos on: html [

	campos do: [ :tupla |
		html tableRow: [
			tupla asArray do: [ :column | html tableData: column ] ] ]
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderTablaModelos: listaModelos On: html [

	listaModelos do: [ :tupla |
		html tableRow: [
			tupla asArray doWithIndex: [ :column :idx |
				(idx = 5 and: [ column = 'I' ])
					ifFalse: [ html tableData: column ]
					ifTrue: [
						html tableData: [
							html anchor
								url: ('/signo/def-modelos/campos/{1}/{2}' format: {
												 tupla modelo.
												 tupla ejercicio });
								with: column ] ] ] ] ]
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderTablaModelos: listModelos on: html [

	 html table with: [
			  self renderCabecerasModeloOn: html.
			  self renderTablaModelos: listModelos On: html ]
]

{ #category : #rendering }
SgDefModeloRFHandler >> renderTableFor: listaModelos on: builder [

	builder render: [ :html | self renderCabecerasModeloOn: html.
		self renderTablaModelos: listaModelos On: html  ]
]

{ #category : #'as yet unclassified' }
SgDefModeloRFHandler >> urbanas [

	<get>
	<path: 'urbanas'>
	<produces: 'text/html'>
	^ WAHtmlCanvas builder
		  fullDocument: true;
		  rootBlock: [ :aRoot |
			  aRoot beHtml5.
			  aRoot meta charset: 'utf-8'.
			  aRoot title: 'Fincas Urbaas'.
			  aRoot stylesheet url:
					  '/static-files/css/materialize/materialize.min.css'.
			  aRoot javascript url:
					  '/static-files/js/materialize//materialize.min.js'.
			  aRoot javascript url: '/static-files/js/jquery/jquery.min.js'.
			  aRoot javascript url: '/static-files/js/htmx/htmx.min.js' ];
		  render: [ :html |
			  html heading
				  level: 4;
				  with: 'Datos fincas urbanas'.
			  html table with: [ DatosUrbanas renderTableHeaderOn: html.
				DatosUrbanas urbanas do: [ :each |
				  each renderHtmlOn: html.
		] ] ].
			  
]
