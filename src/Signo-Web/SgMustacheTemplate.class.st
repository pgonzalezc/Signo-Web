Class {
	#name : 'SgMustacheTemplate',
	#superclass : 'Object',
	#instVars : [
		'name',
		'expireTime',
		'template'
	],
	#classVars : [
		'Base'
	],
	#category : 'Signo-Web-Utils',
	#package : 'Signo-Web',
	#tag : 'Utils'
}

{ #category : 'as yet unclassified' }
SgMustacheTemplate class >> lifetime [

	^ 5 minutes
]

{ #category : 'as yet unclassified' }
SgMustacheTemplate class >> newForFile: aFileName [ 

	^ (self new)
		name: aFileName
]

{ #category : 'initialization' }
SgMustacheTemplate >> initialize [

	super initialize.
	Base := 'var/www/es.naupacto/static-files/templates/signo'
]

{ #category : 'accessing' }
SgMustacheTemplate >> name: aFileName [

	name := aFileName
]

{ #category : 'accessing' }
SgMustacheTemplate >> template [

	| fullName |
	fullName := Base , '/' , name.
	(template isNil or: [ expireTime < DateAndTime now ]) ifTrue: [
		template := MustacheTemplate on: FileLocator root / fullName.
		expireTime := DateAndTime now + self class lifetime.
		('template {1} expires at: {2}' format: {
				 name.
				 expireTime asString }) record ].
	^ template
]
