// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_my_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeerAPI _$BeerAPIFromJson(Map json) => BeerAPI(
      (json['data'] as List<dynamic>)
          .map((e) => Beer.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$BeerAPIToJson(BeerAPI instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
