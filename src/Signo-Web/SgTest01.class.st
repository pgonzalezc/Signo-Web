Class {
	#name : #SgTest01,
	#superclass : #Object,
	#category : #'Signo-Web-DBs'
}

{ #category : #'as yet unclassified' }
SgTest01 class >> connInfo [

	^ SgGestionTablas connInfo
]

{ #category : #'as yet unclassified' }
SgTest01 class >> getKey: aString [

	^ (P3Client new url: self connInfo) in: [ :client | |stmt|
		[ stmt := client prepare: 'SELECT id, clave, valor FROM signo.test01 WHERE clave = $1'.
		(stmt query: { aString }) records] ensure: [ stmt close. client close ]
		 ]
]

{ #category : #'as yet unclassified' }
SgTest01 class >> putClave: aString withValue: anotherString [

	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		stmt := client prepare:
			        'INSERT INTO signo.test01(clave, valor) values ($1, $2)'.
		stmt execute: {
				aString.
				anotherString } ] ensure: [ client close ] ]
]

{ #category : #selection }
SgTest01 class >> selectAll [

	^ (P3Client new url: SgGestionTablas  connInfo) in: [ :client |
		  (client query: 'SELECT id, key, val FROM signo.test01')
			  records collect: [ :tupla | SgTest01Model fromTuple: tupla ] ]
]
