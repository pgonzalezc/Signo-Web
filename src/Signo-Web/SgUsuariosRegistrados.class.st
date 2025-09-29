Class {
	#name : 'SgUsuariosRegistrados',
	#superclass : 'Object',
	#category : 'Signo-Web-DBs',
	#package : 'Signo-Web',
	#tag : 'DBs'
}

{ #category : 'as yet unclassified' }
SgUsuariosRegistrados class >> insertModel: anUserModel [

	(P3Client new url: SgTest01 connInfo) in: [ :client |
		| stmt |
		[
		stmt := client prepare:
			        'INSERT INTO signo.registro_usuarios(email, apellidos, nombre, password) VALUES ($1, $2, $3, $4)'.
		stmt execute: {
				anUserModel email address.
				anUserModel apellidos.
				anUserModel nombre.
				(SHA256 hashMessage: anUserModel password) hex } ] ensure: [
			stmt close.
			client close ] ]
]

{ #category : 'selection' }
SgUsuariosRegistrados class >> selectAll [
	"Devolvemos todos los usuarios registrados en el sistema"

	^ (P3Client new url: SgTest01 connInfo) in: [ :client |
		  [
		  (client query:
			   'SELECT id, email, apellidos, nombre, password, fecha_baja FROM signo.registro_usuarios')
			  records collect: [ :tupla | self transformToModel: tupla ] ]
			  ensure: [ client close ] ]
]

{ #category : 'as yet unclassified' }
SgUsuariosRegistrados class >> transformToModel: aTuple [

	"Transforma la tupla al modelo SgUsuarioRegistrado"
	^ SgUsuarioRegistrado new
		  setUserId: (aTuple at: 1);
		  setEmail: (aTuple at: 2);
		  setApellidos: (aTuple at: 3);
		  setNombre: (aTuple at: 4);
		  setPassword: (aTuple at: 5);
		  setFechaBaja: (aTuple at: 6)
]
