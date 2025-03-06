Class {
	#name : #SgHit,
	#superclass : #SgBaseView,
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgHit class >> initialize [

	<script>
	| app |
	app := WAAdmin register: self asApplicationAt: 'signo/hit'.
	"app addFilter: SgHitFilter new"
]

{ #category : #rendering }
SgHit >> renderContentOn: html [

	| start |
	html document addLoadScript:
		(JSStream on: 'alert("onload");').
	start := DateAndTime now.
	html div
		class: 'container';
		with: [
			html heading
				level: 2;
				with: 'Hit'.
			html paragraph: ('Ejecutado en: {1} msegs' format:
					 { ((DateAndTime now - start) asNanoSeconds / 1000) }).
			html button
				id: 'test-button';
				name: 'test-button';
				onClick: (JSScript new jQuery id: 'test-button') hide;
				value: 'Test' ]
]

{ #category : #updating }
SgHit >> updateRoot: aRootHtml [

	super updateRoot: aRootHtml.
	self setHtmxOn: aRootHtml
]
