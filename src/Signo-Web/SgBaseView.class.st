Class {
	#name : #SgBaseView,
	#superclass : #WAComponent,
	#instVars : [
		'errores',
		'avisos',
		'focusId',
		'cssProvider'
	],
	#classVars : [
		'ConversorImp'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgBaseView class >> initialize [

	TinyLogger default
		addFileLoggerNamed: 'signo.log';
		clearLog.
	ConversorImp := GRSignPrinter new , (GRNumberPrinter new precision: 2)
]

{ #category : #adding }
SgBaseView >> addError: aSgError [

	errores add: aSgError
]

{ #category : #'as yet unclassified' }
SgBaseView >> bulmaCssLibs [

	^ #()
]

{ #category : #'as yet unclassified' }
SgBaseView >> bulmaJsLibs [

	^ #()
	
]

{ #category : #'as yet unclassified' }
SgBaseView >> cssLibs [

	cssProvider = #milligram ifTrue: [ ^ self milligramCssLibs ].
	cssProvider = #bulma ifTrue: [ ^ self bulmaCssLibs ].
	cssProvider = #materialize ifTrue: [  ^ self materializeCssLibs  ].
	cssProvider = #semantic ifTrue: [  ^ self semanticCssLibs  ].
	^ self milligramCssLibs 
]

{ #category : #accessing }
SgBaseView >> focusId [

	^ focusId ifNil: [ focusId := '' ]
]

{ #category : #testing }
SgBaseView >> hayErrores [ 

	^ errores isNotEmpty 
]

{ #category : #initialization }
SgBaseView >> initialize [ 

	super initialize.
	errores := OrderedCollection new.
	avisos := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
SgBaseView >> jsLibs [

	cssProvider = #milligram ifTrue: [ ^ self milligramJsLibs ].
	cssProvider = #bilma ifTrue: [ ^ self bulmaJsLibs ].
	cssProvider = #materialize ifTrue: [  ^ self materializeJsLibs  ].
	cssProvider = #semantic ifTrue: [ ^ self semanticJsLibs ].
	^ self milligramJsLibs 
]

{ #category : #'as yet unclassified' }
SgBaseView >> materializeCssLibs [

	^ #( '/static-files/css/materialize/materialize.min.css' )
]

{ #category : #'as yet unclassified' }
SgBaseView >> materializeJsLibs [

	^ #('/static-files/js/jquery-3.7.1/jquery.min.js')
]

{ #category : #'as yet unclassified' }
SgBaseView >> milligramCssLibs [

	^ #( '/static-files/css/fonts/roboto.css'
	     '/static-files/css/normalize/normalize.min.css'
	     '/static-files/css/milligram/milligram.min.css' 
			'/static-files/css/m113/custom.css')
]

{ #category : #'as yet unclassified' }
SgBaseView >> milligramJsLibs [

	^ #('/static-files/js/jquery-3.7.1/jquery.min.js')
]

{ #category : #accessing }
SgBaseView >> model [

	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
SgBaseView >> semanticCssLibs [

	^ #( '/static-files/css/semantic/semantic.min.css' )
]

{ #category : #'as yet unclassified' }
SgBaseView >> semanticJsLibs [

	^ #('/static-files/css/semantic/semantic.js' 
		 '/static-files/js/jquery/jquery.min.css' )
]

{ #category : #initialization }
SgBaseView >> setFocusId: aHtmlObjectId [

	focusId := aHtmlObjectId
]

{ #category : #initialization }
SgBaseView >> setHtmxOn: aHtmlRoot [

	aHtmlRoot javascript
		type: 'module';
		with: 'import htmx from "https://unpkg.com/htmx.org@2.0.3"'
		 
]

{ #category : #initialization }
SgBaseView >> setTurboOn: aHtmlRoot [

	aHtmlRoot javascript
		type: 'module';
		with:
			'import hotwiredTurbo from "https://cdn.skypack.dev/@hotwired/turbo@7.3.0";'
]

{ #category : #updating }
SgBaseView >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot meta name: 'viewport'; content: 'width=device-width, initial-scale=1.0'.
	aHtmlRoot stylesheet url: '/static-files/css/default.css'.
	self cssLibs do: [ :each | aHtmlRoot stylesheet url: each ].
	self jsLibs do: [ :each | "self setTurboOn: aHtmlRoot."
		aHtmlRoot javascript url: each ]
]
