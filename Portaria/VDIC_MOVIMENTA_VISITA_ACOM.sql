PROMPT CREATE OR REPLACE VIEW vdic_movimenta_visita_acom
CREATE OR REPLACE VIEW vdic_movimenta_visita_acom (
  codigo_visitante_acompanhante,
  codigo_cartao_cracha,
  visitante_acompanhante,
  desc_visitante_acompanhante,
  atendimento_do_paciente,
  data_entrada,
  hora_entrada,
  usuario_entrada,
  data_saida,
  hora_saida,
  usuario_saida,
  nome_visitante_acompanhante,
  telefone,
  identificacao_do_documento,
  numero_documento,
  tipo_parentesco,
  nome_autorizador,
  numero_ramal,
  descricao_documento,
  descricao_tipo_parentesco,
  codigo_pessoa,
  cd_multi_empresa
) AS
SELECT MVTO_VISITA_ACOM.CD_ID_VISITA_ACOM CODIGO_VISITANTE_ACOMPANHANTE
	, MVTO_VISITA_ACOM.CD_CARTAO_CRACHA CODIGO_CARTAO_CRACHA
	, MVTO_VISITA_ACOM.ID_ACOM_VISIT VISITANTE_ACOMPANHANTE
	, DECODE (MVTO_VISITA_ACOM.ID_ACOM_VISIT, 'V', 'VISITANTE', 'A', 'ACOMPANHANTE') DESC_VISITANTE_ACOMPANHANTE
	, MVTO_VISITA_ACOM.CD_ATENDIMENTO ATENDIMENTO_DO_PACIENTE
	, MVTO_VISITA_ACOM.DT_ENTRADA DATA_ENTRADA
	, MVTO_VISITA_ACOM.HR_ENTRADA HORA_ENTRADA
	, MVTO_VISITA_ACOM.CD_USUARIO_ENTRA USUARIO_ENTRADA
	, MVTO_VISITA_ACOM.DT_SAIDA DATA_SAIDA
	, MVTO_VISITA_ACOM.HR_SAIDA HORA_SAIDA
	, MVTO_VISITA_ACOM.CD_USUARIO_SAIDA USUARIO_SAIDA
	, Decode (PT_PESSOA.SN_UTILIZA_NOME_SOCIAL, 'S', Nvl(NM_SOCIAL, NM_NOME), 'N',  NM_NOME)  NOME_VISITANTE_ACOMPANHANTE
	, PT_PESSOA.TELEFONE TELEFONE
	, PT_PESSOA.DOC_IDENT_ID IDENTIFICACAO_DO_DOCUMENTO
	, PT_PESSOA.NR_DOCUMENTO NUMERO_DOCUMENTO
	, MVTO_VISITA_ACOM.CD_TIP_PAREN TIPO_PARENTESCO
	, MVTO_VISITA_ACOM.NM_AUTORI NOME_AUTORIZADOR
	, MVTO_VISITA_ACOM.NR_RAMAL NUMERO_RAMAL
	, DOC_IDENTIFICACAO.DS_DOCUMENTO DESCRICAO_DOCUMENTO
	, TIP_PAREN.DS_TIP_PAREN DESCRICAO_TIPO_PARENTESCO
	, PT_PESSOA.CD_PESSOA CODIGO_PESSOA
  , MVTO_VISITA_ACOM.CD_MULTI_EMPRESA
FROM DBAMV.MVTO_VISITA_ACOM
	, DBAMV.PT_PESSOA
	, DBAMV.DOC_IDENTIFICACAO
	, DBAMV.TIP_PAREN
WHERE DBAMV.MVTO_VISITA_ACOM.CD_PESSOA = DBAMV.PT_PESSOA.CD_PESSOA
AND DBAMV.MVTO_VISITA_ACOM.CD_TIP_PAREN = DBAMV.TIP_PAREN.CD_TIP_PAREN(+)
AND DBAMV.PT_PESSOA.DOC_IDENT_ID = DBAMV.DOC_IDENTIFICACAO.DOC_IDENT_ID
/

COMMENT ON TABLE vdic_movimenta_visita_acom IS 'Movimento de visitantes e acompanhantes';

COMMENT ON COLUMN vdic_movimenta_visita_acom.codigo_visitante_acompanhante IS 'Codigo do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.codigo_cartao_cracha IS 'Codigo do Cart?o ou Cracha';
COMMENT ON COLUMN vdic_movimenta_visita_acom.visitante_acompanhante IS 'Tipo Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.desc_visitante_acompanhante IS 'Descric?o Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.atendimento_do_paciente IS 'Codigo do Atendimento';
COMMENT ON COLUMN vdic_movimenta_visita_acom.data_entrada IS 'Data de Entrada do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.hora_entrada IS 'Hora de Entrada do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.usuario_entrada IS 'Usuario de Entrada';
COMMENT ON COLUMN vdic_movimenta_visita_acom.data_saida IS 'Data de Saida do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.hora_saida IS 'Hora de Saida do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.usuario_saida IS 'Usuario de Saida';
COMMENT ON COLUMN vdic_movimenta_visita_acom.nome_visitante_acompanhante IS 'Nome do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.telefone IS 'Telefone do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.identificacao_do_documento IS 'Codigo do Tipo do Documento de Identificac?o';
COMMENT ON COLUMN vdic_movimenta_visita_acom.numero_documento IS 'Numero do Documento de Identificac?o';
COMMENT ON COLUMN vdic_movimenta_visita_acom.tipo_parentesco IS 'Tipo de Parentesco com o Paciente';
COMMENT ON COLUMN vdic_movimenta_visita_acom.nome_autorizador IS 'Nome do Autorizador da Entrada do Visitante ou Acompanhante';
COMMENT ON COLUMN vdic_movimenta_visita_acom.numero_ramal IS 'Numero do Ramal';
COMMENT ON COLUMN vdic_movimenta_visita_acom.descricao_documento IS 'Descric?o do Documento de Identificac?o';
COMMENT ON COLUMN vdic_movimenta_visita_acom.descricao_tipo_parentesco IS 'Descric?o do Tipo de Parentesco com o Paciente';
COMMENT ON COLUMN vdic_movimenta_visita_acom.codigo_pessoa IS 'Codigo da Pessoa';

GRANT SELECT ON vdic_movimenta_visita_acom TO dbacp WITH GRANT OPTION;
GRANT SELECT ON vdic_movimenta_visita_acom TO dbaportal WITH GRANT OPTION;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_movimenta_visita_acom TO dbaps;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_movimenta_visita_acom TO dbasgu;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_movimenta_visita_acom TO mv2000;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_movimenta_visita_acom TO mvintegra;
