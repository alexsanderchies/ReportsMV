PROMPT CREATE OR REPLACE VIEW vdic_cadastro_paciente_res
CREATE OR REPLACE VIEW vdic_cadastro_paciente_res (
  prontuario,
  nome_do_paciente,
  apelido_do_paciente,
  data_de_nascimento,
  sexo_do_paciente,
  descricao_do_sexo,
  codigo_da_cor,
  descricao_da_cor,
  numero_da_identidade,
  descricao_orgao_emissor,
  numero_do_cpf,
  numero_do_registro,
  estado_civil,
  descricao_do_estado_civil,
  nome_do_conjuge,
  nome_da_mae,
  nome_do_pai,
  tipo_sanguineo,
  doador,
  numero_do_telefone,
  numero_do_cep,
  descricao_do_endereco,
  numero_do_endereco,
  complemento_do_endereco,
  descricao_do_bairro,
  cidade,
  codigo_do_distritato_sanitario,
  local_de_trabalho,
  codigo_da_profissao,
  codigo_da_cns,
  numero_da_cns,
  codigo_da_cidadania,
  codigo_da_naturalidade,
  codigo_da_classe_economica,
  codigo_do_grau_de_instrucao,
  codigo_do_tipo_de_moradia,
  codigo_da_religiao,
  endereco_de_email,
  data_do_cadastro,
  hora_do_cadastro,
  nome_do_usuario,
  situacao_do_paciente,
  observacao
) AS
SELECT
       PACIENTE.CD_PACIENTE PRONTUARIO, PACIENTE.NM_PACIENTE NOME_DO_PACIENTE, PACIENTE.NM_MNEMONICO APELIDO_DO_PACIENTE,
       PACIENTE.DT_NASCIMENTO DATA_DE_NASCIMENTO, PACIENTE.TP_SEXO SEXO_DO_PACIENTE,
       DECODE( PACIENTE.TP_SEXO,'M', 'MASCULINO'
                               ,'F', 'FEMININO'
                               ,'I', 'INDETERMINADO' ) DESCRICAO_DO_SEXO,
       PACIENTE.TP_COR CODIGO_DA_COR,
       DECODE( PACIENTE.TP_COR,'B','BRANCA'
                              ,'P','PRETA'
                              ,'A','AMARELA'
                              ,'I','INDIGENA'
                              ,'R','PARDA'
                              ,NULL, 'NAO INFORMADA' ) DESCRICAO_DA_COR,
       PACIENTE.NR_IDENTIDADE NUMERO_DA_IDENTIDADE, PACIENTE.DS_OM_IDENTIDADE DESCRICAO_ORGAO_EMISSOR, PACIENTE.NR_CPF NUMERO_DO_CPF,
       PACIENTE.NR_RG_NASC NUMERO_DO_REGISTRO, PACIENTE.TP_ESTADO_CIVIL ESTADO_CIVIL,
       DECODE( PACIENTE.TP_ESTADO_CIVIL,'S', 'SOLTEIRO'
                                       ,'C', 'CASADO'
                                       ,'V', 'VIUVO'
                                       ,'D', 'DESQUITADO'
                                       ,'I', 'DIVORCIADO'
                                       ,'U', 'UNIÃO CONSENSUAL'
                                       ,NULL,'NAO INFORMADO' ) DESCRICAO_DO_ESTADO_CIVIL,
       PACIENTE.NM_CONJUGE NOME_DO_CONJUGE, PACIENTE.NM_MAE NOME_DA_MAE, PACIENTE.NM_PAI NOME_DO_PAI,
       PACIENTE.TP_SANGUINEO TIPO_SANGUINEO, PACIENTE.SN_DOADOR DOADOR, PACIENTE.NR_FONE NUMERO_DO_TELEFONE,
       PACIENTE.NR_CEP NUMERO_DO_CEP, PACIENTE.DS_ENDERECO DESCRICAO_DO_ENDERECO, PACIENTE.NR_ENDERECO NUMERO_DO_ENDERECO,
       PACIENTE.DS_COMPLEMENTO COMPLEMENTO_DO_ENDERECO, PACIENTE.NM_BAIRRO DESCRICAO_DO_BAIRRO, PACIENTE.CD_CIDADE CIDADE,
       PACIENTE.CD_DIS_SAN CODIGO_DO_DISTRITATO_SANITARIO, PACIENTE.DS_TRABALHO LOCAL_DE_TRABALHO, PACIENTE.CD_PROFISSAO CODIGO_DA_PROFISSAO,
       PACIENTE.CD_CNS CODIGO_DA_CNS, PACIENTE.NR_CNS NUMERO_DA_CNS, PACIENTE.CD_CIDADANIA CODIGO_DA_CIDADANIA,
       PACIENTE.CD_NATURALIDADE CODIGO_DA_NATURALIDADE, PACIENTE.CD_CLA_ECO CODIGO_DA_CLASSE_ECONOMICA, PACIENTE.CD_GRAU_INS CODIGO_DO_GRAU_DE_INSTRUCAO,
       PACIENTE.CD_TIP_MOR CODIGO_DO_TIPO_DE_MORADIA, PACIENTE.CD_RELIGIAO CODIGO_DA_RELIGIAO, PACIENTE.EMAIL ENDERECO_DE_EMAIL,
       PACIENTE.DT_CADASTRO DATA_DO_CADASTRO, PACIENTE.HR_CADASTRO HORA_DO_CADASTRO, PACIENTE.NM_USUARIO NOME_DO_USUARIO,
       PACIENTE.TP_SITUACAO SITUACAO_DO_PACIENTE, PACIENTE.DS_OBSERVACAO OBSERVACAO
