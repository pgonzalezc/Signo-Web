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
SgBaseView >> addError: anInteger [

	errores add: (SgErrores atCode: anInteger)
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
	^ self milligramCssLibs 
]

{ #category : #accessing }
SgBaseView >> focusId [

	^ focusId ifNil: [ focusId := '' ]
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
	^ self milligramJsLibs 
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
	self milligramCssLibs do: [ :each | aHtmlRoot stylesheet url: each ].
	self milligramJsLibs do: [ :each | "self setTurboOn: aHtmlRoot."
		aHtmlRoot javascript url: each ]
]
