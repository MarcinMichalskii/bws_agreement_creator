// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raport_location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaportLocationData _$RaportLocationDataFromJson(Map<String, dynamic> json) =>
    RaportLocationData(
      location: json['location'] as String,
      client: json['client'] as String,
      address: json['address'] as String,
      managers:
          (json['managers'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$RaportLocationDataToJson(RaportLocationData instance) =>
    <String, dynamic>{
      'location': instance.location,
      'client': instance.client,
      'address': instance.address,
      'managers': instance.managers,
      'description': instance.description,
    };
