Class {
	#name : #SgInsertarDefModeloHandler,
	#superclass : #WARequestHandler,
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgInsertarDefModeloHandler class >> initialize [

	<script>
	WAAdmin register: self at: 'signo/definicion/insertar'
]

{ #category : #handling }
SgInsertarDefModeloHandler >> handleFiltered: aRequestContext [

	| data |
	data := aRequestContext request postFields.

	aRequestContext request isGet
		ifTrue: [
		(SgResponseGenerator on: aRequestContext) methodNotAllowed ]
		ifFalse: [
			aRequestContext respond: [ :response |
				| columns tabla |
				columns := $| split: (aRequestContext request at: 'tupla').
				tabla := aRequestContext request at: 'tabla'.
				response
					nextPutAll: tabla;
					nextPutAll: ': ';
					nextPutAll: ($, join: columns) ] ]
]
