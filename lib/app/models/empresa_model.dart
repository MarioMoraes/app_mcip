import 'dart:convert';

class EmpresaModel {
  String id;
  String razaoSocial;
  String endereco;
  String bairro;
  String cidade;
  String uf;
  String cep;
  String telefone;
  String whatsapp;
  String email;
  String complemento;
  String cpfCnpjTipo;
  String cpfCnpj;
  String dataCadastro;
  String ativoSn;
  String ddd;
  String nro;
  String tipoLogradouro;
  String percentualEncargosSociais;

  EmpresaModel({
    required this.id,
    required this.razaoSocial,
    required this.endereco,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.cep,
    required this.telefone,
    required this.whatsapp,
    required this.email,
    required this.complemento,
    required this.cpfCnpjTipo,
    required this.cpfCnpj,
    required this.dataCadastro,
    required this.ativoSn,
    required this.ddd,
    required this.nro,
    required this.tipoLogradouro,
    required this.percentualEncargosSociais,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'razao_social': razaoSocial,
      'endereco': endereco,
      'bairro': bairro,
      'cidade': cidade,
      'uf': uf,
      'cep': cep,
      'telefone': telefone,
      'whatsapp': whatsapp,
      'email': email,
      'complemento': complemento,
      'cpf_cnpj_tipo': cpfCnpjTipo,
      'cpf_cnpj': cpfCnpj,
      'data_cadastro': dataCadastro,
      'ativo_sn': ativoSn,
      'ddd': ddd,
      'nro': nro,
      'tipo_logradouro': tipoLogradouro,
      'percentual_encargos_sociais': percentualEncargosSociais,
    };
  }

  factory EmpresaModel.fromMap(Map<String, dynamic> map) {
    return EmpresaModel(
      id: map['id'] as String,
      razaoSocial: map['razao_social'] as String,
      endereco: map['endereco'] as String,
      bairro: map['bairro'] as String,
      cidade: map['cidade'] as String,
      uf: map['uf'] as String,
      cep: map['cep'] as String,
      telefone: map['telefone'] as String,
      whatsapp: map['whatsapp'] as String,
      email: map['email'] as String,
      complemento: map['complemento'] as String,
      cpfCnpjTipo: map['cpf_cnpj_tipo'] as String,
      cpfCnpj: map['cpf_cnpj'] as String,
      dataCadastro: map['data_cadastro'] as String,
      ativoSn: map['ativo_sn'] as String,
      ddd: map['ddd'] as String,
      nro: map['nro'] as String,
      tipoLogradouro: map['tipo_logradouro'] as String,
      percentualEncargosSociais: map['percentual_encargos_sociais'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpresaModel.fromJson(String source) =>
      EmpresaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
