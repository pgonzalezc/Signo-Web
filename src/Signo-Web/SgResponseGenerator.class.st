Class {
	#name : #SgResponseGenerator,
	#superclass : #WAResponseGenerator,
	#classVars : [
		'HttpErrorTemplate'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #initialization }
SgResponseGenerator class >> resetTemplates [

	<script>
	HttpErrorTemplate := nil
]

{ #category : #'as yet unclassified' }
SgResponseGenerator >> HtmlPageForGetInfo: fields [
	"Devuelve una página html con la informacion de la query String.
	 @param fields <Dictionary> el valor devuelto por WARequest queryFields."

	self ifResetPossible: [
		self response
			doNotCache;
			contentType: WAMimeType textHtml ].
	self response nextPutAll:
		(self getInfoTemplate
			 value: (Dictionary newFromPairs: {
						  #params.
						  (self transformDictionary: fields) }))
]

{ #category : #private }
SgResponseGenerator >> genericResponseForStatus: aStatusObject [

	self ifResetPossible: [
		self response
			doNotCache;
			contentType: WAMimeType textHtml ].
	self response nextPutAll: (self httpErrorTemplate value: {
				 (#status -> aStatusObject).
				 (#message -> (WAResponse messageForStatus: aStatusObject)).
				 (#service -> self request url) } asDictionary)
]

{ #category : #'as yet unclassified' }
SgResponseGenerator >> getInfoTemplate [ 

	^ (SgMustacheTemplate newForFile: 'getInfo.mustache.html') template
]

{ #category : #private }
SgResponseGenerator >> httpErrorTemplate [

	^ (SgMustacheTemplate newForFile:
			                        'httpError.mustache.html') template 
]

{ #category : #'instance creation' }
SgResponseGenerator >> methodNotAllowed [

	self genericResponseForStatus: WAResponse statusMethodNotAllowed 
]

{ #category : #generation }
SgResponseGenerator >> notImplemented [

	self genericResponseForStatus: WAResponse statusNotImplemented 
]

{ #category : #private }
SgResponseGenerator >> transformDictionary: aDictionary [

	aDictionary ifNil: [ ^ Dictionary new ].

	^ aDictionary keys with: aDictionary values collect: [ :k :v |
		{
			('k' -> k).
			('v' -> v) } asDictionary ]
]
