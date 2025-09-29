Class {
	#name : 'SgHelloWorld',
	#superclass : 'WAComponent',
	#classVars : [
		'Usuario'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'testing' }
SgHelloWorld class >> canBeRoot [ 

	^ true
]

{ #category : 'as yet unclassified' }
SgHelloWorld class >> greetingSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #greetings)
		label: 'Greetings' translated;
		description:
			'Indica a quien se le debe saludar en el servicio SgHelloWorld';
		with: [
			(aBuilder pickOne: #usuario)
				label: 'Usuario receptor del saludo' translated;
				description:
					'Establece el usuario que recibirá el saludo en el servicio SgHelloWorld';
				domainValues: #(#paco #paloma #pablo);
				default: '' ]
]

{ #category : 'class initialization' }
SgHelloWorld class >> initialize [

	| app |
	app := WAAdmin register: self asApplicationAt: '/signo/helloWorld'.
	app configuration addParent: WAEmailConfiguration instance.
	app
		preferenceAt: #smtpServer put: 'mail.naupacto.com';
		preferenceAt: #smtpPort put: 465;
		preferenceAt: #smtpUsername put: 'monton.de.sabiduria@naupacto.com';
		preferenceAt: #smtpPassword put: '?zeUiOvHJf%b';
		yourself
]

{ #category : 'as yet unclassified' }
SgHelloWorld class >> usuario [

	^ Usuario
]

{ #category : 'as yet unclassified' }
SgHelloWorld class >> usuario: aString [

	Usuario := aString
]

{ #category : 'as yet unclassified' }
SgHelloWorld >> getIdenFromHeaders: headers [

	| x |
	x := ($, split: (headers at: 'ssl_client_s_dn')) collect: [ :each |
		     $= split: each ].
	^ (x collect: [ :ary | ary first -> ary second ]) asDictionary at:
		  'CN'
]

{ #category : 'private - protocol' }
SgHelloWorld >> login [ 

	| contexto |
	contexto := self call: (SgLoginView new)
]

{ #category : 'as yet unclassified' }
SgHelloWorld >> registrar [

	| user |
	user := self call: SgRegisterUserView new.
	Transcript show: ('Registrado usuario {1}' format: { user })
]

{ #category : 'rendering' }
SgHelloWorld >> renderContentOn: html [

	| presentador |
	
	html heading
		level3;
		with: ('Enhorabuena ''{1}'', ha accedido a SeaSide' format:
					 { self class usuario capitalized }).
	presentador := self getIdenFromHeaders:
		               self requestContext request headers.

	html heading
		level: 3;
		with: ('Autenticado el usuario {1}' format: { presentador }).
	html anchor
		callback: [ self login ];
		with: 'Login'.
	html break.
	html anchor
		callback: [ self registrar ];
		with: 'Registrar usuario'.
	html break.
	html anchor
		callback: [ self seleccionar ];
		with: 'Tipo Solicitud?'.
	html break.
	html anchor
		callback: [ self showTable ];
		with: 'Mostrar tabla'.
	html break.
	html anchor
		callback: [ self yesNoDialog ];
		with: 'Abrir dialogo'.
	html break.
	html anchor
		callback: [ self usuarios ];
		with: 'Usuarios registrados'
]

{ #category : 'as yet unclassified' }
SgHelloWorld >> seleccionar [

	| answer items component |
	items := #( 'provisional' 'definitiva' 'censal' ).
	component := WASelection new
		             addDecoration: SgMilligramCssDecoration new;
		             yourself.
	answer := self call: (component
			           items: items;
			           labelBlock: [ :label | label capitalized ]).
	Transcript show: ('seleccion realizada: [{1}]' format: { answer })
]

{ #category : 'as yet unclassified' }
SgHelloWorld >> showTable [

	| component answer |
	component := SgTest01TableReport new
		             rows: SgTest01 selectAll;
		             columns: (OrderedCollection new
									add: (WAReportColumn selector: #id title: 'id');
				              add:
					              (WAReportColumn selector: #clave title: 'Clave');
				              add:
					              (WAReportColumn selector: #valor title: 'Valor');
				              yourself);
		             rowColors: #( '#ABABAB' '#FAFAFA' );
		             rowPeriod: 1;
		             yourself.
	component addDecoration:
		(WAMessageDecoration new message: 'Tabla signo.test01').
	component addDecoration: SgMilligramCssDecoration new.
	component addDecoration: (WAFormDecoration new buttons: #( #cerrar )).
	answer := self call: component.
	Transcript
		show: ('showTable respuesta recibida: [{1}]' format: { answer });
		cr
]

{ #category : 'updating' }
SgHelloWorld >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot title: 'Hello World'.
	aHtmlRoot stylesheet url:
		'/static-files/css/milligram/milligram.min.css'
]

{ #category : 'as yet unclassified' }
SgHelloWorld >> usuarios [

	| component |
	component := WATableReport new
		             rows: SgUsuariosRegistrados selectAll;
		             columns: (OrderedCollection new
				              add: (WAReportColumn selector: #userId title: 'Id');
				              add:
					              (WAReportColumn selector: #email title: 'Email');
				              add:
					              (WAReportColumn
						               selector: #apellidos
						               title: 'Apellidos');
				              add:
					              (WAReportColumn selector: #nombre title: 'Nombre');
				              add:
					              (WAReportColumn
						               selector: #password
						               title: 'Contraseña');
				              add:
					              (WAReportColumn
						               selector: #fechaBaja
						               title: 'Fecha baja');
				              yourself);
		             rowColors: #( '#EAEAEA' '#FAFAFA' );
		             rowPeriod: 1;
		             yourself.
	component addDecoration:
		(WAMessageDecoration new message: 'Tabla signo.registro_usuarios').
	component addDecoration: SgMilligramCssDecoration new.
	self call: component
]

{ #category : 'as yet unclassified' }
SgHelloWorld >> yesNoDialog [

	| component |
	component := WAYesOrNoDialog new.
	(self call: component) ifFalse: [
		self requestContext redirectTo: 'helloWorld' ]
]
