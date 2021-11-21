import "beer.dart";
import "package:json_annotation/json_annotation.dart";

part "beer_my_api.g.dart";

@JsonSerializable(anyMap: true, explicitToJson: true)
class BeerAPI {
  BeerAPI(this.data);

  List<Beer> data;

  factory BeerAPI.fromJson(Map<String, dynamic> json) =>
      _$BeerAPIFromJson(json);

  Map<String, dynamic> toJson() => _$BeerAPIToJson(this);
}
