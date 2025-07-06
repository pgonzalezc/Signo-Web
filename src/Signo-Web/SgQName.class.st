Class {
	#name : #SgQName,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'uri'
	],
	#category : #'Signo-Web-Utils'
}

{ #category : #'as yet unclassified' }
SgQName class >> prefix: aPrefix uri: anUri [

	^ (self basicNew)
		prefix: aPrefix;
		uri: anUri
]

{ #category : #accessing }
SgQName >> prefix [

	^ prefix
]

{ #category : #accessing }
SgQName >> prefix: aPrefix [

	prefix := aPrefix
]

{ #category : #accessing }
SgQName >> uri [

	^ uri
]

{ #category : #accessing }
SgQName >> uri: anUri [

	uri := anUri
]
