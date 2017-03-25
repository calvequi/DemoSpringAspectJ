-- ---------------------------------------------------------------------
-- Script de creacion de tablas utilizadas para el proyecto N4
-- Base de datos: empresas
-- Version: Oracle 11g
-- ---------------------------------------------------------------------

WHENEVER SQLERROR EXIT;

-- IDENTIFICADOR TABLA N4_REG_CP
CREATE SEQUENCE ROOT.N4_REG_CP_ID START WITH 0 INCREMENT BY 1 MINVALUE 0;
-- IDENTIFICADOR TABLA N4_EAC_VIP
CREATE SEQUENCE ROOT.N4_EAC_VIP_ID START WITH 0 INCREMENT BY 1 MINVALUE 0;
-- IDENTIFICADOR TABLA N4_EAC_VIP_HORAS
CREATE SEQUENCE ROOT.N4_EAC_VIP_HORAS_ID START WITH 0 INCREMENT BY 1 MINVALUE 0;
-- IDENTIFICADOR TABLA N4_EAC_VIP_FEC_INHABIL
CREATE SEQUENCE ROOT.N4_EAC_VIP_FEC_INHABIL_ID START WITH 0 INCREMENT BY 1 MINVALUE 0;
-- IDENTIFICADOR TABLA N4_CITAS
CREATE SEQUENCE ROOT.N4_CITAS_ID START WITH 0 INCREMENT BY 1 MINVALUE 0;

-- TABLA ROOT.N4_ESTATUS_SOL
CREATE TABLE ROOT.N4_ESTATUS_SOL (
	id 					number(2) NOT NULL PRIMARY KEY,
	nombre 				varchar2(20) NOT NULL,
	descripcion 		varchar2(50) NOT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL
);

COMMENT ON TABLE ROOT.N4_ESTATUS_SOL IS 'Catalogo de Estados de solicitud';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.id 					IS 'Identificador';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.nombre		 		IS 'Nombre de estado';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.descripcion		 	IS 'Descripcion de estado (Utilizado en Front-End)';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.refEstadoReg 			IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_ESTATUS_SOL.stpModificaReg		IS 'Fecha de modificacion';

-- TABLA ROOT.N4_MOTIVO_ESTATUS_SOL
CREATE TABLE ROOT.N4_MOTIVO_ESTATUS_SOL (
	id 					number(2) NOT NULL PRIMARY KEY,
	id_status			number(2) NOT NULL,
	nombre 				varchar2(20) NOT NULL,
	motivo		 		varchar2(50) NOT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL,
	FOREIGN KEY (id_status) 	REFERENCES ROOT.N4_ESTATUS_SOL (id)
);

COMMENT ON TABLE ROOT.N4_MOTIVO_ESTATUS_SOL IS 'Catalogo de SubEstados de solicitud';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.id 					IS 'Identificador';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.id_status 				IS 'Identificador del Estatus';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.nombre		 			IS 'Nombre de motivo';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.motivo		 			IS 'Descripcion del Motivo (Utilizado en Front-End)';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.refEstadoReg 			IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_MOTIVO_ESTATUS_SOL.stpModificaReg			IS 'Fecha de modificacion';

-- TABLA ROOT.N4_REG_CP
CREATE TABLE ROOT.N4_REG_CP (
	id 					number(10) NOT NULL PRIMARY KEY,
	cp 					number(5) NOT NULL,
	tipoReg 			number(2) DEFAULT 1 NOT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL
);

COMMENT ON TABLE ROOT.N4_REG_CP IS 'Registro de Codigos Postales ingresados';
COMMENT ON COLUMN ROOT.N4_REG_CP.id 					IS 'Identificador';
COMMENT ON COLUMN ROOT.N4_REG_CP.cp		 				IS 'Codigo Postal';
COMMENT ON COLUMN ROOT.N4_REG_CP.tipoReg		 		IS 'BLOQUEADO(1)';
COMMENT ON COLUMN ROOT.N4_REG_CP.refEstadoReg 			IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_REG_CP.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_REG_CP.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_REG_CP.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_REG_CP.stpModificaReg			IS 'Fecha de modificacion';

-- TABLA ROOT.N4_EAC_VIP
CREATE TABLE ROOT.N4_EAC_VIP (
	id 					number(10) NOT NULL PRIMARY KEY,
	email 				varchar2(50) NOT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL
);

COMMENT ON TABLE ROOT.N4_EAC_VIP IS 'EAC VIP';
COMMENT ON COLUMN ROOT.N4_EAC_VIP.id 					IS 'Identificador';
COMMENT ON COLUMN ROOT.N4_EAC_VIP.email		 			IS 'Correo electronico';
COMMENT ON COLUMN ROOT.N4_EAC_VIP.refEstadoReg 			IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_EAC_VIP.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_EAC_VIP.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_EAC_VIP.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_EAC_VIP.stpModificaReg		IS 'Fecha de modificacion';

-- TABLA ROOT.N4_EAC_VIP_HORAS
CREATE TABLE ROOT.N4_EAC_VIP_HORAS (
	id 					number(10) NOT NULL PRIMARY KEY,
	id_eac_vip			number(10) NOT NULL,
	rango		 		varchar2(30) NOT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL,
	FOREIGN KEY (id_eac_vip) 	REFERENCES ROOT.N4_EAC_VIP (id)
);

