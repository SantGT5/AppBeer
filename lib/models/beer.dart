import "package:json_annotation/json_annotation.dart";

part 'beer.g.dart';

@JsonSerializable()
class Beer {
  Beer(this.id, this.name, this.yeast);

  int id;
  String name;
  String yeast;

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);

  Map<String, dynamic> toJson() => _$BeerToJson(this);
}
