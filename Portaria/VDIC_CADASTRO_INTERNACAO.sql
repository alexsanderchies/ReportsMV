PROMPT CREATE OR REPLACE VIEW vdic_cadastro_internacao
CREATE OR REPLACE VIEW vdic_cadastro_internacao (
  atendimento_do_paciente,
  data_atendimento,
  hora_atendimento,
  data_alta,
  hora_alta,
  prontuario,
  convenio,
  plano_convenio,
  sub_plano_convenio,
  sn_recebe_visita,
  cd_multi_empresa,
  prestador,
  setor,
  descricao_setor,
  unidade_internacao,
  nome_unidade_internacao,
  tipo_acomodacao,
  descricao_tipo_acomodacao,
  leito,
  nome_resumido_leito,
  tipo_internacao,
  descricao_tipo_internacao,
  motivo_alta,
  cid,
  tipo_resultado,
  especialidade,
  sn_obito,
  nm_usuario,
  sn_acompanhante
) AS
select atendime.cd_atendimento
       ,atendime.dt_atendimento
       ,atendime.hr_atendimento
       ,atendime.dt_alta
       ,atendime.hr_alta
       ,atendime.cd_paciente
       ,atendime.cd_convenio
       ,atendime.cd_con_pla
       ,atendime.cd_sub_plano
       ,atendime.sn_recebe_visita
       ,atendime.cd_multi_empresa
       ,atendime.cd_prestador
       ,unid_int.cd_setor
       ,setor.nm_setor
       ,leito.cd_unid_int
       ,unid_int.ds_unid_int
       ,atendime.cd_tip_acom
       ,tip_acom.ds_tip_acom
       ,atendime.cd_leito
       ,leito.ds_resumo
       ,atendime.cd_tipo_internacao
       ,tipo_internacao.ds_tipo_internacao
       ,atendime.cd_mot_alt
       ,atendime.cd_cid
       ,atendime.cd_tip_res
       ,atendime.cd_especialid
       ,atendime.sn_obito
       ,atendime.nm_usuario
       ,atendime.sn_acompanhante
  from dbamv.atendime
      ,dbamv.setor
      ,dbamv.unid_int
      ,dbamv.leito
      ,dbamv.tip_acom
      ,dbamv.tipo_internacao
 where leito.cd_leito                     = atendime.cd_leito
   and unid_int.cd_unid_int               = leito.cd_unid_int
   and setor.cd_setor                     = unid_int.cd_setor
   and tip_acom.cd_tip_acom (+)           = atendime.cd_tip_acom
   and tipo_internacao.cd_tipo_internacao = atendime.cd_tipo_internacao
   and tp_atendimento                     in ('I', 'E', 'U', 'A')
/

COMMENT ON TABLE vdic_cadastro_internacao IS 'Cadastro dos Atendimentos de Internação';

COMMENT ON COLUMN vdic_cadastro_internacao.atendimento_do_paciente IS 'Código do Atendimento';
COMMENT ON COLUMN vdic_cadastro_internacao.data_atendimento IS 'Data do Atendimento';
COMMENT ON COLUMN vdic_cadastro_internacao.hora_atendimento IS 'Hora do Atendimento';
COMMENT ON COLUMN vdic_cadastro_internacao.data_alta IS 'Data da Alta';
COMMENT ON COLUMN vdic_cadastro_internacao.hora_alta IS 'Hora da Alta';
COMMENT ON COLUMN vdic_cadastro_internacao.prontuario IS 'Código do Prontuário do Paciente';
COMMENT ON COLUMN vdic_cadastro_internacao.convenio IS 'Código do Convênio usado no Atendimento do Paciente';
COMMENT ON COLUMN vdic_cadastro_internacao.plano_convenio IS 'Código do Plano do Convênio usado no Atendimento do Paciente';
COMMENT ON COLUMN vdic_cadastro_internacao.sub_plano_convenio IS 'Código do Sub Plano do Convênio usado no Atendimento do Paciente';
COMMENT ON COLUMN vdic_cadastro_internacao.sn_recebe_visita IS 'Indica se o Paciente pode Receber Visita';
COMMENT ON COLUMN vdic_cadastro_internacao.cd_multi_empresa IS 'Código da Empresa (MULTI-EMPRESA)';
COMMENT ON COLUMN vdic_cadastro_internacao.prestador IS 'Médico Respondável pelo Paciente';
COMMENT ON COLUMN vdic_cadastro_internacao.setor IS 'Setor';
COMMENT ON COLUMN vdic_cadastro_internacao.descricao_setor IS 'Descrição do Setor';
COMMENT ON COLUMN vdic_cadastro_internacao.unidade_internacao IS 'Unidade de Internação';
COMMENT ON COLUMN vdic_cadastro_internacao.nome_unidade_internacao IS 'Descrição da Unidade Internacao';
COMMENT ON COLUMN vdic_cadastro_internacao.tipo_acomodacao IS 'Tipo de Acomodação';
COMMENT ON COLUMN vdic_cadastro_internacao.descricao_tipo_acomodacao IS 'Descrição do Tipo de Acomodação';
COMMENT ON COLUMN vdic_cadastro_internacao.leito IS 'Leito';
COMMENT ON COLUMN vdic_cadastro_internacao.nome_resumido_leito IS 'Nome Resunido do Leito';
COMMENT ON COLUMN vdic_cadastro_internacao.tipo_internacao IS 'Tipo de Internacao';
COMMENT ON COLUMN vdic_cadastro_internacao.descricao_tipo_internacao IS 'Descrição do Tipo de Internacao';
COMMENT ON COLUMN vdic_cadastro_internacao.motivo_alta IS 'Motivo da Alta';
COMMENT ON COLUMN vdic_cadastro_internacao.cid IS 'CID';
COMMENT ON COLUMN vdic_cadastro_internacao.tipo_resultado IS 'Tipo do Resultado';
COMMENT ON COLUMN vdic_cadastro_internacao.especialidade IS 'Especialidade';
COMMENT ON COLUMN vdic_cadastro_internacao.sn_obito IS 'Indica se o Paciente esta em Óbito';
COMMENT ON COLUMN vdic_cadastro_internacao.nm_usuario IS 'Nome do Usuário responsável em registrar a internação do paciente';
COMMENT ON COLUMN vdic_cadastro_internacao.sn_acompanhante IS 'Indica se o paciente possui acompanhante';

GRANT SELECT ON vdic_cadastro_internacao TO dbacp WITH GRANT OPTION;
GRANT SELECT ON vdic_cadastro_internacao TO dbaportal WITH GRANT OPTION;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_internacao TO dbaps;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_internacao TO dbasgu;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_internacao TO mv2000;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_internacao TO mvintegra;