COMMENT ON TABLE ROOT.N4_EAC_VIP_HORAS IS 'Rango de horas disponibles de cada EAC VIP';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.id 					IS 'Identificador';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.id_eac_vip		 	IS 'Identificador de eac vip';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.rango		 		IS 'Rango de horas laborables';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.refEstadoReg 		IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_HORAS.stpModificaReg		IS 'Fecha de modificacion';

-- TABLA ROOT.N4_EAC_VIP_FEC_INHABIL
CREATE TABLE ROOT.N4_EAC_VIP_FEC_INHABIL (
	id 					number(10) NOT NULL PRIMARY KEY,
	id_eac_vip			number(10) NOT NULL,
	fecha 				varchar2(30) NOT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL,
	FOREIGN KEY (id_eac_vip) 	REFERENCES ROOT.N4_EAC_VIP (id)
);
COMMENT ON TABLE ROOT.N4_EAC_VIP_FEC_INHABIL IS 'Fechas no laborales de cada EAC VIP';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.id 					IS 'Identificador';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.id_eac_vip		 	IS 'Identificador de eac vip';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.fecha		 			IS 'Fecha no laboral';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.refEstadoReg 			IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_EAC_VIP_FEC_INHABIL.stpModificaReg		IS 'Fecha de modificacion';

-- TABLA ROOT.N4_SOLICITUD
CREATE TABLE ROOT.N4_SOLICITUD (
	guid 				varchar2(18) NOT NULL PRIMARY KEY,
	id_status 			number(2) DEFAULT 1 NOT NULL,
	id_motivo_status 	number(2),
	curp 				varchar2(20) NOT NULL,
	fechaNacimiento 	varchar2(10) NOT NULL,
	codigoPostal 		number(5) NOT NULL,
	idBP 				varchar2(10) DEFAULT NULL,
	account 			varchar2(16) DEFAULT NULL,
	investment 			varchar2(16) DEFAULT NULL,
	oportunity 			varchar2(16) DEFAULT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL,
	FOREIGN KEY (id_status) 	REFERENCES ROOT.N4_ESTATUS_SOL (id),
	FOREIGN KEY (id_motivo_status) 	REFERENCES ROOT.N4_MOTIVO_ESTATUS_SOL (id)
);
COMMENT ON TABLE ROOT.N4_SOLICITUD IS 'Solicitud de originacion de Cuenta n4';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.guid		 		IS 'Identificador de Solicitud';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.id_status			IS 'Estado de la solicitud';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.id_motivo_status	IS 'Motivo del Estado de la solicitud';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.curp		 		IS 'Clave Unica de Registro de Poblacion';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.fechaNacimiento		IS 'Fecha de Nacimiento';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.codigoPostal		IS 'Codigo Postal';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.idBP				IS 'Identificador de BP';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.account				IS 'Numero de cuenta';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.investment			IS 'Clave de inversion';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.oportunity			IS 'Identificador de Oportunidad';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.refEstadoReg 		IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_SOLICITUD.stpModificaReg		IS 'Fecha de modificacion';


-- TABLA ROOT.N4_CITAS
CREATE TABLE ROOT.N4_CITAS (
	id 					number(10) NOT NULL PRIMARY KEY,
	id_solicitud		varchar2(18) NOT NULL,
	id_eac_vip			number(10) NOT NULL,
	id_eac_vip_hora		number(10) NOT NULL,
	fecha 				varchar2(30) NOT NULL,
	status 				number(2) DEFAULT 1 NOT NULL,
	refEstadoReg 		number(2) DEFAULT 1 NOT NULL,
	desUserCreaReg 		varchar2(30) NOT NULL,
	stpCreaReg 			timestamp NOT NULL,
	desUserModificaReg 	varchar2(30) NOT NULL,
	stpModificaReg 		timestamp NOT NULL,
	FOREIGN KEY (id_solicitud) 	REFERENCES ROOT.N4_SOLICITUD (guid),
	FOREIGN KEY (id_eac_vip) 	REFERENCES ROOT.N4_EAC_VIP (id),
	FOREIGN KEY (id_eac_vip_hora) 	REFERENCES ROOT.N4_EAC_VIP_HORAS (id)
);

COMMENT ON TABLE ROOT.N4_CITAS IS 'Citas agendadas para EAP VIPs';
COMMENT ON COLUMN ROOT.N4_CITAS.id		 			IS 'Identificador';
COMMENT ON COLUMN ROOT.N4_CITAS.id_solicitud		IS 'Identificador de Solicitud';
COMMENT ON COLUMN ROOT.N4_CITAS.id_eac_vip			IS 'Identificador de EAC VIP';
COMMENT ON COLUMN ROOT.N4_CITAS.id_eac_vip_hora		IS 'Identificador de EAC VIP HORA';
COMMENT ON COLUMN ROOT.N4_CITAS.fecha				IS 'Fecha de la cita';
COMMENT ON COLUMN ROOT.N4_CITAS.status				IS 'AGENDADA(1), CANCELADA (0)';
COMMENT ON COLUMN ROOT.N4_CITAS.refEstadoReg 		IS 'Registro ACTIVO (1); INACTIVO(0);';
COMMENT ON COLUMN ROOT.N4_CITAS.desUserCreaReg 		IS 'Usuario que crea el registro';
COMMENT ON COLUMN ROOT.N4_CITAS.stpCreaReg 			IS 'Fecha de creacion';
COMMENT ON COLUMN ROOT.N4_CITAS.desUserModificaReg 	IS 'Usuario que modifica el registro';
COMMENT ON COLUMN ROOT.N4_CITAS.stpModificaReg		IS 'Fecha de modificacion';

COMMIT;