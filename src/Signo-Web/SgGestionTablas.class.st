Class {
	#name : 'SgGestionTablas',
	#superclass : 'Object',
	#category : 'Signo-Web-DBs',
	#package : 'Signo-Web',
	#tag : 'DBs'
}

{ #category : 'as yet unclassified' }
SgGestionTablas class >> TableTweeerMessage [

	<script>
	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		client execute: 'DROP TABLE IF EXISTS tweeter.message'.
		client execute:
			'CREATE TABLE IF NOT EXISTS tweeter.message (usercode text not null, time integer, msg text not null, FOREIGN KEY (usercode) REFERENCES Tweeter.User(code));
			COMMENT ON COLUMN tweeter.message.usercode IS ''Código del usuario que genera el mensaje, debe estar en la tabla tweeter.user '';
			COMMENT ON COLUMN tweeter.message.time IS ''Día y hora en la que se genera el mensaje como un entero que representa el unixTime '';
			COMMENT ON COLUMN tweeter.message.msg IS ''El texto del mensaje, máximo 140 caracteres'' '.
		client execute:
			'CREATE INDEX IF NOT EXISTS message_usercode_index ON tweeter.message(usercode)'.
		stmt := client prepare:
			        'INSERT INTO tweeter.message(usercode, time, msg) values ($1,$2,$3)'.
		stmt execute: {
				'89890001K'.
				DateAndTime now asUnixTime.
				'Mensaje de texto para todos los seguidores de 89890001K . 1' }.
		stmt execute: {
				'89890001K'.
				DateAndTime now asUnixTime.
				'Mensaje de texto para todos los seguidores de 89890001K . 2' }.
		stmt execute: {
				'89890001K'.
				DateAndTime now asUnixTime.
				'Mensaje de texto para todos los seguidores de 89890001K . 3' }.
		stmt execute: {
				'89890001K'.
				DateAndTime now asUnixTime.
				'Mensaje de texto para todos los seguidores de 89890001K . 4' }.
		stmt execute: {
				'89890001K'.
				DateAndTime now asUnixTime.
				'Mensaje de texto para todos los seguidores de 89890001K . 5' }.
		stmt execute: {
				'89890001K'.
				DateAndTime now asUnixTime.
				'Mensaje de texto para todos los seguidores de 89890001K . 6'  }.
		stmt execute: {
				'89890002E'.
				DateAndTime now asUnixTime.
				'Atención seguidores... esta ocurriendo en estos momentos' } ]
			ensure: [
				stmt close.
				client close ] ].
	self inform: 'Creada la tabla tweeter.message'
]

