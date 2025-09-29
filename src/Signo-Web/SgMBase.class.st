Class {
	#name : 'SgMBase',
	#superclass : 'Object',
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'accessing' }
SgMBase >> validate [

	^ self subclassResponsibility 
]
