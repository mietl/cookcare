import 'dart:ui';

class TCardModel {
  late String id;
  late String title;
  late String color;
  late Color colorHex;


  TCardModel(this.id, this.title, this.color);

  TCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    final parseValue = int.parse(color,radix: 16);

    colorHex = Color(parseValue | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    data['colorHex'] = colorHex;

    return data;
  }
}