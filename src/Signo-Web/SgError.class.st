Class {
	#name : #SgError,
	#superclass : #Object,
	#instVars : [
		'message',
		'widgetId'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #accessing }
SgError class >> message: aString [

	^ self new message: aString
]

{ #category : #'as yet unclassified' }
SgError class >> message: aString widgetId: aStringId [

	^self new message: aString;widgetId: aStringId
]

{ #category : #accessing }
SgError >> message: anObject [

	message := anObject
]

{ #category : #printing }
SgError >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	widgetId ifNotNil: [  
	aStream
		nextPutAll: ' widgetId: ';
		print: widgetId].
	aStream
		nextPutAll: ' message: ';
		print: message
]

{ #category : #rendering }
SgError >> renderOn: html [

	html span
		class: 'small';
		with: [
			html text: message.
			widgetId ifNotNil: [
					html space.
					html anchor
						url: 'javascript:void(0)';
						onClick: (html jQuery id: widgetId) triggerFocus;
						with: [
							html image
								height: 16;
								width: 16;
								url: '/static-files/img/mail-forward-symbolic.svg'.
							html space.
							html text: 'Ir'.
							'Ir' ] ] ]
]

{ #category : #accessing }
SgError >> widgetId: anObject [

	widgetId := anObject
]
