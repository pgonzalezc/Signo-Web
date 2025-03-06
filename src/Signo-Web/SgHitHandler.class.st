Class {
	#name : #SgHitHandler,
	#superclass : #WARequestHandler,
	#classVars : [
		'Builder',
		'ETemplate',
		'MTemplate'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgHitHandler class >> initialize [ 

	<script>
	WAAdmin register:  self at: 'signo/hitServlet'
]

{ #category : #initialization }
SgHitHandler class >> reset [

	<script>
	MTemplate := nil.
	ETemplate := nil.
	Builder := nil
]

{ #category : #'as yet unclassified' }
SgHitHandler >> applyTemplate [

	| start |
	start := DateAndTime now.
	^ (self bodyTemplate value:
					   (DateAndTime now - start) humanReadablePrintString)
]

{ #category : #accessing }
SgHitHandler >> body [

	| start |
	start := DateAndTime now.
	^ self builder render: [ :html |
		  html heading
			  level: 4;
			  with: 'hit servlet - builder'.
		  html paragraph: ('Ejecutado en: {1} ' format:
				   { (DateAndTime now - start) humanReadablePrintString }) ]
]

{ #category : #'as yet unclassified' }
SgHitHandler >> bodyTemplate [

	^ MTemplate ifNil: [
		  MTemplate := '<html>
		<head>
			<title>Hit Servlet</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="/static-files/css/milligram/milligram.min.css" type="text/css">
		</head>
		<body>
			<h4>hit servlet - template</h4>
			<p>Ejecutado en {{ . }}</p>
		</body>
	</html>' asMustacheTemplate ]
]

{ #category : #accessing }
SgHitHandler >> builder [

	^ Builder ifNil: [
		  Builder := WAHtmlCanvas builder
			             fullDocument: true;
			             rootBlock: [ :root |
				             root title: 'hit servlet'.
				             root meta charset: 'utf-8'.
				             root meta
					             attributeAt: 'content'
					             put: 'width=device-width, initial-scale=1';
					             attributeAt: 'name' put: 'viewport'.
					root stylesheet url: '/static-file/css/normalize/normalize.min.css'.
				             root stylesheet url:
					             '/static-files/css/milligram/milligram.css' ] ]
]

{ #category : #'as yet unclassified' }
SgHitHandler >> errorTemplate [

	^ ETemplate ifNil: [
		  ETemplate := '<html>
		<head>
			<title>Hit Servlet</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="/static-files/css/milligram/milligram.min.css" type="text/css">
		</head>
		<body>
			<p>Parámetro <strong>{{ . }}</strong> sin informar. Es obligatorio</p>
		</body>
	</html>' asMustacheTemplate ]
]

{ #category : #handling }
SgHitHandler >> handleFiltered: aRequestContext [

	| servicio |
	servicio := aRequestContext request queryFields
		            at: 'tipo'
		            ifAbsent: 'builder'.
	aRequestContext response inspect.
	aRequestContext respond: [ :response |
		response
			contentType: WAMimeType textHtml;
			found.
		servicio asLowercase = 'json' ifTrue: [
			^ response
				  contentType: WAMimeType applicationJson;
				  nextPutAll:
					  { ('time' -> DateAndTime now asString) } asDictionary asJson ].
		servicio asLowercase = 'template' ifTrue: [
			^ response nextPutAll: self applyTemplate ].
		servicio asLowercase = 'builder' ifTrue: [
			^ response nextPutAll: self body ].
		response
			status: WAResponse statusExpectationFailed;
			nextPutAll: (self errorTemplate value: 'tipo') ]
]
