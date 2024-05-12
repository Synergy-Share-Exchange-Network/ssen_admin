import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FaqModel {
  String identification;
  String title;
  String description;
  String companyId;
  FaqModel({
    identification,
    title,
    description,
    companyId,
  })  : identification = identification ?? '',
        title = title ?? '',
        description = description ?? '',
        companyId = companyId ?? '';

  FaqModel copyWith({
    String? identification,
    String? title,
    String? description,
    String? companyId,
  }) {
    return FaqModel(
      identification: identification ?? this.identification,
      title: title ?? this.title,
      description: description ?? this.description,
      companyId: companyId ?? this.companyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identification': identification,
      'title': title,
      'description': description,
      'companyId': companyId,
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      identification: map['identification'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      companyId: map['companyId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FaqModel(identification:$identification,  title: $title, description: $description,  companyId: $companyId)';
}
