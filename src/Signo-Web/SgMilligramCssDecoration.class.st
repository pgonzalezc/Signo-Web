Class {
	#name : #SgMilligramCssDecoration,
	#superclass : #WADecoration,
	#category : #'Signo-Web-Views'
}

{ #category : #delegation }
SgMilligramCssDecoration >> handleAnswer: aResponse [

	aResponse inspect.
	^ false
]

{ #category : #rendering }
SgMilligramCssDecoration >> renderContentOn: html [

	self renderNextOn: html 
]

{ #category : #updating }
SgMilligramCssDecoration >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot .
	aHtmlRoot stylesheet url: '/static-files/css/milligram-1.4.1/milligram.min.css'
]
