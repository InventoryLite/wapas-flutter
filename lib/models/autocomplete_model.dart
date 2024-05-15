class AutocompleteModel {
  String? id;
  String? label;

  AutocompleteModel({this.id, this.label});

  AutocompleteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    return data;
  }
}
