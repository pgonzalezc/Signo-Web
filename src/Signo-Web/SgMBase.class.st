Class {
	#name : #SgMBase,
	#superclass : #Object,
	#category : #'Signo-Web-Models'
}

{ #category : #accessing }
SgMBase >> validate [

	^ self subclassResponsibility 
]
