Class {
	#name : #SgMultipartHandler,
	#superclass : #WARequestHandler,
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgMultipartHandler class >> initialize [

	<script>
	WAAdmin register: self at: 'signo/multipartHandler'
]

{ #category : #handling }
SgMultipartHandler >> handleFiltered: aRequestContext [

| file tabla lineas nroLineas|
	tabla := aRequestContext request at: 'TAB'.
	file := aRequestContext request postFields at: 'FIC'.

	lineas := Character lf split: (file contentsDecodedUsing: 'UTF-8').
	aRequestContext respond: [ :response |
		response
			nextPutAll: tabla;
			nextPut: Character cr;
			nextPutAll: '---- BEGIN DOCUMENT ----';
			nextPut: Character cr;
			nextPutAll: (file contentsDecodedUsing: 'UTF-8');
			nextPut: Character cr;
			nextPutAll: lineas asString;
			nextPut: Character cr;
			nextPutAll: lineas size asString;
			nextPut: Character cr;
			nextPutAll: '---- END DOCUMENT ----' ]
]