{ #category : 'adding' }
SgGestionTablas class >> addUser: aFollowerUserCode asFollowerOf: aFollowedUserCode [
	"Se añade 'aUserCode' como seguidor de 'OtherUserCode'. ver tabla tweeter.user"

	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		stmt := client prepare:
			        'UPDATE tweeter.user SET follows = ARRAY_APPEND(follows, $1) WHERE code = $2 AND NOT (follows @> ARRAY[$1])'.
		stmt execute: {
				aFollowerUserCode.
				aFollowedUserCode } ] ensure: [
			stmt close.
			client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> camposDelModelo: unModelo ejercicio: unEjercicio [
	""

	^ (P3Client new url: self connInfo) in: [ :client |
		  | stmt result |
		  [
		  stmt := client prepare:
			          'SELECT id, modelo, ejercicio, idap, nombre, nroreg, posini, longitud, tipo FROM signo.pt04_campos WHERE modelo = $1 and ejercicio = $2'.
		  result := stmt query: {
				            unModelo.
				            unEjercicio }.
		  result records collect: [ :tuple | SgMPT04Campo from: tuple ] ]
			  ensure: [
				  stmt close.
				  client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> connInfo [ 
	
	^ 'psql://ratodalua:rat0da.ua@127.0.0.1:5432/ratodalua'
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> createUser: aTweeterUser [

	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		stmt := client prepare:
			        'INSERT INTO tweeter.user(code, follows) values ($1, $2)'.
			stmt execute: { aTweeterUser user . P3ValuesArray withAll: aTweeterUser following  } ]
			ensure: [
				stmt close.
				client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> ejercicios [

	^ (P3Client new url: self connInfo) in: [ :client |
		  [
		  (client query:
			   'SELECT DISTINCT(ejercicio) FROM signo.pt02_modelos ORDER BY 1')
			  data flattened ] ensure: [ client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> findMessagesOf: aCollectionOfUserCodes [
	"Devuelve una colleccion con los mensajes de la lista de usuarios que se le pasa
	ordenados del mas reciente al mas antiguo. De cada usuario sólo se cogen hata un 
	número máximo de mensajes definido por el método limitMessages"

	| whereClause |
	whereClause := ' or ' join:
		               (aCollectionOfUserCodes collect: [ :each |
			                'usercode = ''{1}''' format: { each } ]).
	^ (P3Client new url: self connInfo) in: [ :client |
		  | stmt |
		  [
		  stmt := client prepare:
			          ('SELECT usercode, time, msg FROM tweeter.message WHERE {1} ORDER BY time DESC LIMIT $1'
				           format: { whereClause }).
		  (stmt query: { self limitMessages }) data ] ensure: [
			  client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> findUser: aString [

	^ (P3Client new url: self connInfo) in: [ :client |
		  | stmt data |
		  [
		  stmt := client prepare:
			          'SELECT code, follows FROM tweeter.user WHERE code = $1'.
		  data := (stmt query: { aString }) data.
			data size > 0 ifTrue: [  SgMTweeterUser fromTuple: data first  ] ifFalse: [ nil ]
		  ] ensure: [
			  stmt close.
			  client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> insertModelo: unModelo [

	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		stmt := client prepare:
			        'INSERT INTO signo.pt02_modelos(modelo, ejercicio, idap, tipo, procedimiento, tramitep, tramitec, aplicacion, umbral, finiciopres, grabarses, apcontrol) values ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)'.
		stmt execute: unModelo asArray allButFirst] ensure: [
			stmt close.
			client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> limitMessages [

	^ 5
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> modelosDelEjercicio: anInteger [

	^ (P3Client new url: self connInfo) in: [ :client |
		  | stmt result |
		  [
		  stmt := client prepare:
			          'SELECT id, modelo, ejercicio, idap, tipo, procedimiento, tramitep, tramitec, aplicacion, umbral, finiciopres, grabarses, apcontrol FROM signo.pt02_modelos WHERE ejercicio = $1'.
		  result := stmt query: { anInteger }.
		  result records collect: [ :each | SgMPT02Modelo fromTuple: each ] ]
			  ensure: [
				  stmt close.
				  client close ] ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> tableSignoPt02Modelos [

	<script>
	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		client execute: 'DROP TABLE IF EXISTS signo.pt02_modelos'.
		client execute:
			'CREATE TABLE IF NOT EXISTS signo.pt02_modelos (id serial primary key, modelo char(3) not null, ejercicio integer not null, idap char(8), tipo char not null, procedimiento char(8) not null, tramitep char(8) not null, tramitec char(8) not null, aplicacion char(8) not null, umbral int not null, finiciopres timestamp not null, grabarses char not null, apcontrol char not null);
			COMMENT ON COLUMN signo.pt02_modelos.modelo IS ''Modelo al que pertenecen los datos '';
			COMMENT ON COLUMN signo.pt02_modelos.ejercicio IS ''Ejercicio de los datos '';
			COMMENT ON COLUMN signo.pt02_modelos.idap IS ''Identificador de la aplicación'';
			COMMENT ON COLUMN signo.pt02_modelos.tipo IS ''Tipo del modelo D - Declarativo, I - Informativo, X - Mixto'' '.
		client execute:
			'CREATE UNIQUE INDEX IF NOT EXISTS pt02_modelos_index ON signo.pt02_modelos(modelo, ejercicio, idap)'.
		stmt := client prepare:
			        'INSERT INTO signo.pt02_modelos(modelo, ejercicio, idap, tipo, procedimiento, tramitep, tramitec, aplicacion, umbral, finiciopres, grabarses, apcontrol) values ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)'.
		stmt execute: {
				'100'.
				2023.
				'PA13M100'.
				'D'.
				'GH100'.
				'100P'.
				'100C'.
				'OVRE0001'.
				0.
				(DateAndTime fromString: '2024-04-01 00:00:00.0').
				'S'.
				'S' } ] ensure: [
			stmt close.
			client close ] ].
	self inform: 'Creada la tabla signo.pt02_modelos'
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> tableSignoPt04Campos [

	<script>
	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		client execute: 'DROP TABLE IF EXISTS signo.pt04_campos'.
		client execute:
			'CREATE TABLE IF NOT EXISTS signo.pt04_campos (id serial primary key, modelo char(3) not null, ejercicio integer not null, idap char(8), nombre char(64) not null,
			nroreg integer not null, posini integer not null, longitud integer not null, tipo char(2));
			COMMENT ON COLUMN signo.pt04_campos.modelo IS ''Modelo al que pertenecen los datos '';
			COMMENT ON COLUMN signo.pt04_campos.ejercicio IS ''Ejercicio de los datos '';
			COMMENT ON COLUMN signo.pt04_campos.idap IS ''Identificador de la aplicación'';'.
		client execute:
			'CREATE INDEX IF NOT EXISTS pt04_campos_index ON signo.pt04_campos(modelo, ejercicio, idap)'.
		stmt := client prepare:
			        'INSERT INTO signo.pt04_campos(modelo,ejercicio,idap,nombre,nroreg,posini,longitud,tipo) VALUES($1,$2,$3,$4,$5,$6,$7,$8)'.
		stmt execute: { '720'. 2023. 'PA23M720'. 'MODELO'. 1. 2. 3. 'A' }.
		stmt execute: { '720'. 2023. 'PA23M720'. 'EJERCICIO'. 1. 5. 4. 'N' }.
		stmt execute: { '720'. 2023. 'PA23M720'. 'NIF'. 1. 9. 9. 'A' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'APELLIDO_Y_NOMBRE'. 1. 18. 40. 'A' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'TELEFONO_CONTACTO'. 1. 59. 9. 'N' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'CONTACTO_PERSONA'. 1. 68. 40. 'A' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'NUMERO_JUSTIFICANTE'.
			1. 108. 13. 'N' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'COMPLEMENTARIA'. 1. 121. 1. 'A' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'SUSTITUTIVA'. 1. 122. 1. 'A' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'NUMERO_JUSTITICANTE_ANTERIOR'.
			1. 123. 13. 'N' }.
		stmt execute:
			{ '720'. 2023. 'PA23M720'. 'TOTAL_REGISTROS'. 1. 136. 9. 'N' } ]
			ensure: [
				stmt close.
				client close ] ].
	self inform: 'Creada la tabla signo.pt02_modelos'
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> tableTest01 [

	(P3Client new url: self connInfo) in: [ :client |
		client execute: 'drop table if exists test01'.
		client execute:
			'create table signo.test01 ( id serial primary key, key text, val text)'.
		client execute:
			'insert into signo.test01 (key, val) values(''signo.test.clave1'',''clave1'')'.
		client execute:
			'insert into signo.test01 (key, val) values(''signo.test.clave2'',''clave2'')' ]
]

{ #category : 'as yet unclassified' }
SgGestionTablas class >> tableTweeterUser [
	"Crea la tabla tweeer.user y la carga con dos tuplas de ejemplo.
	
	Cuidado: se necesita que este creado el esquema 'tweeter' para la base de datos 'ratodalua' para ello
	ejecutar en terminal:
		> sudo -i -u postgres
		> psql -d ratodalua
		#psql> create schema tweeter authorization ratodalua;"

	<script>
	(P3Client new url: self connInfo) in: [ :client |
		| stmt |
		[
		client execute: 'drop table if exists tweeter.user'.
		client execute: '
			create table tweeter.user (id serial primary key, code text not null, follows text[]);
			comment on column tweeter.user.code is ''código identificativo del usuario'';
			comment on column tweeter.user.follows is ''array con los códigos de usuario a los que sigue el usuario de esta tupla'';
			'.
		client execute:
			'create unique index if not exists user_code_idx on tweeter.user (code)'.
		stmt := client prepare:
			        'insert into tweeter.user(code, follows) values($1,$2)'.
		stmt executeBatch: {
				{
					'89890001K'.
					P3ValuesArray empty }.
				{
					'89890002E'.
					(P3ValuesArray withAll: #( '89890001K' '89890005W' )) } } ]
			ensure: [
				stmt close.
				client close ] ].
	self inform: 'Tabla tweeter.user creada'
]
