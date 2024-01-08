class DependencyModel {
  int status;
  bool success;
  List<Type> types;
  List<Tag> tags;

  DependencyModel({
    required this.status,
    required this.success,
    required this.types,
    required this.tags,
  });

  factory DependencyModel.fromJson(Map<String, dynamic> json) {
    return DependencyModel(
      status: json['status'],
      success: json['success'],
      types:
          (json['data']['types'] as List).map((e) => Type.fromJson(e)).toList(),
      tags: (json['data']['tags'] as List).map((e) => Tag.fromJson(e)).toList(),
    );
  }
}

class Type {
  int value;
  String label;

  Type({
    required this.value,
    required this.label,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      value: json['value'],
      label: json['label'],
    );
  }
}

class Tag {
  int value;
  String label;

  Tag({
    required this.value,
    required this.label,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      value: json['value'],
      label: json['label'],
    );
  }
}
