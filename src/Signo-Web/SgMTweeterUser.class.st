Class {
	#name : #SgMTweeterUser,
	#superclass : #Object,
	#instVars : [
		'user',
		'following'
	],
	#category : #'Signo-Web-Models'
}

{ #category : #'instance creation' }
SgMTweeterUser class >> fromTuple: aTweeterUserTuple [

	^ (self new)
		setUser: aTweeterUserTuple first;
		setFollowing: aTweeterUserTuple second
]

{ #category : #'as yet unclassified' }
SgMTweeterUser class >> user: aUserString following: aCollection [

	^ self new
		setUser: aUserString;
		setFollowing: aCollection.
]

{ #category : #accessing }
SgMTweeterUser >> following [

	^ following
]

{ #category : #printing }
SgMTweeterUser >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' user: ';
		print: user.
	aStream
		nextPutAll: ' following: ';
		print: following
]

{ #category : #initialization }
SgMTweeterUser >> setFollowing: aCollection [

	following := aCollection asOrderedCollection 
]

{ #category : #initialization }
SgMTweeterUser >> setUser: aString [

	user := aString
]

{ #category : #accessing }
SgMTweeterUser >> user [

	^ user
]