FROM   DBAMV.PACIENTE
/

COMMENT ON TABLE vdic_cadastro_paciente_res IS 'Cadastro de Pacientes Resumido';

COMMENT ON COLUMN vdic_cadastro_paciente_res.prontuario IS 'Prontuário do paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.nome_do_paciente IS 'Nome do paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.apelido_do_paciente IS 'Nome Resumido do Paciente (Apelido)';
COMMENT ON COLUMN vdic_cadastro_paciente_res.data_de_nascimento IS 'Data de Nascimento do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.sexo_do_paciente IS 'Código identificador do Sexo do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.descricao_do_sexo IS 'Descrição do Código Identificador do Sexo do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_da_cor IS 'Código Identificador da Cor da Pele do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.numero_da_identidade IS 'Numero da Carteira de Identidade do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.descricao_orgao_emissor IS 'Nome do Orgão Responsável pela Emissão do Documento de Identidade do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.numero_do_cpf IS 'Numero do C.P.F. do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.numero_do_registro IS 'Número da Certidão de Nascimento do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.estado_civil IS 'Código Identificador do Estado Civil do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.descricao_do_estado_civil IS 'Descrição do Código Identificador do Estado Civil do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.nome_do_conjuge IS 'Nome do Conjuge ou Acompanhante do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.nome_da_mae IS 'Nome da Mãe do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.nome_do_pai IS 'Nome do Pai do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.tipo_sanguineo IS 'Tipo Sanguineo do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.doador IS 'Identifica se o Paciente é ou não um Doador de Orgãos e Tecidos';
COMMENT ON COLUMN vdic_cadastro_paciente_res.numero_do_telefone IS 'Numero do Telefone de Contato do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.numero_do_cep IS 'Número do Código de Endereçamento Postal do (C.E.P.)Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.descricao_do_endereco IS 'Endereço Residencial do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.numero_do_endereco IS 'Número do Residencial do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.complemento_do_endereco IS 'Complemento do Endereço Residencial do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.descricao_do_bairro IS 'Nome do Bairro onde se Localiza a Residência do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_do_distritato_sanitario IS 'Código identificador do Distrito Sanitário';
COMMENT ON COLUMN vdic_cadastro_paciente_res.local_de_trabalho IS 'Nome do Empresa onde o Paciente Trabalha';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_da_profissao IS 'Código de Indentificação da Profissão do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_da_cns IS 'Código da Carteira Nacional de Saúde do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.numero_da_cns IS 'Número da Carteira Nacional de Saúde do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_da_cidadania IS 'Código de Identificação da Cidadania do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_da_naturalidade IS 'Codigo de Identificação da Naturalidade do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_da_classe_economica IS 'Código de Identificação da Classe Social do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_do_grau_de_instrucao IS 'Código de Identificação do Grau de Instrução do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_do_tipo_de_moradia IS 'Código de Identificação do Tipo de Moradia do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.codigo_da_religiao IS 'Código de Identificação da Religião do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.endereco_de_email IS 'Endereço de e-mal do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.data_do_cadastro IS 'Data de Cadastro do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.hora_do_cadastro IS 'Hora de Cadastro do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.nome_do_usuario IS 'Nome do Usuário que realizou o Cadastro do Paciente';
COMMENT ON COLUMN vdic_cadastro_paciente_res.situacao_do_paciente IS 'Indetificador da Situação de Cadastro, Letra "O" identifica que o Paciente esta em Óbito';
COMMENT ON COLUMN vdic_cadastro_paciente_res.observacao IS 'Observações Cadastrais do Paciente';

GRANT SELECT ON vdic_cadastro_paciente_res TO dbacp WITH GRANT OPTION;
GRANT SELECT ON vdic_cadastro_paciente_res TO dbaportal WITH GRANT OPTION;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_paciente_res TO dbaps;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_paciente_res TO dbasgu;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_paciente_res TO mv2000;
GRANT DELETE,INSERT,SELECT,UPDATE ON vdic_cadastro_paciente_res TO mvintegra;
