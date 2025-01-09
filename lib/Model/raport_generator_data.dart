import 'dart:convert';
import 'dart:typed_data';

import 'package:bws_agreement_creator/Model/exact_date.dart';
import 'package:bws_agreement_creator/Model/raport_location_data.dart';
import 'package:bws_agreement_creator/utils/svg_extension.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'raport_generator_data.g.dart';

@JsonSerializable()
@CopyWith()
class RaportGeneratorData {
  String id;
  RaportLocationData? location;
  String projectManager;
  String tradeFair;
  DateTime startDate;
  DateTime endDate;
  bool ropeSuspensionsIntalation;
  bool ropeSuspensionsUninstalation;
  bool otherServices;
  String otherServicesDescription;
  String hall;
  String stand;
  String exhibitor;
  ExactDate completionTime;
  ExactDate disassemblyDate;
  bool acceptance;
  String deffects;
  String deffectsSolution;
  bool deffectsResolved;
  bool isAcceptanceOn;
  String signatureBws;
  String signatureClient;

  RaportGeneratorData(
      {String? id,
      this.projectManager = "",
      this.location,
      this.tradeFair = "",
      DateTime? startDate,
      DateTime? endDate,
      this.ropeSuspensionsIntalation = false,
      this.ropeSuspensionsUninstalation = false,
      this.otherServices = false,
      this.otherServicesDescription = "",
      this.hall = "",
      this.stand = "",
      this.exhibitor = "",
      ExactDate? completionTime,
      ExactDate? disassemblyDate,
      this.acceptance = false,
      this.deffects = "",
      this.deffectsSolution = "",
      this.deffectsResolved = false,
      this.signatureBws = "",
      this.signatureClient = "",
      this.isAcceptanceOn = false})
      : startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now(),
        completionTime =
            completionTime ?? ExactDate(DateTime.now(), TimeOfDay.now()),
        disassemblyDate =
            disassemblyDate ?? ExactDate(DateTime.now(), TimeOfDay.now()),
        id = id ?? Uuid().v4();

  factory RaportGeneratorData.fromJson(Map<String, dynamic> json) =>
      _$RaportGeneratorDataFromJson(json);

  Map<String, dynamic> toJson() => _$RaportGeneratorDataToJson(this);

  Future<Uint8List> get signatureBwsBytes async {
    final decoded = jsonDecode(signatureBws);
    final control = HandSignatureControl.fromMap(decoded);
    final bytes =
        await control.toSvg(strokeWidth: 1, maxStrokeWidth: 1)?.asPng();
    return bytes ?? Uint8List(8);
  }

  Future<Uint8List> get signatureClientBytes async {
    final decoded = jsonDecode(signatureClient);
    final control = HandSignatureControl.fromMap(decoded);
    final bytes =
        await control.toSvg(strokeWidth: 1, maxStrokeWidth: 1)?.asPng();
    return bytes ?? Uint8List(8);
  }
}
