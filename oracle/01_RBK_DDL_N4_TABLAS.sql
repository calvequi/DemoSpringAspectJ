-- ------------------------------------------------------------------------
-- Script de eleminacion de tablas utilizadas para el proyecto N4
-- Base de datos: root
-- Version: Oracle 11g
-- ------------------------------------------------------------------------

DROP TABLE ROOT.N4_CITAS CASCADE constraints;

DROP TABLE ROOT.N4_SOLICITUD CASCADE constraints;

DROP TABLE ROOT.N4_EAC_VIP_FEC_INHABIL CASCADE constraints;

DROP TABLE ROOT.N4_EAC_VIP_HORAS CASCADE constraints;

DROP TABLE ROOT.N4_EAC_VIP CASCADE constraints;

DROP TABLE ROOT.N4_REG_CP CASCADE constraints;

DROP TABLE ROOT.N4_MOTIVO_ESTATUS_SOL CASCADE constraints;

DROP TABLE ROOT.N4_ESTATUS_SOL CASCADE constraints;

DROP SEQUENCE ROOT.N4_CITAS_ID;

DROP SEQUENCE ROOT.N4_EAC_VIP_FEC_INHABIL_ID;

DROP SEQUENCE ROOT.N4_EAC_VIP_HORAS_ID;

DROP SEQUENCE ROOT.N4_EAC_VIP_ID;

DROP SEQUENCE ROOT.N4_REG_CP_ID;

COMMIT;