import 'package:json_annotation/json_annotation.dart';

part 'raport_location_data.g.dart';

@JsonSerializable()
class RaportLocationData {
  final String location;
  final String client;
  final String address;
  final List<String> managers;
  final String description;

  RaportLocationData({
    required this.location,
    required this.client,
    required this.address,
    required this.managers,
    required this.description,
  });

  factory RaportLocationData.fromJson(Map<String, dynamic> json) =>
      _$RaportLocationDataFromJson(json);
  Map<String, dynamic> toJson() => _$RaportLocationDataToJson(this);

  static List<RaportLocationData> listFromJson(Map<String, dynamic> json) {
    List<RaportLocationData> locations = [];
    for (var location in json['data']) {
      locations.add(RaportLocationData.fromJson(location));
    }
    return locations;
  }
}
