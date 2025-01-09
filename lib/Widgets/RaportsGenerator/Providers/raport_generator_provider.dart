import 'dart:convert';

import 'package:bws_agreement_creator/Model/exact_date.dart';
import 'package:bws_agreement_creator/Model/raport_generator_data.dart';
import 'package:bws_agreement_creator/Model/raport_location_data.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final raportGeneratorProvider =
    StateNotifierProvider<RaportGeneratorDataNotifier, RaportGeneratorData>(
        (ref) {
  return RaportGeneratorDataNotifier(ref);
});

class RaportGeneratorDataNotifier extends StateNotifier<RaportGeneratorData> {
  Ref<RaportGeneratorData> ref;
  RaportGeneratorDataNotifier(this.ref) : super(RaportGeneratorData());

  void setRaport(RaportGeneratorData data) {
    state = data;
  }

  void setLocation(RaportLocationData? value) {
    state = state.copyWith(location: value);
  }

  void setProjectManager(String value) {
    state = state.copyWith(projectManager: value);
  }

  void setTradeFair(String value) {
    state = state.copyWith(tradeFair: value);
  }

  void setStartDate(DateTime value) {
    state = state.copyWith(startDate: value);
  }

  void setEndDate(DateTime value) {
    state = state.copyWith(endDate: value);
  }

  void setRopeSuspensionsIntalation(bool value) {
    state = state.copyWith(ropeSuspensionsIntalation: value);
  }

  void setRopeSuspensionsUninstalation(bool value) {
    state = state.copyWith(ropeSuspensionsUninstalation: value);
  }

  void setOtherServices(bool value) {
    state = state.copyWith(otherServices: value);
  }

  void setOtherServicesDescription(String value) {
    state = state.copyWith(otherServicesDescription: value);
  }

  void setHall(String value) {
    state = state.copyWith(hall: value);
  }

  void setStand(String value) {
    state = state.copyWith(stand: value);
  }

  void setExhibitor(String value) {
    state = state.copyWith(exhibitor: value);
  }

  void setCompletionTime(ExactDate value) {
    state = state.copyWith(completionTime: value);
  }

  void setDisassemblyDate(ExactDate value) {
    state = state.copyWith(disassemblyDate: value);
  }

  void setAcceptance(bool value) {
    state = state.copyWith(acceptance: value);
  }

  void setDeffects(String value) {
    state = state.copyWith(deffects: value);
  }

  void setDeffectsSolution(String value) {
    state = state.copyWith(deffectsSolution: value);
  }

  void setDeffectsResolved(bool value) {
    state = state.copyWith(deffectsResolved: value);
  }

  void setSignatureBws(Map<String, dynamic> value) {
    final encoded = jsonEncode(value);
    state = state.copyWith(signatureBws: encoded);
  }

  void setSignatureClient(Map<String, dynamic> value) {
    final encoded = jsonEncode(value);
    state = state.copyWith(signatureClient: encoded);
  }

  void setIsAcceptanceOn(bool value) {
    state = state.copyWith(isAcceptanceOn: value);
  }

  void reset({String defaultManager = ''}) {
    state = RaportGeneratorData();
  }

  bool get generateDisabled {
    return state.location == null ||
        state.projectManager.emptyAsNull() == null ||
        signaturesEmpty;
  }

  bool get signaturesEmpty {
    try {
      final bws = jsonDecode(state.signatureBws);
      final client = jsonDecode(state.signatureClient);
      return bws['paths'].isEmpty == true || client["paths"].isEmpty == true;
    } catch (_) {
      return true;
    }
  }
}



{
  "cropHintsAnnotation": {
    "cropHints": [
      {
        "boundingPoly": {
          "vertices": [
            {
              "y": 126
            },
            {
              "x": 3023,
              "y": 126
            },
            {
              "x": 3023,
              "y": 3906
            },
            {
              "y": 3906
            }
          ]
        },
        "confidence": 0.47916666,
        "importanceFraction": 1
      },
      {
        "boundingPoly": {
          "vertices": [
            {
              "y": 403
            },
            {
              "x": 3023,
              "y": 403
            },
            {
              "x": 3023,
              "y": 3427
            },
            {
              "y": 3427
            }
          ]
        },
        "confidence": 0.59375,
        "importanceFraction": 0.99130434
      },
      {
        "boundingPoly": {
          "vertices": [
            {
              "y": 756
            },
            {
              "x": 3023,
              "y": 756
            },
            {
              "x": 3023,
              "y": 3276
            },
            {
              "y": 3276
            }
          ]
        },
        "confidence": 0.625,
        "importanceFraction": 0.8695652
      }
    ]
  },
  "fullTextAnnotation": {
    "pages": [
      {
        "blocks": [
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1029,
                  "y": 411
                },
                {
                  "x": 2056,
                  "y": 442
                },
                {
                  "x": 2042,
                  "y": 878
                },
                {
                  "x": 1016,
                  "y": 848
                }
              ]
            },
            "confidence": 0.96257114,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1029,
                      "y": 411
                    },
                    {
                      "x": 2056,
                      "y": 442
                    },
                    {
                      "x": 2042,
                      "y": 878
                    },
                    {
                      "x": 1016,
                      "y": 848
                    }
                  ]
                },
                "confidence": 0.96257114,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1125,
                          "y": 414
                        },
                        {
                          "x": 1879,
                          "y": 449
                        },
                        {
                          "x": 1874,
                          "y": 551
                        },
                        {
                          "x": 1120,
                          "y": 516
                        }
                      ]
                    },
                    "confidence": 0.9643267,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1125,
                              "y": 415
                            },
                            {
                              "x": 1206,
                              "y": 419
                            },
                            {
                              "x": 1201,
                              "y": 520
                            },
                            {
                              "x": 1120,
                              "y": 516
                            }
                          ]
                        },
                        "confidence": 0.9868039,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1210,
                              "y": 418
                            },
                            {
                              "x": 1287,
                              "y": 422
                            },
                            {
                              "x": 1282,
                              "y": 522
                            },
                            {
                              "x": 1205,
                              "y": 519
                            }
                          ]
                        },
                        "confidence": 0.9852235,
                        "text": "h"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1300,
                              "y": 423
                            },
                            {
                              "x": 1376,
                              "y": 427
                            },
                            {
                              "x": 1371,
                              "y": 527
                            },
                            {
                              "x": 1295,
                              "y": 524
                            }
                          ]
                        },
                        "confidence": 0.9501502,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1380,
                              "y": 426
                            },
                            {
                              "x": 1456,
                              "y": 430
                            },
                            {
                              "x": 1451,
                              "y": 530
                            },
                            {
                              "x": 1375,
                              "y": 527
                            }
                          ]
                        },
                        "confidence": 0.9044771,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1477,
                              "y": 431
                            },
                            {
                              "x": 1555,
                              "y": 435
                            },
                            {
                              "x": 1550,
                              "y": 536
                            },
                            {
                              "x": 1472,
                              "y": 532
                            }
                          ]
                        },
                        "confidence": 0.94041544,
                        "text": "l"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1547,
                              "y": 434
                            },
                            {
                              "x": 1630,
                              "y": 438
                            },
                            {
                              "x": 1625,
                              "y": 539
                            },
                            {
                              "x": 1542,
                              "y": 535
                            }
                          ]
                        },
                        "confidence": 0.9653123,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1638,
                              "y": 439
                            },
                            {
                              "x": 1708,
                              "y": 442
                            },
                            {
                              "x": 1703,
                              "y": 543
                            },
                            {
                              "x": 1633,
                              "y": 540
                            }
                          ]
                        },
                        "confidence": 0.973911,
                        "text": "t"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1718,
                              "y": 442
                            },
                            {
                              "x": 1788,
                              "y": 445
                            },
                            {
                              "x": 1783,
                              "y": 546
                            },
                            {
                              "x": 1713,
                              "y": 543
                            }
                          ]
                        },
                        "confidence": 0.9839858,
                        "text": "t"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1803,
                              "y": 446
                            },
                            {
                              "x": 1879,
                              "y": 450
                            },
                            {
                              "x": 1874,
                              "y": 550
                            },
                            {
                              "x": 1798,
                              "y": 547
                            }
                          ]
                        },
                        "confidence": 0.9886608,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "e"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1032,
                          "y": 524
                        },
                        {
                          "x": 1456,
                          "y": 567
                        },
                        {
                          "x": 1448,
                          "y": 644
                        },
                        {
                          "x": 1024,
                          "y": 602
                        }
                      ]
                    },
                    "confidence": 0.9802333,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1034,
                              "y": 524
                            },
                            {
                              "x": 1117,
                              "y": 534
                            },
                            {
                              "x": 1108,
                              "y": 609
                            },
                            {
                              "x": 1025,
                              "y": 598
                            }
                          ]
                        },
                        "confidence": 0.9732839,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1123,
                              "y": 534
                            },
                            {
                              "x": 1200,
                              "y": 543
                            },
                            {
                              "x": 1192,
                              "y": 617
                            },
                            {
                              "x": 1114,
                              "y": 607
                            }
                          ]
                        },
                        "confidence": 0.9828347,
                        "text": "h"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1224,
                              "y": 546
                            },
                            {
                              "x": 1287,
                              "y": 553
                            },
                            {
                              "x": 1279,
                              "y": 627
                            },
                            {
                              "x": 1216,
                              "y": 621
                            }
                          ]
                        },
                        "confidence": 0.97934026,
                        "text": "l"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1295,
                              "y": 569
                            },
                            {
                              "x": 1371,
                              "y": 575
                            },
                            {
                              "x": 1366,
                              "y": 634
                            },
                            {
                              "x": 1290,
                              "y": 628
                            }
                          ]
                        },
                        "confidence": 0.980442,
                        "text": "e"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1378,
                              "y": 562
                            },
                            {
                              "x": 1454,
                              "y": 568
                            },
                            {
                              "x": 1448,
                              "y": 642
                            },
                            {
                              "x": 1372,
                              "y": 636
                            }
                          ]
                        },
                        "confidence": 0.98526573,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "b"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1566,
                          "y": 568
                        },
                        {
                          "x": 1609,
                          "y": 570
                        },
                        {
                          "x": 1606,
                          "y": 646
                        },
                        {
                          "x": 1563,
                          "y": 644
                        }
                      ]
                    },
                    "confidence": 0.9070975,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1566,
                              "y": 568
                            },
                            {
                              "x": 1609,
                              "y": 570
                            },
                            {
                              "x": 1606,
                              "y": 646
                            },
                            {
                              "x": 1563,
                              "y": 644
                            }
                          ]
                        },
                        "confidence": 0.9070975,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "i"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1709,
                          "y": 569
                        },
                        {
                          "x": 2047,
                          "y": 555
                        },
                        {
                          "x": 2050,
                          "y": 637
                        },
                        {
                          "x": 1712,
                          "y": 651
                        }
                      ]
                    },
                    "confidence": 0.94988275,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1709,
                              "y": 569
                            },
                            {
                              "x": 1797,
                              "y": 566
                            },
                            {
                              "x": 1800,
                              "y": 647
                            },
                            {
                              "x": 1712,
                              "y": 651
                            }
                          ]
                        },
                        "confidence": 0.8344785,
                        "text": "W"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1810,
                              "y": 566
                            },
                            {
                              "x": 1864,
                              "y": 564
                            },
                            {
                              "x": 1867,
                              "y": 641
                            },
                            {
                              "x": 1813,
                              "y": 643
                            }
                          ]
                        },
                        "confidence": 0.98881257,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1882,
                              "y": 583
                            },
                            {
                              "x": 1954,
                              "y": 580
                            },
                            {
                              "x": 1956,
                              "y": 636
                            },
                            {
                              "x": 1884,
                              "y": 639
                            }
                          ]
                        },
                        "confidence": 0.99022704,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1973,
                              "y": 574
                            },
                            {
                              "x": 2047,
                              "y": 571
                            },
                            {
                              "x": 2050,
                              "y": 627
                            },
                            {
                              "x": 1976,
                              "y": 630
                            }
                          ]
                        },
                        "confidence": 0.986013,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "o"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1156,
                          "y": 645
                        },
                        {
                          "x": 1341,
                          "y": 664
                        },
                        {
                          "x": 1332,
                          "y": 747
                        },
                        {
                          "x": 1147,
                          "y": 728
                        }
                      ]
                    },
                    "confidence": 0.9440483,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1156,
                              "y": 645
                            },
                            {
                              "x": 1213,
                              "y": 651
                            },
                            {
                              "x": 1204,
                              "y": 733
                            },
                            {
                              "x": 1147,
                              "y": 728
                            }
                          ]
                        },
                        "confidence": 0.97028595,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1210,
                              "y": 651
                            },
                            {
                              "x": 1259,
                              "y": 656
                            },
                            {
                              "x": 1250,
                              "y": 737
                            },
                            {
                              "x": 1202,
                              "y": 732
                            }
                          ]
                        },
                        "confidence": 0.94679296,
                        "text": "l"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1245,
                              "y": 670
                            },
                            {
                              "x": 1297,
                              "y": 675
                            },
                            {
                              "x": 1290,
                              "y": 740
                            },
                            {
                              "x": 1238,
                              "y": 735
                            }
                          ]
                        },
                        "confidence": 0.962829,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1295,
                              "y": 674
                            },
                            {
                              "x": 1340,
                              "y": 679
                            },
                            {
                              "x": 1333,
                              "y": 743
                            },
                            {
                              "x": 1288,
                              "y": 739
                            }
                          ]
                        },
                        "confidence": 0.89628524,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "c"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1364,
                          "y": 665
                        },
                        {
                          "x": 1833,
                          "y": 671
                        },
                        {
                          "x": 1832,
                          "y": 778
                        },
                        {
                          "x": 1363,
                          "y": 772
                        }
                      ]
                    },
                    "confidence": 0.9719999,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1370,
                              "y": 666
                            },
                            {
                              "x": 1420,
                              "y": 670
                            },
                            {
                              "x": 1413,
                              "y": 752
                            },
                            {
                              "x": 1363,
                              "y": 748
                            }
                          ]
                        },
                        "confidence": 0.98754877,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1419,
                              "y": 686
                            },
                            {
                              "x": 1470,
                              "y": 689
                            },
                            {
                              "x": 1466,
                              "y": 751
                            },
                            {
                              "x": 1415,
                              "y": 748
                            }
                          ]
                        },
                        "confidence": 0.99712044,
                        "text": "z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1464,
                              "y": 689
                            },
                            {
                              "x": 1508,
                              "y": 692
                            },
                            {
                              "x": 1504,
                              "y": 754
                            },
                            {
                              "x": 1460,
                              "y": 751
                            }
                          ]
                        },
                        "confidence": 0.9915195,
                        "text": "c"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1501,
                              "y": 692
                            },
                            {
                              "x": 1548,
                              "y": 695
                            },
                            {
                              "x": 1544,
                              "y": 756
                            },
                            {
                              "x": 1497,
                              "y": 753
                            }
                          ]
                        },
                        "confidence": 0.9934291,
                        "text": "z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1543,
                              "y": 695
                            },
                            {
                              "x": 1588,
                              "y": 698
                            },
                            {
                              "x": 1584,
                              "y": 762
                            },
                            {
                              "x": 1539,
                              "y": 759
                            }
                          ]
                        },
                        "confidence": 0.99302095,
                        "text": "e"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1586,
                              "y": 696
                            },
                            {
                              "x": 1633,
                              "y": 699
                            },
                            {
                              "x": 1628,
                              "y": 776
                            },
                            {
                              "x": 1581,
                              "y": 773
                            }
                          ]
                        },
                        "confidence": 0.9847487,
                        "text": "p"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1627,
                              "y": 699
                            },
                            {
                              "x": 1672,
                              "y": 701
                            },
                            {
                              "x": 1669,
                              "y": 762
                            },
                            {
                              "x": 1624,
                              "y": 760
                            }
                          ]
                        },
                        "confidence": 0.95083624,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1666,
                              "y": 685
                            },
                            {
                              "x": 1712,
                              "y": 682
                            },
                            {
                              "x": 1718,
                              "y": 759
                            },
                            {
                              "x": 1672,
                              "y": 763
                            }
                          ]
                        },
                        "confidence": 0.88261485,
                        "text": "ń"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1713,
                              "y": 696
                            },
                            {
                              "x": 1753,
                              "y": 693
                            },
                            {
                              "x": 1757,
                              "y": 754
                            },
                            {
                              "x": 1718,
                              "y": 757
                            }
                          ]
                        },
                        "confidence": 0.96164775,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1748,
                              "y": 677
                            },
                            {
                              "x": 1798,
                              "y": 673
                            },
                            {
                              "x": 1804,
                              "y": 752
                            },
                            {
                              "x": 1754,
                              "y": 756
                            }
                          ]
                        },
                        "confidence": 0.9760935,
                        "text": "k"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1798,
                              "y": 673
                            },
                            {
                              "x": 1826,
                              "y": 671
                            },
                            {
                              "x": 1832,
                              "y": 749
                            },
                            {
                              "x": 1804,
                              "y": 751
                            }
                          ]
                        },
                        "confidence": 0.9734191,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "i"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1872,
                          "y": 663
                        },
                        {
                          "x": 1935,
                          "y": 659
                        },
                        {
                          "x": 1940,
                          "y": 746
                        },
                        {
                          "x": 1877,
                          "y": 750
                        }
                      ]
                    },
                    "confidence": 0.9882176,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1872,
                              "y": 663
                            },
                            {
                              "x": 1935,
                              "y": 659
                            },
                            {
                              "x": 1940,
                              "y": 746
                            },
                            {
                              "x": 1877,
                              "y": 750
                            }
                          ]
                        },
                        "confidence": 0.9882176,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "2"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1243,
                          "y": 762
                        },
                        {
                          "x": 1505,
                          "y": 771
                        },
                        {
                          "x": 1502,
                          "y": 861
                        },
                        {
                          "x": 1240,
                          "y": 852
                        }
                      ]
                    },
                    "confidence": 0.9887244,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1243,
                              "y": 763
                            },
                            {
                              "x": 1287,
                              "y": 765
                            },
                            {
                              "x": 1284,
                              "y": 853
                            },
                            {
                              "x": 1240,
                              "y": 852
                            }
                          ]
                        },
                        "confidence": 0.9842172,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1294,
                              "y": 764
                            },
                            {
                              "x": 1338,
                              "y": 766
                            },
                            {
                              "x": 1335,
                              "y": 854
                            },
                            {
                              "x": 1291,
                              "y": 853
                            }
                          ]
                        },
                        "confidence": 0.984136,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1329,
                              "y": 766
                            },
                            {
                              "x": 1376,
                              "y": 768
                            },
                            {
                              "x": 1373,
                              "y": 857
                            },
                            {
                              "x": 1326,
                              "y": 855
                            }
                          ]
                        },
                        "confidence": 0.9909054,
                        "text": "-"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1366,
                              "y": 767
                            },
                            {
                              "x": 1421,
                              "y": 769
                            },
                            {
                              "x": 1418,
                              "y": 858
                            },
                            {
                              "x": 1363,
                              "y": 856
                            }
                          ]
                        },
                        "confidence": 0.98877364,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1422,
                              "y": 769
                            },
                            {
                              "x": 1458,
                              "y": 770
                            },
                            {
                              "x": 1455,
                              "y": 859
                            },
                            {
                              "x": 1419,
                              "y": 858
                            }
                          ]
                        },
                        "confidence": 0.9919504,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1462,
                              "y": 770
                            },
                            {
                              "x": 1505,
                              "y": 771
                            },
                            {
                              "x": 1502,
                              "y": 860
                            },
                            {
                              "x": 1459,
                              "y": 859
                            }
                          ]
                        },
                        "confidence": 0.9923637,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "1"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1537,
                          "y": 772
                        },
                        {
                          "x": 1804,
                          "y": 781
                        },
                        {
                          "x": 1801,
                          "y": 871
                        },
                        {
                          "x": 1534,
                          "y": 862
                        }
                      ]
                    },
                    "confidence": 0.92755884,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1537,
                              "y": 773
                            },
                            {
                              "x": 1596,
                              "y": 775
                            },
                            {
                              "x": 1593,
                              "y": 864
                            },
                            {
                              "x": 1534,
                              "y": 862
                            }
                          ]
                        },
                        "confidence": 0.98419493,
                        "text": "K"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1586,
                              "y": 774
                            },
                            {
                              "x": 1632,
                              "y": 776
                            },
                            {
                              "x": 1629,
                              "y": 865
                            },
                            {
                              "x": 1583,
                              "y": 863
                            }
                          ]
                        },
                        "confidence": 0.99524426,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1629,
                              "y": 776
                            },
                            {
                              "x": 1678,
                              "y": 778
                            },
                            {
                              "x": 1675,
                              "y": 867
                            },
                            {
                              "x": 1626,
                              "y": 865
                            }
                          ]
                        },
                        "confidence": 0.9883958,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1670,
                              "y": 777
                            },
                            {
                              "x": 1721,
                              "y": 779
                            },
                            {
                              "x": 1718,
                              "y": 868
                            },
                            {
                              "x": 1667,
                              "y": 866
                            }
                          ]
                        },
                        "confidence": 0.96176255,
                        "text": "k"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1714,
                              "y": 779
                            },
                            {
                              "x": 1759,
                              "y": 781
                            },
                            {
                              "x": 1756,
                              "y": 870
                            },
                            {
                              "x": 1711,
                              "y": 868
                            }
                          ]
                        },
                        "confidence": 0.80652416,
                        "text": "ó"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1756,
                              "y": 780
                            },
                            {
                              "x": 1804,
                              "y": 782
                            },
                            {
                              "x": 1801,
                              "y": 871
                            },
                            {
                              "x": 1753,
                              "y": 869
                            }
                          ]
                        },
                        "confidence": 0.8292313,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "w"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 938,
                  "y": 964
                },
                {
                  "x": 2086,
                  "y": 980
                },
                {
                  "x": 2081,
                  "y": 1317
                },
                {
                  "x": 933,
                  "y": 1301
                }
              ]
            },
            "confidence": 0.9219862,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 938,
                      "y": 964
                    },
                    {
                      "x": 2086,
                      "y": 980
                    },
                    {
                      "x": 2081,
                      "y": 1317
                    },
                    {
                      "x": 933,
                      "y": 1301
                    }
                  ]
                },
                "confidence": 0.9219862,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 939,
                          "y": 964
                        },
                        {
                          "x": 1201,
                          "y": 971
                        },
                        {
                          "x": 1198,
                          "y": 1089
                        },
                        {
                          "x": 936,
                          "y": 1082
                        }
                      ]
                    },
                    "confidence": 0.96746147,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 939,
                              "y": 965
                            },
                            {
                              "x": 982,
                              "y": 966
                            },
                            {
                              "x": 979,
                              "y": 1083
                            },
                            {
                              "x": 936,
                              "y": 1082
                            }
                          ]
                        },
                        "confidence": 0.94942147,
                        "text": "M"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 985,
                              "y": 966
                            },
                            {
                              "x": 1033,
                              "y": 967
                            },
                            {
                              "x": 1030,
                              "y": 1084
                            },
                            {
                              "x": 982,
                              "y": 1083
                            }
                          ]
                        },
                        "confidence": 0.9776411,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1034,
                              "y": 967
                            },
                            {
                              "x": 1072,
                              "y": 968
                            },
                            {
                              "x": 1069,
                              "y": 1085
                            },
                            {
                              "x": 1031,
                              "y": 1084
                            }
                          ]
                        },
                        "confidence": 0.9760474,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1072,
                              "y": 968
                            },
                            {
                              "x": 1125,
                              "y": 969
                            },
                            {
                              "x": 1122,
                              "y": 1086
                            },
                            {
                              "x": 1069,
                              "y": 1085
                            }
                          ]
                        },
                        "confidence": 0.9685901,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1115,
                              "y": 969
                            },
                            {
                              "x": 1157,
                              "y": 970
                            },
                            {
                              "x": 1154,
                              "y": 1087
                            },
                            {
                              "x": 1112,
                              "y": 1086
                            }
                          ]
                        },
                        "confidence": 0.95481604,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1156,
                              "y": 970
                            },
                            {
                              "x": 1201,
                              "y": 971
                            },
                            {
                              "x": 1198,
                              "y": 1088
                            },
                            {
                              "x": 1153,
                              "y": 1087
                            }
                          ]
                        },
                        "confidence": 0.97825277,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "n"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1242,
                          "y": 972
                        },
                        {
                          "x": 1638,
                          "y": 982
                        },
                        {
                          "x": 1635,
                          "y": 1100
                        },
                        {
                          "x": 1239,
                          "y": 1090
                        }
                      ]
                    },
                    "confidence": 0.96663976,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1242,
                              "y": 972
                            },
                            {
                              "x": 1290,
                              "y": 973
                            },
                            {
                              "x": 1287,
                              "y": 1090
                            },
                            {
                              "x": 1239,
                              "y": 1089
                            }
                          ]
                        },
                        "confidence": 0.98346674,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1285,
                              "y": 973
                            },
                            {
                              "x": 1330,
                              "y": 974
                            },
                            {
                              "x": 1327,
                              "y": 1091
                            },
                            {
                              "x": 1282,
                              "y": 1090
                            }
                          ]
                        },
                        "confidence": 0.9944822,
                        "text": "h"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1330,
                              "y": 974
                            },
                            {
                              "x": 1376,
                              "y": 975
                            },
                            {
                              "x": 1373,
                              "y": 1092
                            },
                            {
                              "x": 1327,
                              "y": 1091
                            }
                          ]
                        },
                        "confidence": 0.9879396,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1372,
                              "y": 976
                            },
                            {
                              "x": 1420,
                              "y": 977
                            },
                            {
                              "x": 1417,
                              "y": 1094
                            },
                            {
                              "x": 1369,
                              "y": 1093
                            }
                          ]
                        },
                        "confidence": 0.9638511,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1419,
                              "y": 977
                            },
                            {
                              "x": 1471,
                              "y": 978
                            },
                            {
                              "x": 1468,
                              "y": 1095
                            },
                            {
                              "x": 1416,
                              "y": 1094
                            }
                          ]
                        },
                        "confidence": 0.9302447,
                        "text": "l"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1453,
                              "y": 978
                            },
                            {
                              "x": 1503,
                              "y": 979
                            },
                            {
                              "x": 1500,
                              "y": 1096
                            },
                            {
                              "x": 1450,
                              "y": 1095
                            }
                          ]
                        },
                        "confidence": 0.907275,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1498,
                              "y": 979
                            },
                            {
                              "x": 1538,
                              "y": 980
                            },
                            {
                              "x": 1535,
                              "y": 1097
                            },
                            {
                              "x": 1495,
                              "y": 1096
                            }
                          ]
                        },
                        "confidence": 0.97486097,
                        "text": "t"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1542,
                              "y": 980
                            },
                            {
                              "x": 1581,
                              "y": 981
                            },
                            {
                              "x": 1578,
                              "y": 1098
                            },
                            {
                              "x": 1539,
                              "y": 1097
                            }
                          ]
                        },
                        "confidence": 0.9727376,
                        "text": "t"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1584,
                              "y": 981
                            },
                            {
                              "x": 1638,
                              "y": 982
                            },
                            {
                              "x": 1635,
                              "y": 1099
                            },
                            {
                              "x": 1581,
                              "y": 1098
                            }
                          ]
                        },
                        "confidence": 0.98489976,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "e"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1661,
                          "y": 983
                        },
                        {
                          "x": 1754,
                          "y": 985
                        },
                        {
                          "x": 1751,
                          "y": 1102
                        },
                        {
                          "x": 1658,
                          "y": 1100
                        }
                      ]
                    },
                    "confidence": 0.9863093,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1661,
                              "y": 983
                            },
                            {
                              "x": 1709,
                              "y": 984
                            },
                            {
                              "x": 1706,
                              "y": 1101
                            },
                            {
                              "x": 1658,
                              "y": 1100
                            }
                          ]
                        },
                        "confidence": 0.98791003,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1708,
                              "y": 984
                            },
                            {
                              "x": 1754,
                              "y": 985
                            },
                            {
                              "x": 1751,
                              "y": 1102
                            },
                            {
                              "x": 1705,
                              "y": 1101
                            }
                          ]
                        },
                        "confidence": 0.98470855,
                        "text": "p"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1760,
                          "y": 985
                        },
                        {
                          "x": 1787,
                          "y": 986
                        },
                        {
                          "x": 1784,
                          "y": 1103
                        },
                        {
                          "x": 1757,
                          "y": 1102
                        }
                      ]
                    },
                    "confidence": 0.96852463,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1760,
                              "y": 985
                            },
                            {
                              "x": 1787,
                              "y": 986
                            },
                            {
                              "x": 1784,
                              "y": 1103
                            },
                            {
                              "x": 1757,
                              "y": 1102
                            }
                          ]
                        },
                        "confidence": 0.96852463,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "."
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1832,
                          "y": 987
                        },
                        {
                          "x": 1886,
                          "y": 988
                        },
                        {
                          "x": 1883,
                          "y": 1105
                        },
                        {
                          "x": 1829,
                          "y": 1104
                        }
                      ]
                    },
                    "confidence": 0.84777683,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1832,
                              "y": 987
                            },
                            {
                              "x": 1886,
                              "y": 988
                            },
                            {
                              "x": 1883,
                              "y": 1105
                            },
                            {
                              "x": 1829,
                              "y": 1104
                            }
                          ]
                        },
                        "confidence": 0.84777683,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "z"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1917,
                          "y": 989
                        },
                        {
                          "x": 2057,
                          "y": 993
                        },
                        {
                          "x": 2054,
                          "y": 1111
                        },
                        {
                          "x": 1914,
                          "y": 1107
                        }
                      ]
                    },
                    "confidence": 0.6896955,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1917,
                              "y": 989
                            },
                            {
                              "x": 1967,
                              "y": 990
                            },
                            {
                              "x": 1964,
                              "y": 1107
                            },
                            {
                              "x": 1914,
                              "y": 1106
                            }
                          ]
                        },
                        "confidence": 0.6494972,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1978,
                              "y": 991
                            },
                            {
                              "x": 2000,
                              "y": 992
                            },
                            {
                              "x": 1997,
                              "y": 1109
                            },
                            {
                              "x": 1975,
                              "y": 1108
                            }
                          ]
                        },
                        "confidence": 0.8967629,
                        "text": "."
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2005,
                              "y": 992
                            },
                            {
                              "x": 2057,
                              "y": 993
                            },
                            {
                              "x": 2054,
                              "y": 1110
                            },
                            {
                              "x": 2002,
                              "y": 1109
                            }
                          ]
                        },
                        "confidence": 0.52282625,
                        "text": "0"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2062,
                          "y": 993
                        },
                        {
                          "x": 2086,
                          "y": 994
                        },
                        {
                          "x": 2083,
                          "y": 1111
                        },
                        {
                          "x": 2059,
                          "y": 1110
                        }
                      ]
                    },
                    "confidence": 0.87495977,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2062,
                              "y": 993
                            },
                            {
                              "x": 2086,
                              "y": 994
                            },
                            {
                              "x": 2083,
                              "y": 1111
                            },
                            {
                              "x": 2059,
                              "y": 1110
                            }
                          ]
                        },
                        "confidence": 0.87495977,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "."
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1193,
                          "y": 1101
                        },
                        {
                          "x": 1290,
                          "y": 1101
                        },
                        {
                          "x": 1290,
                          "y": 1199
                        },
                        {
                          "x": 1193,
                          "y": 1199
                        }
                      ]
                    },
                    "confidence": 0.76213044,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1193,
                              "y": 1101
                            },
                            {
                              "x": 1243,
                              "y": 1101
                            },
                            {
                              "x": 1243,
                              "y": 1199
                            },
                            {
                              "x": 1193,
                              "y": 1199
                            }
                          ]
                        },
                        "confidence": 0.78393096,
                        "text": "u"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1244,
                              "y": 1101
                            },
                            {
                              "x": 1290,
                              "y": 1101
                            },
                            {
                              "x": 1290,
                              "y": 1199
                            },
                            {
                              "x": 1244,
                              "y": 1199
                            }
                          ]
                        },
                        "confidence": 0.7403299,
                        "text": "l"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1289,
                          "y": 1101
                        },
                        {
                          "x": 1318,
                          "y": 1101
                        },
                        {
                          "x": 1318,
                          "y": 1199
                        },
                        {
                          "x": 1289,
                          "y": 1199
                        }
                      ]
                    },
                    "confidence": 0.90356994,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1289,
                              "y": 1101
                            },
                            {
                              "x": 1318,
                              "y": 1101
                            },
                            {
                              "x": 1318,
                              "y": 1199
                            },
                            {
                              "x": 1289,
                              "y": 1199
                            }
                          ]
                        },
                        "confidence": 0.90356994,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "."
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1361,
                          "y": 1101
                        },
                        {
                          "x": 1625,
                          "y": 1102
                        },
                        {
                          "x": 1625,
                          "y": 1201
                        },
                        {
                          "x": 1361,
                          "y": 1200
                        }
                      ]
                    },
                    "confidence": 0.8861983,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1361,
                              "y": 1101
                            },
                            {
                              "x": 1417,
                              "y": 1101
                            },
                            {
                              "x": 1417,
                              "y": 1199
                            },
                            {
                              "x": 1361,
                              "y": 1199
                            }
                          ]
                        },
                        "confidence": 0.86961156,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1420,
                              "y": 1102
                            },
                            {
                              "x": 1448,
                              "y": 1102
                            },
                            {
                              "x": 1448,
                              "y": 1200
                            },
                            {
                              "x": 1420,
                              "y": 1200
                            }
                          ]
                        },
                        "confidence": 0.86351657,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1454,
                              "y": 1102
                            },
                            {
                              "x": 1501,
                              "y": 1102
                            },
                            {
                              "x": 1501,
                              "y": 1200
                            },
                            {
                              "x": 1454,
                              "y": 1200
                            }
                          ]
                        },
                        "confidence": 0.6903843,
                        "text": "ę"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1495,
                              "y": 1102
                            },
                            {
                              "x": 1542,
                              "y": 1102
                            },
                            {
                              "x": 1542,
                              "y": 1200
                            },
                            {
                              "x": 1495,
                              "y": 1200
                            }
                          ]
                        },
                        "confidence": 0.96818084,
                        "text": "k"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1538,
                              "y": 1102
                            },
                            {
                              "x": 1581,
                              "y": 1102
                            },
                            {
                              "x": 1581,
                              "y": 1200
                            },
                            {
                              "x": 1538,
                              "y": 1200
                            }
                          ]
                        },
                        "confidence": 0.96182257,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1579,
                              "y": 1102
                            },
                            {
                              "x": 1625,
                              "y": 1102
                            },
                            {
                              "x": 1625,
                              "y": 1200
                            },
                            {
                              "x": 1579,
                              "y": 1200
                            }
                          ]
                        },
                        "confidence": 0.963674,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "a"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1667,
                          "y": 1103
                        },
                        {
                          "x": 1800,
                          "y": 1104
                        },
                        {
                          "x": 1800,
                          "y": 1202
                        },
                        {
                          "x": 1667,
                          "y": 1201
                        }
                      ]
                    },
                    "confidence": 0.90966344,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1667,
                              "y": 1103
                            },
                            {
                              "x": 1704,
                              "y": 1103
                            },
                            {
                              "x": 1704,
                              "y": 1201
                            },
                            {
                              "x": 1667,
                              "y": 1201
                            }
                          ]
                        },
                        "confidence": 0.9728535,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1710,
                              "y": 1103
                            },
                            {
                              "x": 1749,
                              "y": 1103
                            },
                            {
                              "x": 1749,
                              "y": 1201
                            },
                            {
                              "x": 1710,
                              "y": 1201
                            }
                          ]
                        },
                        "confidence": 0.97304404,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1748,
                              "y": 1103
                            },
                            {
                              "x": 1800,
                              "y": 1103
                            },
                            {
                              "x": 1800,
                              "y": 1201
                            },
                            {
                              "x": 1748,
                              "y": 1201
                            }
                          ]
                        },
                        "confidence": 0.7830928,
                        "text": "B"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1796,
                          "y": 1103
                        },
                        {
                          "x": 1842,
                          "y": 1103
                        },
                        {
                          "x": 1842,
                          "y": 1201
                        },
                        {
                          "x": 1796,
                          "y": 1201
                        }
                      ]
                    },
                    "confidence": 0.97114575,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1796,
                              "y": 1103
                            },
                            {
                              "x": 1842,
                              "y": 1103
                            },
                            {
                              "x": 1842,
                              "y": 1201
                            },
                            {
                              "x": 1796,
                              "y": 1201
                            }
                          ]
                        },
                        "confidence": 0.97114575,
                        "text": "/"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1832,
                          "y": 1104
                        },
                        {
                          "x": 1884,
                          "y": 1104
                        },
                        {
                          "x": 1884,
                          "y": 1202
                        },
                        {
                          "x": 1832,
                          "y": 1202
                        }
                      ]
                    },
                    "confidence": 0.97453105,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1832,
                              "y": 1104
                            },
                            {
                              "x": 1884,
                              "y": 1104
                            },
                            {
                              "x": 1884,
                              "y": 1202
                            },
                            {
                              "x": 1832,
                              "y": 1202
                            }
                          ]
                        },
                        "confidence": 0.97453105,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "2"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1199,
                          "y": 1214
                        },
                        {
                          "x": 1456,
                          "y": 1217
                        },
                        {
                          "x": 1455,
                          "y": 1308
                        },
                        {
                          "x": 1198,
                          "y": 1305
                        }
                      ]
                    },
                    "confidence": 0.9848126,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1199,
                              "y": 1215
                            },
                            {
                              "x": 1244,
                              "y": 1216
                            },
                            {
                              "x": 1243,
                              "y": 1306
                            },
                            {
                              "x": 1198,
                              "y": 1305
                            }
                          ]
                        },
                        "confidence": 0.9775007,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1241,
                              "y": 1215
                            },
                            {
                              "x": 1295,
                              "y": 1216
                            },
                            {
                              "x": 1294,
                              "y": 1306
                            },
                            {
                              "x": 1240,
                              "y": 1305
                            }
                          ]
                        },
                        "confidence": 0.96498084,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1287,
                              "y": 1216
                            },
                            {
                              "x": 1330,
                              "y": 1217
                            },
                            {
                              "x": 1329,
                              "y": 1307
                            },
                            {
                              "x": 1286,
                              "y": 1306
                            }
                          ]
                        },
                        "confidence": 0.9872893,
                        "text": "-"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1325,
                              "y": 1216
                            },
                            {
                              "x": 1373,
                              "y": 1217
                            },
                            {
                              "x": 1372,
                              "y": 1307
                            },
                            {
                              "x": 1324,
                              "y": 1306
                            }
                          ]
                        },
                        "confidence": 0.9946479,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1364,
                              "y": 1217
                            },
                            {
                              "x": 1415,
                              "y": 1218
                            },
                            {
                              "x": 1414,
                              "y": 1308
                            },
                            {
                              "x": 1363,
                              "y": 1307
                            }
                          ]
                        },
                        "confidence": 0.9916813,
                        "text": "4"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1409,
                              "y": 1217
                            },
                            {
                              "x": 1456,
                              "y": 1218
                            },
                            {
                              "x": 1455,
                              "y": 1308
                            },
                            {
                              "x": 1408,
                              "y": 1307
                            }
                          ]
                        },
                        "confidence": 0.99277586,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "9"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1492,
                          "y": 1218
                        },
                        {
                          "x": 1836,
                          "y": 1222
                        },
                        {
                          "x": 1835,
                          "y": 1313
                        },
                        {
                          "x": 1491,
                          "y": 1309
                        }
                      ]
                    },
                    "confidence": 0.931905,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1492,
                              "y": 1218
                            },
                            {
                              "x": 1535,
                              "y": 1219
                            },
                            {
                              "x": 1534,
                              "y": 1309
                            },
                            {
                              "x": 1491,
                              "y": 1308
                            }
                          ]
                        },
                        "confidence": 0.6458211,
                        "text": "W"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1538,
                              "y": 1219
                            },
                            {
                              "x": 1581,
                              "y": 1220
                            },
                            {
                              "x": 1580,
                              "y": 1310
                            },
                            {
                              "x": 1537,
                              "y": 1309
                            }
                          ]
                        },
                        "confidence": 0.9358091,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1577,
                              "y": 1219
                            },
                            {
                              "x": 1623,
                              "y": 1220
                            },
                            {
                              "x": 1622,
                              "y": 1310
                            },
                            {
                              "x": 1576,
                              "y": 1309
                            }
                          ]
                        },
                        "confidence": 0.9400124,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1620,
                              "y": 1220
                            },
                            {
                              "x": 1668,
                              "y": 1221
                            },
                            {
                              "x": 1667,
                              "y": 1311
                            },
                            {
                              "x": 1619,
                              "y": 1310
                            }
                          ]
                        },
                        "confidence": 0.9765449,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1664,
                              "y": 1220
                            },
                            {
                              "x": 1711,
                              "y": 1221
                            },
                            {
                              "x": 1710,
                              "y": 1311
                            },
                            {
                              "x": 1663,
                              "y": 1310
                            }
                          ]
                        },
                        "confidence": 0.9822842,
                        "text": "z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1707,
                              "y": 1221
                            },
                            {
                              "x": 1747,
                              "y": 1222
                            },
                            {
                              "x": 1746,
                              "y": 1312
                            },
                            {
                              "x": 1706,
                              "y": 1311
                            }
                          ]
                        },
                        "confidence": 0.9921711,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1752,
                              "y": 1222
                            },
                            {
                              "x": 1794,
                              "y": 1223
                            },
                            {
                              "x": 1793,
                              "y": 1313
                            },
                            {
                              "x": 1751,
                              "y": 1312
                            }
                          ]
                        },
                        "confidence": 0.98999476,
                        "text": "w"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1793,
                              "y": 1222
                            },
                            {
                              "x": 1836,
                              "y": 1223
                            },
                            {
                              "x": 1835,
                              "y": 1313
                            },
                            {
                              "x": 1792,
                              "y": 1312
                            }
                          ]
                        },
                        "confidence": 0.9926022,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "a"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 670,
                  "y": 1289
                },
                {
                  "x": 1289,
                  "y": 1321
                },
                {
                  "x": 1284,
                  "y": 1416
                },
                {
                  "x": 665,
                  "y": 1384
                }
              ]
            },
            "confidence": 0.99266165,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 670,
                      "y": 1289
                    },
                    {
                      "x": 1289,
                      "y": 1321
                    },
                    {
                      "x": 1284,
                      "y": 1416
                    },
                    {
                      "x": 665,
                      "y": 1384
                    }
                  ]
                },
                "confidence": 0.99266165,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 670,
                          "y": 1289
                        },
                        {
                          "x": 804,
                          "y": 1296
                        },
                        {
                          "x": 799,
                          "y": 1391
                        },
                        {
                          "x": 665,
                          "y": 1384
                        }
                      ]
                    },
                    "confidence": 0.9763198,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 670,
                              "y": 1290
                            },
                            {
                              "x": 721,
                              "y": 1293
                            },
                            {
                              "x": 716,
                              "y": 1386
                            },
                            {
                              "x": 665,
                              "y": 1384
                            }
                          ]
                        },
                        "confidence": 0.973863,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 724,
                              "y": 1292
                            },
                            {
                              "x": 756,
                              "y": 1294
                            },
                            {
                              "x": 751,
                              "y": 1388
                            },
                            {
                              "x": 719,
                              "y": 1386
                            }
                          ]
                        },
                        "confidence": 0.9727614,
                        "text": "I"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 763,
                              "y": 1294
                            },
                            {
                              "x": 804,
                              "y": 1296
                            },
                            {
                              "x": 799,
                              "y": 1390
                            },
                            {
                              "x": 758,
                              "y": 1388
                            }
                          ]
                        },
                        "confidence": 0.982335,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "P"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 847,
                          "y": 1298
                        },
                        {
                          "x": 1289,
                          "y": 1321
                        },
                        {
                          "x": 1285,
                          "y": 1416
                        },
                        {
                          "x": 842,
                          "y": 1393
                        }
                      ]
                    },
                    "confidence": 0.99756426,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 847,
                              "y": 1299
                            },
                            {
                              "x": 894,
                              "y": 1301
                            },
                            {
                              "x": 889,
                              "y": 1395
                            },
                            {
                              "x": 842,
                              "y": 1393
                            }
                          ]
                        },
                        "confidence": 0.99693066,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 894,
                              "y": 1301
                            },
                            {
                              "x": 945,
                              "y": 1304
                            },
                            {
                              "x": 940,
                              "y": 1397
                            },
                            {
                              "x": 889,
                              "y": 1395
                            }
                          ]
                        },
                        "confidence": 0.9963295,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 941,
                              "y": 1303
                            },
                            {
                              "x": 981,
                              "y": 1305
                            },
                            {
                              "x": 976,
                              "y": 1399
                            },
                            {
                              "x": 936,
                              "y": 1397
                            }
                          ]
                        },
                        "confidence": 0.9994476,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 980,
                              "y": 1305
                            },
                            {
                              "x": 1033,
                              "y": 1308
                            },
                            {
                              "x": 1028,
                              "y": 1402
                            },
                            {
                              "x": 975,
                              "y": 1399
                            }
                          ]
                        },
                        "confidence": 0.9992301,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1024,
                              "y": 1308
                            },
                            {
                              "x": 1079,
                              "y": 1311
                            },
                            {
                              "x": 1074,
                              "y": 1405
                            },
                            {
                              "x": 1019,
                              "y": 1402
                            }
                          ]
                        },
                        "confidence": 0.9992942,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1066,
                              "y": 1310
                            },
                            {
                              "x": 1113,
                              "y": 1312
                            },
                            {
                              "x": 1108,
                              "y": 1406
                            },
                            {
                              "x": 1061,
                              "y": 1404
                            }
                          ]
                        },
                        "confidence": 0.9989698,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1115,
                              "y": 1312
                            },
                            {
                              "x": 1157,
                              "y": 1314
                            },
                            {
                              "x": 1152,
                              "y": 1408
                            },
                            {
                              "x": 1110,
                              "y": 1406
                            }
                          ]
                        },
                        "confidence": 0.99868006,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1155,
                              "y": 1314
                            },
                            {
                              "x": 1201,
                              "y": 1316
                            },
                            {
                              "x": 1196,
                              "y": 1410
                            },
                            {
                              "x": 1150,
                              "y": 1408
                            }
                          ]
                        },
                        "confidence": 0.9979191,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1200,
                              "y": 1317
                            },
                            {
                              "x": 1243,
                              "y": 1319
                            },
                            {
                              "x": 1238,
                              "y": 1413
                            },
                            {
                              "x": 1195,
                              "y": 1411
                            }
                          ]
                        },
                        "confidence": 0.9973111,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1239,
                              "y": 1319
                            },
                            {
                              "x": 1289,
                              "y": 1322
                            },
                            {
                              "x": 1284,
                              "y": 1415
                            },
                            {
                              "x": 1234,
                              "y": 1413
                            }
                          ]
                        },
                        "confidence": 0.9915303,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 2042,
                  "y": 1319
                },
                {
                  "x": 2414,
                  "y": 1291
                },
                {
                  "x": 2420,
                  "y": 1379
                },
                {
                  "x": 2049,
                  "y": 1407
                }
              ]
            },
            "confidence": 0.9712405,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 2042,
                      "y": 1319
                    },
                    {
                      "x": 2414,
                      "y": 1291
                    },
                    {
                      "x": 2420,
                      "y": 1379
                    },
                    {
                      "x": 2049,
                      "y": 1407
                    }
                  ]
                },
                "confidence": 0.9712405,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2042,
                          "y": 1319
                        },
                        {
                          "x": 2155,
                          "y": 1311
                        },
                        {
                          "x": 2161,
                          "y": 1398
                        },
                        {
                          "x": 2049,
                          "y": 1407
                        }
                      ]
                    },
                    "confidence": 0.921283,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "ro"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2042,
                              "y": 1320
                            },
                            {
                              "x": 2098,
                              "y": 1316
                            },
                            {
                              "x": 2104,
                              "y": 1403
                            },
                            {
                              "x": 2048,
                              "y": 1407
                            }
                          ]
                        },
                        "confidence": 0.9264493,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2089,
                              "y": 1316
                            },
                            {
                              "x": 2155,
                              "y": 1311
                            },
                            {
                              "x": 2161,
                              "y": 1398
                            },
                            {
                              "x": 2095,
                              "y": 1403
                            }
                          ]
                        },
                        "confidence": 0.9161167,
                        "text": "r"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2139,
                          "y": 1312
                        },
                        {
                          "x": 2188,
                          "y": 1308
                        },
                        {
                          "x": 2194,
                          "y": 1395
                        },
                        {
                          "x": 2145,
                          "y": 1399
                        }
                      ]
                    },
                    "confidence": 0.9678615,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "ro"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2139,
                              "y": 1312
                            },
                            {
                              "x": 2188,
                              "y": 1308
                            },
                            {
                              "x": 2194,
                              "y": 1395
                            },
                            {
                              "x": 2145,
                              "y": 1399
                            }
                          ]
                        },
                        "confidence": 0.9678615,
                        "text": ":"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2178,
                          "y": 1309
                        },
                        {
                          "x": 2414,
                          "y": 1291
                        },
                        {
                          "x": 2421,
                          "y": 1378
                        },
                        {
                          "x": 2184,
                          "y": 1396
                        }
                      ]
                    },
                    "confidence": 0.9918994,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "ro"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2178,
                              "y": 1309
                            },
                            {
                              "x": 2229,
                              "y": 1305
                            },
                            {
                              "x": 2235,
                              "y": 1392
                            },
                            {
                              "x": 2184,
                              "y": 1396
                            }
                          ]
                        },
                        "confidence": 0.98126435,
                        "text": "9"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2221,
                              "y": 1306
                            },
                            {
                              "x": 2283,
                              "y": 1301
                            },
                            {
                              "x": 2289,
                              "y": 1388
                            },
                            {
                              "x": 2227,
                              "y": 1393
                            }
                          ]
                        },
                        "confidence": 0.99549365,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2265,
                              "y": 1303
                            },
                            {
                              "x": 2331,
                              "y": 1298
                            },
                            {
                              "x": 2337,
                              "y": 1385
                            },
                            {
                              "x": 2271,
                              "y": 1390
                            }
                          ]
                        },
                        "confidence": 0.99614424,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2314,
                              "y": 1299
                            },
                            {
                              "x": 2368,
                              "y": 1295
                            },
                            {
                              "x": 2374,
                              "y": 1382
                            },
                            {
                              "x": 2320,
                              "y": 1386
                            }
                          ]
                        },
                        "confidence": 0.9954227,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2355,
                              "y": 1296
                            },
                            {
                              "x": 2415,
                              "y": 1292
                            },
                            {
                              "x": 2421,
                              "y": 1378
                            },
                            {
                              "x": 2361,
                              "y": 1383
                            }
                          ]
                        },
                        "confidence": 0.99117184,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "5"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 665,
                  "y": 1406
                },
                {
                  "x": 2226,
                  "y": 1421
                },
                {
                  "x": 2218,
                  "y": 2250
                },
                {
                  "x": 657,
                  "y": 2235
                }
              ]
            },
            "confidence": 0.96103114,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 855,
                      "y": 1421
                    },
                    {
                      "x": 2225,
                      "y": 1421
                    },
                    {
                      "x": 2225,
                      "y": 1528
                    },
                    {
                      "x": 855,
                      "y": 1528
                    }
                  ]
                },
                "confidence": 0.96755403,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 855,
                          "y": 1421
                        },
                        {
                          "x": 1441,
                          "y": 1421
                        },
                        {
                          "x": 1441,
                          "y": 1528
                        },
                        {
                          "x": 855,
                          "y": 1528
                        }
                      ]
                    },
                    "confidence": 0.9399788,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 855,
                              "y": 1421
                            },
                            {
                              "x": 932,
                              "y": 1421
                            },
                            {
                              "x": 932,
                              "y": 1528
                            },
                            {
                              "x": 855,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9639809,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 941,
                              "y": 1421
                            },
                            {
                              "x": 1015,
                              "y": 1421
                            },
                            {
                              "x": 1015,
                              "y": 1528
                            },
                            {
                              "x": 941,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9304104,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1028,
                              "y": 1421
                            },
                            {
                              "x": 1106,
                              "y": 1421
                            },
                            {
                              "x": 1106,
                              "y": 1528
                            },
                            {
                              "x": 1028,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.92936313,
                        "text": "R"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1115,
                              "y": 1421
                            },
                            {
                              "x": 1189,
                              "y": 1421
                            },
                            {
                              "x": 1189,
                              "y": 1528
                            },
                            {
                              "x": 1115,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.93213314,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1199,
                              "y": 1421
                            },
                            {
                              "x": 1271,
                              "y": 1421
                            },
                            {
                              "x": 1271,
                              "y": 1528
                            },
                            {
                              "x": 1199,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9078981,
                        "text": "G"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1288,
                              "y": 1421
                            },
                            {
                              "x": 1356,
                              "y": 1421
                            },
                            {
                              "x": 1356,
                              "y": 1528
                            },
                            {
                              "x": 1288,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9486009,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1369,
                              "y": 1421
                            },
                            {
                              "x": 1441,
                              "y": 1421
                            },
                            {
                              "x": 1441,
                              "y": 1528
                            },
                            {
                              "x": 1369,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9674649,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "N"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1540,
                          "y": 1421
                        },
                        {
                          "x": 2225,
                          "y": 1421
                        },
                        {
                          "x": 2225,
                          "y": 1528
                        },
                        {
                          "x": 1540,
                          "y": 1528
                        }
                      ]
                    },
                    "confidence": 0.99168235,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1540,
                              "y": 1421
                            },
                            {
                              "x": 1614,
                              "y": 1421
                            },
                            {
                              "x": 1614,
                              "y": 1528
                            },
                            {
                              "x": 1540,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9932358,
                        "text": "F"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1629,
                              "y": 1421
                            },
                            {
                              "x": 1691,
                              "y": 1421
                            },
                            {
                              "x": 1691,
                              "y": 1528
                            },
                            {
                              "x": 1629,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.99671793,
                        "text": "I"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1707,
                              "y": 1421
                            },
                            {
                              "x": 1785,
                              "y": 1421
                            },
                            {
                              "x": 1785,
                              "y": 1528
                            },
                            {
                              "x": 1707,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9944654,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1791,
                              "y": 1421
                            },
                            {
                              "x": 1867,
                              "y": 1421
                            },
                            {
                              "x": 1867,
                              "y": 1528
                            },
                            {
                              "x": 1791,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.99259084,
                        "text": "K"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1875,
                              "y": 1421
                            },
                            {
                              "x": 1954,
                              "y": 1421
                            },
                            {
                              "x": 1954,
                              "y": 1528
                            },
                            {
                              "x": 1875,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9916368,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1963,
                              "y": 1421
                            },
                            {
                              "x": 2039,
                              "y": 1421
                            },
                            {
                              "x": 2039,
                              "y": 1528
                            },
                            {
                              "x": 1963,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.9920153,
                        "text": "L"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2047,
                              "y": 1421
                            },
                            {
                              "x": 2125,
                              "y": 1421
                            },
                            {
                              "x": 2125,
                              "y": 1528
                            },
                            {
                              "x": 2047,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.99124295,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2139,
                              "y": 1421
                            },
                            {
                              "x": 2225,
                              "y": 1421
                            },
                            {
                              "x": 2225,
                              "y": 1528
                            },
                            {
                              "x": 2139,
                              "y": 1528
                            }
                          ]
                        },
                        "confidence": 0.98155355,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "Y"
                      }
                    ]
                  }
                ]
              },
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 670,
                      "y": 1523
                    },
                    {
                      "x": 1542,
                      "y": 1543
                    },
                    {
                      "x": 1532,
                      "y": 1984
                    },
                    {
                      "x": 660,
                      "y": 1964
                    }
                  ]
                },
                "confidence": 0.95604056,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 671,
                          "y": 1523
                        },
                        {
                          "x": 1068,
                          "y": 1537
                        },
                        {
                          "x": 1065,
                          "y": 1629
                        },
                        {
                          "x": 668,
                          "y": 1615
                        }
                      ]
                    },
                    "confidence": 0.955736,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 671,
                              "y": 1524
                            },
                            {
                              "x": 718,
                              "y": 1526
                            },
                            {
                              "x": 715,
                              "y": 1617
                            },
                            {
                              "x": 668,
                              "y": 1615
                            }
                          ]
                        },
                        "confidence": 0.9190527,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 716,
                              "y": 1525
                            },
                            {
                              "x": 762,
                              "y": 1527
                            },
                            {
                              "x": 759,
                              "y": 1618
                            },
                            {
                              "x": 713,
                              "y": 1616
                            }
                          ]
                        },
                        "confidence": 0.9266143,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 762,
                              "y": 1527
                            },
                            {
                              "x": 805,
                              "y": 1529
                            },
                            {
                              "x": 802,
                              "y": 1619
                            },
                            {
                              "x": 759,
                              "y": 1618
                            }
                          ]
                        },
                        "confidence": 0.9665265,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 814,
                              "y": 1529
                            },
                            {
                              "x": 846,
                              "y": 1530
                            },
                            {
                              "x": 843,
                              "y": 1621
                            },
                            {
                              "x": 811,
                              "y": 1620
                            }
                          ]
                        },
                        "confidence": 0.98348236,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 850,
                              "y": 1530
                            },
                            {
                              "x": 893,
                              "y": 1532
                            },
                            {
                              "x": 890,
                              "y": 1622
                            },
                            {
                              "x": 847,
                              "y": 1621
                            }
                          ]
                        },
                        "confidence": 0.98969483,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 895,
                              "y": 1531
                            },
                            {
                              "x": 940,
                              "y": 1533
                            },
                            {
                              "x": 937,
                              "y": 1624
                            },
                            {
                              "x": 892,
                              "y": 1622
                            }
                          ]
                        },
                        "confidence": 0.95787305,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 939,
                              "y": 1533
                            },
                            {
                              "x": 981,
                              "y": 1534
                            },
                            {
                              "x": 978,
                              "y": 1625
                            },
                            {
                              "x": 936,
                              "y": 1624
                            }
                          ]
                        },
                        "confidence": 0.93375534,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 984,
                              "y": 1534
                            },
                            {
                              "x": 1026,
                              "y": 1535
                            },
                            {
                              "x": 1023,
                              "y": 1626
                            },
                            {
                              "x": 981,
                              "y": 1625
                            }
                          ]
                        },
                        "confidence": 0.9452538,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1027,
                              "y": 1536
                            },
                            {
                              "x": 1068,
                              "y": 1537
                            },
                            {
                              "x": 1065,
                              "y": 1628
                            },
                            {
                              "x": 1024,
                              "y": 1627
                            }
                          ]
                        },
                        "confidence": 0.979371,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "t"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1111,
                          "y": 1538
                        },
                        {
                          "x": 1452,
                          "y": 1550
                        },
                        {
                          "x": 1449,
                          "y": 1642
                        },
                        {
                          "x": 1108,
                          "y": 1630
                        }
                      ]
                    },
                    "confidence": 0.93624187,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "fr"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1111,
                              "y": 1539
                            },
                            {
                              "x": 1153,
                              "y": 1540
                            },
                            {
                              "x": 1150,
                              "y": 1631
                            },
                            {
                              "x": 1108,
                              "y": 1630
                            }
                          ]
                        },
                        "confidence": 0.9668229,
                        "text": "F"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1157,
                              "y": 1541
                            },
                            {
                              "x": 1200,
                              "y": 1543
                            },
                            {
                              "x": 1197,
                              "y": 1633
                            },
                            {
                              "x": 1154,
                              "y": 1632
                            }
                          ]
                        },
                        "confidence": 0.98245066,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1190,
                              "y": 1542
                            },
                            {
                              "x": 1238,
                              "y": 1544
                            },
                            {
                              "x": 1235,
                              "y": 1635
                            },
                            {
                              "x": 1187,
                              "y": 1633
                            }
                          ]
                        },
                        "confidence": 0.9002026,
                        "text": "u"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1240,
                              "y": 1543
                            },
                            {
                              "x": 1280,
                              "y": 1544
                            },
                            {
                              "x": 1277,
                              "y": 1635
                            },
                            {
                              "x": 1237,
                              "y": 1634
                            }
                          ]
                        },
                        "confidence": 0.9004762,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1284,
                              "y": 1545
                            },
                            {
                              "x": 1322,
                              "y": 1546
                            },
                            {
                              "x": 1319,
                              "y": 1637
                            },
                            {
                              "x": 1281,
                              "y": 1636
                            }
                          ]
                        },
                        "confidence": 0.9397203,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1324,
                              "y": 1546
                            },
                            {
                              "x": 1376,
                              "y": 1548
                            },
                            {
                              "x": 1373,
                              "y": 1639
                            },
                            {
                              "x": 1321,
                              "y": 1637
                            }
                          ]
                        },
                        "confidence": 0.92560863,
                        "text": "e"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1374,
                              "y": 1548
                            },
                            {
                              "x": 1401,
                              "y": 1549
                            },
                            {
                              "x": 1398,
                              "y": 1640
                            },
                            {
                              "x": 1371,
                              "y": 1639
                            }
                          ]
                        },
                        "confidence": 0.9112575,
                        "text": "."
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1409,
                              "y": 1549
                            },
                            {
                              "x": 1452,
                              "y": 1551
                            },
                            {
                              "x": 1449,
                              "y": 1641
                            },
                            {
                              "x": 1406,
                              "y": 1640
                            }
                          ]
                        },
                        "confidence": 0.9633963,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "B"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 673,
                          "y": 1638
                        },
                        {
                          "x": 760,
                          "y": 1640
                        },
                        {
                          "x": 758,
                          "y": 1733
                        },
                        {
                          "x": 671,
                          "y": 1731
                        }
                      ]
                    },
                    "confidence": 0.9744185,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 673,
                              "y": 1639
                            },
                            {
                              "x": 720,
                              "y": 1640
                            },
                            {
                              "x": 718,
                              "y": 1732
                            },
                            {
                              "x": 671,
                              "y": 1731
                            }
                          ]
                        },
                        "confidence": 0.97835714,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 710,
                              "y": 1639
                            },
                            {
                              "x": 760,
                              "y": 1640
                            },
                            {
                              "x": 758,
                              "y": 1732
                            },
                            {
                              "x": 708,
                              "y": 1731
                            }
                          ]
                        },
                        "confidence": 0.9704799,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "H"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 806,
                          "y": 1642
                        },
                        {
                          "x": 1112,
                          "y": 1650
                        },
                        {
                          "x": 1109,
                          "y": 1742
                        },
                        {
                          "x": 804,
                          "y": 1734
                        }
                      ]
                    },
                    "confidence": 0.96716815,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 806,
                              "y": 1642
                            },
                            {
                              "x": 853,
                              "y": 1643
                            },
                            {
                              "x": 851,
                              "y": 1735
                            },
                            {
                              "x": 804,
                              "y": 1734
                            }
                          ]
                        },
                        "confidence": 0.9746321,
                        "text": "L"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 850,
                              "y": 1643
                            },
                            {
                              "x": 894,
                              "y": 1644
                            },
                            {
                              "x": 892,
                              "y": 1736
                            },
                            {
                              "x": 848,
                              "y": 1735
                            }
                          ]
                        },
                        "confidence": 0.96180683,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 897,
                              "y": 1644
                            },
                            {
                              "x": 938,
                              "y": 1645
                            },
                            {
                              "x": 936,
                              "y": 1737
                            },
                            {
                              "x": 895,
                              "y": 1736
                            }
                          ]
                        },
                        "confidence": 0.9491847,
                        "text": "V"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 941,
                              "y": 1646
                            },
                            {
                              "x": 984,
                              "y": 1647
                            },
                            {
                              "x": 982,
                              "y": 1739
                            },
                            {
                              "x": 939,
                              "y": 1738
                            }
                          ]
                        },
                        "confidence": 0.95436543,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 982,
                              "y": 1647
                            },
                            {
                              "x": 1027,
                              "y": 1648
                            },
                            {
                              "x": 1025,
                              "y": 1740
                            },
                            {
                              "x": 980,
                              "y": 1739
                            }
                          ]
                        },
                        "confidence": 0.9739607,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1027,
                              "y": 1648
                            },
                            {
                              "x": 1069,
                              "y": 1649
                            },
                            {
                              "x": 1067,
                              "y": 1741
                            },
                            {
                              "x": 1025,
                              "y": 1740
                            }
                          ]
                        },
                        "confidence": 0.9721031,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1073,
                              "y": 1649
                            },
                            {
                              "x": 1112,
                              "y": 1650
                            },
                            {
                              "x": 1110,
                              "y": 1742
                            },
                            {
                              "x": 1071,
                              "y": 1741
                            }
                          ]
                        },
                        "confidence": 0.98412406,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "E"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1157,
                          "y": 1651
                        },
                        {
                          "x": 1452,
                          "y": 1659
                        },
                        {
                          "x": 1449,
                          "y": 1752
                        },
                        {
                          "x": 1155,
                          "y": 1744
                        }
                      ]
                    },
                    "confidence": 0.95958,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1157,
                              "y": 1651
                            },
                            {
                              "x": 1198,
                              "y": 1652
                            },
                            {
                              "x": 1196,
                              "y": 1744
                            },
                            {
                              "x": 1155,
                              "y": 1743
                            }
                          ]
                        },
                        "confidence": 0.9731186,
                        "text": "R"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1199,
                              "y": 1652
                            },
                            {
                              "x": 1240,
                              "y": 1653
                            },
                            {
                              "x": 1238,
                              "y": 1745
                            },
                            {
                              "x": 1197,
                              "y": 1744
                            }
                          ]
                        },
                        "confidence": 0.948886,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1241,
                              "y": 1654
                            },
                            {
                              "x": 1284,
                              "y": 1655
                            },
                            {
                              "x": 1282,
                              "y": 1747
                            },
                            {
                              "x": 1239,
                              "y": 1746
                            }
                          ]
                        },
                        "confidence": 0.91476583,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1286,
                              "y": 1655
                            },
                            {
                              "x": 1323,
                              "y": 1656
                            },
                            {
                              "x": 1321,
                              "y": 1748
                            },
                            {
                              "x": 1284,
                              "y": 1747
                            }
                          ]
                        },
                        "confidence": 0.9486637,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1325,
                              "y": 1656
                            },
                            {
                              "x": 1367,
                              "y": 1657
                            },
                            {
                              "x": 1365,
                              "y": 1749
                            },
                            {
                              "x": 1323,
                              "y": 1748
                            }
                          ]
                        },
                        "confidence": 0.99142754,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1378,
                              "y": 1657
                            },
                            {
                              "x": 1402,
                              "y": 1658
                            },
                            {
                              "x": 1400,
                              "y": 1750
                            },
                            {
                              "x": 1376,
                              "y": 1749
                            }
                          ]
                        },
                        "confidence": 0.94811815,
                        "text": "."
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1406,
                              "y": 1658
                            },
                            {
                              "x": 1452,
                              "y": 1659
                            },
                            {
                              "x": 1450,
                              "y": 1751
                            },
                            {
                              "x": 1404,
                              "y": 1750
                            }
                          ]
                        },
                        "confidence": 0.9920802,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 672,
                          "y": 1751
                        },
                        {
                          "x": 859,
                          "y": 1752
                        },
                        {
                          "x": 859,
                          "y": 1856
                        },
                        {
                          "x": 672,
                          "y": 1855
                        }
                      ]
                    },
                    "confidence": 0.93371534,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 672,
                              "y": 1752
                            },
                            {
                              "x": 721,
                              "y": 1752
                            },
                            {
                              "x": 721,
                              "y": 1855
                            },
                            {
                              "x": 672,
                              "y": 1855
                            }
                          ]
                        },
                        "confidence": 0.90596104,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 724,
                              "y": 1752
                            },
                            {
                              "x": 751,
                              "y": 1752
                            },
                            {
                              "x": 751,
                              "y": 1855
                            },
                            {
                              "x": 724,
                              "y": 1855
                            }
                          ]
                        },
                        "confidence": 0.9037591,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 758,
                              "y": 1752
                            },
                            {
                              "x": 807,
                              "y": 1752
                            },
                            {
                              "x": 807,
                              "y": 1855
                            },
                            {
                              "x": 758,
                              "y": 1855
                            }
                          ]
                        },
                        "confidence": 0.94751275,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 806,
                              "y": 1752
                            },
                            {
                              "x": 859,
                              "y": 1752
                            },
                            {
                              "x": 859,
                              "y": 1855
                            },
                            {
                              "x": 806,
                              "y": 1855
                            }
                          ]
                        },
                        "confidence": 0.9776285,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "L"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 895,
                          "y": 1752
                        },
                        {
                          "x": 1240,
                          "y": 1753
                        },
                        {
                          "x": 1240,
                          "y": 1857
                        },
                        {
                          "x": 895,
                          "y": 1856
                        }
                      ]
                    },
                    "confidence": 0.9796876,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 895,
                              "y": 1752
                            },
                            {
                              "x": 945,
                              "y": 1752
                            },
                            {
                              "x": 945,
                              "y": 1855
                            },
                            {
                              "x": 895,
                              "y": 1855
                            }
                          ]
                        },
                        "confidence": 0.9735218,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 938,
                              "y": 1753
                            },
                            {
                              "x": 977,
                              "y": 1753
                            },
                            {
                              "x": 977,
                              "y": 1856
                            },
                            {
                              "x": 938,
                              "y": 1856
                            }
                          ]
                        },
                        "confidence": 0.97836316,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 982,
                              "y": 1753
                            },
                            {
                              "x": 1028,
                              "y": 1753
                            },
                            {
                              "x": 1028,
                              "y": 1856
                            },
                            {
                              "x": 982,
                              "y": 1856
                            }
                          ]
                        },
                        "confidence": 0.962145,
                        "text": "b"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1024,
                              "y": 1753
                            },
                            {
                              "x": 1073,
                              "y": 1753
                            },
                            {
                              "x": 1073,
                              "y": 1856
                            },
                            {
                              "x": 1024,
                              "y": 1856
                            }
                          ]
                        },
                        "confidence": 0.9835756,
                        "text": "e"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1070,
                              "y": 1753
                            },
                            {
                              "x": 1111,
                              "y": 1753
                            },
                            {
                              "x": 1111,
                              "y": 1856
                            },
                            {
                              "x": 1070,
                              "y": 1856
                            }
                          ]
                        },
                        "confidence": 0.9868439,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1111,
                              "y": 1753
                            },
                            {
                              "x": 1158,
                              "y": 1753
                            },
                            {
                              "x": 1158,
                              "y": 1856
                            },
                            {
                              "x": 1111,
                              "y": 1856
                            }
                          ]
                        },
                        "confidence": 0.98987263,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1158,
                              "y": 1753
                            },
                            {
                              "x": 1198,
                              "y": 1753
                            },
                            {
                              "x": 1198,
                              "y": 1856
                            },
                            {
                              "x": 1158,
                              "y": 1856
                            }
                          ]
                        },
                        "confidence": 0.97993666,
                        "text": "e"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1197,
                              "y": 1754
                            },
                            {
                              "x": 1240,
                              "y": 1754
                            },
                            {
                              "x": 1240,
                              "y": 1857
                            },
                            {
                              "x": 1197,
                              "y": 1857
                            }
                          ]
                        },
                        "confidence": 0.9832419,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "t"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1277,
                          "y": 1753
                        },
                        {
                          "x": 1535,
                          "y": 1754
                        },
                        {
                          "x": 1535,
                          "y": 1858
                        },
                        {
                          "x": 1277,
                          "y": 1857
                        }
                      ]
                    },
                    "confidence": 0.9681659,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1277,
                              "y": 1754
                            },
                            {
                              "x": 1324,
                              "y": 1754
                            },
                            {
                              "x": 1324,
                              "y": 1857
                            },
                            {
                              "x": 1277,
                              "y": 1857
                            }
                          ]
                        },
                        "confidence": 0.9815618,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1325,
                              "y": 1754
                            },
                            {
                              "x": 1363,
                              "y": 1754
                            },
                            {
                              "x": 1363,
                              "y": 1857
                            },
                            {
                              "x": 1325,
                              "y": 1857
                            }
                          ]
                        },
                        "confidence": 0.98325866,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1367,
                              "y": 1754
                            },
                            {
                              "x": 1408,
                              "y": 1754
                            },
                            {
                              "x": 1408,
                              "y": 1857
                            },
                            {
                              "x": 1367,
                              "y": 1857
                            }
                          ]
                        },
                        "confidence": 0.9556291,
                        "text": "u"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1413,
                              "y": 1754
                            },
                            {
                              "x": 1455,
                              "y": 1754
                            },
                            {
                              "x": 1455,
                              "y": 1857
                            },
                            {
                              "x": 1413,
                              "y": 1857
                            }
                          ]
                        },
                        "confidence": 0.9678523,
                        "text": "v"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1456,
                              "y": 1755
                            },
                            {
                              "x": 1479,
                              "y": 1755
                            },
                            {
                              "x": 1479,
                              "y": 1858
                            },
                            {
                              "x": 1456,
                              "y": 1858
                            }
                          ]
                        },
                        "confidence": 0.93685347,
                        "text": "."
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1491,
                              "y": 1755
                            },
                            {
                              "x": 1535,
                              "y": 1755
                            },
                            {
                              "x": 1535,
                              "y": 1858
                            },
                            {
                              "x": 1491,
                              "y": 1858
                            }
                          ]
                        },
                        "confidence": 0.98383987,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 669,
                          "y": 1859
                        },
                        {
                          "x": 1064,
                          "y": 1869
                        },
                        {
                          "x": 1061,
                          "y": 1972
                        },
                        {
                          "x": 666,
                          "y": 1962
                        }
                      ]
                    },
                    "confidence": 0.9588377,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 669,
                              "y": 1860
                            },
                            {
                              "x": 720,
                              "y": 1861
                            },
                            {
                              "x": 717,
                              "y": 1963
                            },
                            {
                              "x": 666,
                              "y": 1962
                            }
                          ]
                        },
                        "confidence": 0.9524784,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 714,
                              "y": 1861
                            },
                            {
                              "x": 759,
                              "y": 1862
                            },
                            {
                              "x": 756,
                              "y": 1964
                            },
                            {
                              "x": 711,
                              "y": 1963
                            }
                          ]
                        },
                        "confidence": 0.957736,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 760,
                              "y": 1862
                            },
                            {
                              "x": 805,
                              "y": 1863
                            },
                            {
                              "x": 802,
                              "y": 1965
                            },
                            {
                              "x": 757,
                              "y": 1964
                            }
                          ]
                        },
                        "confidence": 0.98080844,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 814,
                              "y": 1863
                            },
                            {
                              "x": 844,
                              "y": 1864
                            },
                            {
                              "x": 841,
                              "y": 1966
                            },
                            {
                              "x": 811,
                              "y": 1965
                            }
                          ]
                        },
                        "confidence": 0.9790373,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 850,
                              "y": 1864
                            },
                            {
                              "x": 893,
                              "y": 1865
                            },
                            {
                              "x": 890,
                              "y": 1967
                            },
                            {
                              "x": 847,
                              "y": 1966
                            }
                          ]
                        },
                        "confidence": 0.9787934,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 895,
                              "y": 1865
                            },
                            {
                              "x": 939,
                              "y": 1866
                            },
                            {
                              "x": 936,
                              "y": 1968
                            },
                            {
                              "x": 892,
                              "y": 1967
                            }
                          ]
                        },
                        "confidence": 0.9367784,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 940,
                              "y": 1866
                            },
                            {
                              "x": 978,
                              "y": 1867
                            },
                            {
                              "x": 975,
                              "y": 1969
                            },
                            {
                              "x": 937,
                              "y": 1968
                            }
                          ]
                        },
                        "confidence": 0.92105997,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 980,
                              "y": 1867
                            },
                            {
                              "x": 1019,
                              "y": 1868
                            },
                            {
                              "x": 1016,
                              "y": 1970
                            },
                            {
                              "x": 977,
                              "y": 1969
                            }
                          ]
                        },
                        "confidence": 0.953637,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1025,
                              "y": 1869
                            },
                            {
                              "x": 1064,
                              "y": 1870
                            },
                            {
                              "x": 1061,
                              "y": 1972
                            },
                            {
                              "x": 1022,
                              "y": 1971
                            }
                          ]
                        },
                        "confidence": 0.9692101,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "t"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1113,
                          "y": 1871
                        },
                        {
                          "x": 1531,
                          "y": 1882
                        },
                        {
                          "x": 1528,
                          "y": 1984
                        },
                        {
                          "x": 1110,
                          "y": 1973
                        }
                      ]
                    },
                    "confidence": 0.9384311,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1113,
                              "y": 1871
                            },
                            {
                              "x": 1151,
                              "y": 1872
                            },
                            {
                              "x": 1148,
                              "y": 1974
                            },
                            {
                              "x": 1110,
                              "y": 1973
                            }
                          ]
                        },
                        "confidence": 0.92714894,
                        "text": "m"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1158,
                              "y": 1872
                            },
                            {
                              "x": 1195,
                              "y": 1873
                            },
                            {
                              "x": 1192,
                              "y": 1975
                            },
                            {
                              "x": 1155,
                              "y": 1974
                            }
                          ]
                        },
                        "confidence": 0.97811747,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1204,
                              "y": 1873
                            },
                            {
                              "x": 1233,
                              "y": 1874
                            },
                            {
                              "x": 1230,
                              "y": 1976
                            },
                            {
                              "x": 1201,
                              "y": 1975
                            }
                          ]
                        },
                        "confidence": 0.9122644,
                        "text": "l"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1245,
                              "y": 1874
                            },
                            {
                              "x": 1274,
                              "y": 1875
                            },
                            {
                              "x": 1271,
                              "y": 1977
                            },
                            {
                              "x": 1242,
                              "y": 1976
                            }
                          ]
                        },
                        "confidence": 0.9247539,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1278,
                              "y": 1875
                            },
                            {
                              "x": 1318,
                              "y": 1876
                            },
                            {
                              "x": 1315,
                              "y": 1978
                            },
                            {
                              "x": 1275,
                              "y": 1977
                            }
                          ]
                        },
                        "confidence": 0.90135866,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1322,
                              "y": 1876
                            },
                            {
                              "x": 1363,
                              "y": 1877
                            },
                            {
                              "x": 1360,
                              "y": 1979
                            },
                            {
                              "x": 1319,
                              "y": 1978
                            }
                          ]
                        },
                        "confidence": 0.9469125,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1367,
                              "y": 1877
                            },
                            {
                              "x": 1405,
                              "y": 1878
                            },
                            {
                              "x": 1402,
                              "y": 1980
                            },
                            {
                              "x": 1364,
                              "y": 1979
                            }
                          ]
                        },
                        "confidence": 0.93044966,
                        "text": "w"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1406,
                              "y": 1878
                            },
                            {
                              "x": 1447,
                              "y": 1879
                            },
                            {
                              "x": 1444,
                              "y": 1981
                            },
                            {
                              "x": 1403,
                              "y": 1980
                            }
                          ]
                        },
                        "confidence": 0.95613176,
                        "text": "y"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1460,
                              "y": 1880
                            },
                            {
                              "x": 1488,
                              "y": 1881
                            },
                            {
                              "x": 1485,
                              "y": 1983
                            },
                            {
                              "x": 1457,
                              "y": 1982
                            }
                          ]
                        },
                        "confidence": 0.9212907,
                        "text": "."
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1490,
                              "y": 1881
                            },
                            {
                              "x": 1531,
                              "y": 1882
                            },
                            {
                              "x": 1528,
                              "y": 1984
                            },
                            {
                              "x": 1487,
                              "y": 1983
                            }
                          ]
                        },
                        "confidence": 0.98588276,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "B"
                      }
                    ]
                  }
                ]
              },
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 671,
                      "y": 2033
                    },
                    {
                      "x": 1652,
                      "y": 2039
                    },
                    {
                      "x": 1651,
                      "y": 2241
                    },
                    {
                      "x": 670,
                      "y": 2235
                    }
                  ]
                },
                "confidence": 0.9670192,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 672,
                          "y": 2033
                        },
                        {
                          "x": 1023,
                          "y": 2036
                        },
                        {
                          "x": 1022,
                          "y": 2125
                        },
                        {
                          "x": 671,
                          "y": 2122
                        }
                      ]
                    },
                    "confidence": 0.98170894,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 672,
                              "y": 2034
                            },
                            {
                              "x": 715,
                              "y": 2034
                            },
                            {
                              "x": 714,
                              "y": 2122
                            },
                            {
                              "x": 671,
                              "y": 2122
                            }
                          ]
                        },
                        "confidence": 0.9972772,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 718,
                              "y": 2034
                            },
                            {
                              "x": 758,
                              "y": 2034
                            },
                            {
                              "x": 757,
                              "y": 2122
                            },
                            {
                              "x": 717,
                              "y": 2122
                            }
                          ]
                        },
                        "confidence": 0.99823934,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 764,
                              "y": 2034
                            },
                            {
                              "x": 808,
                              "y": 2034
                            },
                            {
                              "x": 807,
                              "y": 2122
                            },
                            {
                              "x": 763,
                              "y": 2122
                            }
                          ]
                        },
                        "confidence": 0.99861485,
                        "text": "R"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 807,
                              "y": 2034
                            },
                            {
                              "x": 852,
                              "y": 2034
                            },
                            {
                              "x": 851,
                              "y": 2122
                            },
                            {
                              "x": 806,
                              "y": 2122
                            }
                          ]
                        },
                        "confidence": 0.99424076,
                        "text": "Z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 850,
                              "y": 2035
                            },
                            {
                              "x": 894,
                              "y": 2035
                            },
                            {
                              "x": 893,
                              "y": 2123
                            },
                            {
                              "x": 849,
                              "y": 2123
                            }
                          ]
                        },
                        "confidence": 0.9804136,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 893,
                              "y": 2035
                            },
                            {
                              "x": 939,
                              "y": 2035
                            },
                            {
                              "x": 938,
                              "y": 2123
                            },
                            {
                              "x": 892,
                              "y": 2123
                            }
                          ]
                        },
                        "confidence": 0.95039314,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 937,
                              "y": 2035
                            },
                            {
                              "x": 982,
                              "y": 2035
                            },
                            {
                              "x": 981,
                              "y": 2123
                            },
                            {
                              "x": 936,
                              "y": 2123
                            }
                          ]
                        },
                        "confidence": 0.9581127,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 982,
                              "y": 2036
                            },
                            {
                              "x": 1023,
                              "y": 2036
                            },
                            {
                              "x": 1022,
                              "y": 2124
                            },
                            {
                              "x": 981,
                              "y": 2124
                            }
                          ]
                        },
                        "confidence": 0.9763801,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "Z"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1067,
                          "y": 2036
                        },
                        {
                          "x": 1571,
                          "y": 2040
                        },
                        {
                          "x": 1570,
                          "y": 2129
                        },
                        {
                          "x": 1066,
                          "y": 2125
                        }
                      ]
                    },
                    "confidence": 0.98701674,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1067,
                              "y": 2036
                            },
                            {
                              "x": 1106,
                              "y": 2036
                            },
                            {
                              "x": 1105,
                              "y": 2124
                            },
                            {
                              "x": 1066,
                              "y": 2124
                            }
                          ]
                        },
                        "confidence": 0.99569356,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1110,
                              "y": 2037
                            },
                            {
                              "x": 1150,
                              "y": 2037
                            },
                            {
                              "x": 1149,
                              "y": 2125
                            },
                            {
                              "x": 1109,
                              "y": 2125
                            }
                          ]
                        },
                        "confidence": 0.99572957,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1154,
                              "y": 2037
                            },
                            {
                              "x": 1195,
                              "y": 2037
                            },
                            {
                              "x": 1194,
                              "y": 2125
                            },
                            {
                              "x": 1153,
                              "y": 2125
                            }
                          ]
                        },
                        "confidence": 0.98868716,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1197,
                              "y": 2037
                            },
                            {
                              "x": 1238,
                              "y": 2037
                            },
                            {
                              "x": 1237,
                              "y": 2125
                            },
                            {
                              "x": 1196,
                              "y": 2125
                            }
                          ]
                        },
                        "confidence": 0.9856998,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1239,
                              "y": 2038
                            },
                            {
                              "x": 1280,
                              "y": 2038
                            },
                            {
                              "x": 1279,
                              "y": 2126
                            },
                            {
                              "x": 1238,
                              "y": 2126
                            }
                          ]
                        },
                        "confidence": 0.9711968,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1281,
                              "y": 2038
                            },
                            {
                              "x": 1318,
                              "y": 2038
                            },
                            {
                              "x": 1317,
                              "y": 2126
                            },
                            {
                              "x": 1280,
                              "y": 2126
                            }
                          ]
                        },
                        "confidence": 0.98578,
                        "text": "T"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1321,
                              "y": 2038
                            },
                            {
                              "x": 1363,
                              "y": 2038
                            },
                            {
                              "x": 1362,
                              "y": 2126
                            },
                            {
                              "x": 1320,
                              "y": 2126
                            }
                          ]
                        },
                        "confidence": 0.9882723,
                        "text": "K"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1363,
                              "y": 2039
                            },
                            {
                              "x": 1402,
                              "y": 2039
                            },
                            {
                              "x": 1401,
                              "y": 2127
                            },
                            {
                              "x": 1362,
                              "y": 2127
                            }
                          ]
                        },
                        "confidence": 0.99250257,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1406,
                              "y": 2039
                            },
                            {
                              "x": 1451,
                              "y": 2039
                            },
                            {
                              "x": 1450,
                              "y": 2127
                            },
                            {
                              "x": 1405,
                              "y": 2127
                            }
                          ]
                        },
                        "confidence": 0.97074705,
                        "text": "W"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1448,
                              "y": 2039
                            },
                            {
                              "x": 1490,
                              "y": 2039
                            },
                            {
                              "x": 1489,
                              "y": 2127
                            },
                            {
                              "x": 1447,
                              "y": 2127
                            }
                          ]
                        },
                        "confidence": 0.99264675,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1490,
                              "y": 2040
                            },
                            {
                              "x": 1530,
                              "y": 2040
                            },
                            {
                              "x": 1529,
                              "y": 2128
                            },
                            {
                              "x": 1489,
                              "y": 2128
                            }
                          ]
                        },
                        "confidence": 0.9890072,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1532,
                              "y": 2040
                            },
                            {
                              "x": 1571,
                              "y": 2040
                            },
                            {
                              "x": 1570,
                              "y": 2128
                            },
                            {
                              "x": 1531,
                              "y": 2128
                            }
                          ]
                        },
                        "confidence": 0.9882382,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1612,
                          "y": 2040
                        },
                        {
                          "x": 1650,
                          "y": 2040
                        },
                        {
                          "x": 1649,
                          "y": 2128
                        },
                        {
                          "x": 1611,
                          "y": 2128
                        }
                      ]
                    },
                    "confidence": 0.981765,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1612,
                              "y": 2040
                            },
                            {
                              "x": 1650,
                              "y": 2040
                            },
                            {
                              "x": 1649,
                              "y": 2128
                            },
                            {
                              "x": 1611,
                              "y": 2128
                            }
                          ]
                        },
                        "confidence": 0.981765,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 670,
                          "y": 2144
                        },
                        {
                          "x": 1022,
                          "y": 2146
                        },
                        {
                          "x": 1022,
                          "y": 2237
                        },
                        {
                          "x": 670,
                          "y": 2235
                        }
                      ]
                    },
                    "confidence": 0.96675915,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 670,
                              "y": 2145
                            },
                            {
                              "x": 712,
                              "y": 2145
                            },
                            {
                              "x": 712,
                              "y": 2235
                            },
                            {
                              "x": 670,
                              "y": 2235
                            }
                          ]
                        },
                        "confidence": 0.95574373,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 715,
                              "y": 2145
                            },
                            {
                              "x": 755,
                              "y": 2145
                            },
                            {
                              "x": 755,
                              "y": 2235
                            },
                            {
                              "x": 715,
                              "y": 2235
                            }
                          ]
                        },
                        "confidence": 0.9603814,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 760,
                              "y": 2145
                            },
                            {
                              "x": 803,
                              "y": 2145
                            },
                            {
                              "x": 803,
                              "y": 2235
                            },
                            {
                              "x": 760,
                              "y": 2235
                            }
                          ]
                        },
                        "confidence": 0.9858731,
                        "text": "R"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 806,
                              "y": 2145
                            },
                            {
                              "x": 848,
                              "y": 2145
                            },
                            {
                              "x": 848,
                              "y": 2235
                            },
                            {
                              "x": 806,
                              "y": 2235
                            }
                          ]
                        },
                        "confidence": 0.9881924,
                        "text": "Z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 851,
                              "y": 2145
                            },
                            {
                              "x": 887,
                              "y": 2145
                            },
                            {
                              "x": 887,
                              "y": 2235
                            },
                            {
                              "x": 851,
                              "y": 2235
                            }
                          ]
                        },
                        "confidence": 0.9733072,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 893,
                              "y": 2146
                            },
                            {
                              "x": 936,
                              "y": 2146
                            },
                            {
                              "x": 936,
                              "y": 2236
                            },
                            {
                              "x": 893,
                              "y": 2236
                            }
                          ]
                        },
                        "confidence": 0.9442507,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 933,
                              "y": 2146
                            },
                            {
                              "x": 976,
                              "y": 2146
                            },
                            {
                              "x": 976,
                              "y": 2236
                            },
                            {
                              "x": 933,
                              "y": 2236
                            }
                          ]
                        },
                        "confidence": 0.9416381,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 982,
                              "y": 2146
                            },
                            {
                              "x": 1022,
                              "y": 2146
                            },
                            {
                              "x": 1022,
                              "y": 2236
                            },
                            {
                              "x": 982,
                              "y": 2236
                            }
                          ]
                        },
                        "confidence": 0.9846867,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "Z"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1067,
                          "y": 2146
                        },
                        {
                          "x": 1569,
                          "y": 2149
                        },
                        {
                          "x": 1569,
                          "y": 2240
                        },
                        {
                          "x": 1067,
                          "y": 2237
                        }
                      ]
                    },
                    "confidence": 0.9354928,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1067,
                              "y": 2147
                            },
                            {
                              "x": 1104,
                              "y": 2147
                            },
                            {
                              "x": 1104,
                              "y": 2237
                            },
                            {
                              "x": 1067,
                              "y": 2237
                            }
                          ]
                        },
                        "confidence": 0.9876137,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1108,
                              "y": 2147
                            },
                            {
                              "x": 1146,
                              "y": 2147
                            },
                            {
                              "x": 1146,
                              "y": 2237
                            },
                            {
                              "x": 1108,
                              "y": 2237
                            }
                          ]
                        },
                        "confidence": 0.9801556,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1151,
                              "y": 2147
                            },
                            {
                              "x": 1190,
                              "y": 2147
                            },
                            {
                              "x": 1190,
                              "y": 2237
                            },
                            {
                              "x": 1151,
                              "y": 2237
                            }
                          ]
                        },
                        "confidence": 0.90467376,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1192,
                              "y": 2147
                            },
                            {
                              "x": 1234,
                              "y": 2147
                            },
                            {
                              "x": 1234,
                              "y": 2237
                            },
                            {
                              "x": 1192,
                              "y": 2237
                            }
                          ]
                        },
                        "confidence": 0.9078698,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1232,
                              "y": 2148
                            },
                            {
                              "x": 1272,
                              "y": 2148
                            },
                            {
                              "x": 1272,
                              "y": 2238
                            },
                            {
                              "x": 1232,
                              "y": 2238
                            }
                          ]
                        },
                        "confidence": 0.9415835,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1278,
                              "y": 2148
                            },
                            {
                              "x": 1318,
                              "y": 2148
                            },
                            {
                              "x": 1318,
                              "y": 2238
                            },
                            {
                              "x": 1278,
                              "y": 2238
                            }
                          ]
                        },
                        "confidence": 0.9738743,
                        "text": "T"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1315,
                              "y": 2148
                            },
                            {
                              "x": 1361,
                              "y": 2148
                            },
                            {
                              "x": 1361,
                              "y": 2238
                            },
                            {
                              "x": 1315,
                              "y": 2238
                            }
                          ]
                        },
                        "confidence": 0.9732496,
                        "text": "K"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1363,
                              "y": 2148
                            },
                            {
                              "x": 1403,
                              "y": 2148
                            },
                            {
                              "x": 1403,
                              "y": 2238
                            },
                            {
                              "x": 1363,
                              "y": 2238
                            }
                          ]
                        },
                        "confidence": 0.952308,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1400,
                              "y": 2148
                            },
                            {
                              "x": 1443,
                              "y": 2148
                            },
                            {
                              "x": 1443,
                              "y": 2238
                            },
                            {
                              "x": 1400,
                              "y": 2238
                            }
                          ]
                        },
                        "confidence": 0.73986167,
                        "text": "W"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1444,
                              "y": 2149
                            },
                            {
                              "x": 1486,
                              "y": 2149
                            },
                            {
                              "x": 1486,
                              "y": 2239
                            },
                            {
                              "x": 1444,
                              "y": 2239
                            }
                          ]
                        },
                        "confidence": 0.95491487,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1487,
                              "y": 2149
                            },
                            {
                              "x": 1527,
                              "y": 2149
                            },
                            {
                              "x": 1527,
                              "y": 2239
                            },
                            {
                              "x": 1487,
                              "y": 2239
                            }
                          ]
                        },
                        "confidence": 0.93058944,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1527,
                              "y": 2149
                            },
                            {
                              "x": 1569,
                              "y": 2149
                            },
                            {
                              "x": 1569,
                              "y": 2239
                            },
                            {
                              "x": 1527,
                              "y": 2239
                            }
                          ]
                        },
                        "confidence": 0.97921985,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1611,
                          "y": 2150
                        },
                        {
                          "x": 1651,
                          "y": 2150
                        },
                        {
                          "x": 1651,
                          "y": 2240
                        },
                        {
                          "x": 1611,
                          "y": 2240
                        }
                      ]
                    },
                    "confidence": 0.9751806,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1611,
                              "y": 2150
                            },
                            {
                              "x": 1651,
                              "y": 2150
                            },
                            {
                              "x": 1651,
                              "y": 2240
                            },
                            {
                              "x": 1611,
                              "y": 2240
                            }
                          ]
                        },
                        "confidence": 0.9751806,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "B"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 671,
                  "y": 2257
                },
                {
                  "x": 1068,
                  "y": 2254
                },
                {
                  "x": 1069,
                  "y": 2341
                },
                {
                  "x": 672,
                  "y": 2344
                }
              ]
            },
            "confidence": 0.9830247,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 671,
                      "y": 2257
                    },
                    {
                      "x": 1068,
                      "y": 2254
                    },
                    {
                      "x": 1069,
                      "y": 2341
                    },
                    {
                      "x": 672,
                      "y": 2344
                    }
                  ]
                },
                "confidence": 0.9830247,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 671,
                          "y": 2257
                        },
                        {
                          "x": 801,
                          "y": 2256
                        },
                        {
                          "x": 802,
                          "y": 2343
                        },
                        {
                          "x": 672,
                          "y": 2344
                        }
                      ]
                    },
                    "confidence": 0.97453827,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 671,
                              "y": 2258
                            },
                            {
                              "x": 712,
                              "y": 2258
                            },
                            {
                              "x": 713,
                              "y": 2344
                            },
                            {
                              "x": 672,
                              "y": 2344
                            }
                          ]
                        },
                        "confidence": 0.9830405,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 712,
                              "y": 2257
                            },
                            {
                              "x": 758,
                              "y": 2257
                            },
                            {
                              "x": 759,
                              "y": 2343
                            },
                            {
                              "x": 713,
                              "y": 2343
                            }
                          ]
                        },
                        "confidence": 0.98087984,
                        "text": "T"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 758,
                              "y": 2257
                            },
                            {
                              "x": 801,
                              "y": 2257
                            },
                            {
                              "x": 802,
                              "y": 2343
                            },
                            {
                              "x": 759,
                              "y": 2343
                            }
                          ]
                        },
                        "confidence": 0.9596945,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "U"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 844,
                          "y": 2256
                        },
                        {
                          "x": 890,
                          "y": 2256
                        },
                        {
                          "x": 891,
                          "y": 2342
                        },
                        {
                          "x": 845,
                          "y": 2342
                        }
                      ]
                    },
                    "confidence": 0.9899142,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 844,
                              "y": 2256
                            },
                            {
                              "x": 890,
                              "y": 2256
                            },
                            {
                              "x": 891,
                              "y": 2342
                            },
                            {
                              "x": 845,
                              "y": 2342
                            }
                          ]
                        },
                        "confidence": 0.9899142,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 930,
                          "y": 2255
                        },
                        {
                          "x": 1019,
                          "y": 2254
                        },
                        {
                          "x": 1020,
                          "y": 2340
                        },
                        {
                          "x": 931,
                          "y": 2341
                        }
                      ]
                    },
                    "confidence": 0.99062383,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 930,
                              "y": 2255
                            },
                            {
                              "x": 977,
                              "y": 2255
                            },
                            {
                              "x": 978,
                              "y": 2341
                            },
                            {
                              "x": 931,
                              "y": 2341
                            }
                          ]
                        },
                        "confidence": 0.98755443,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 978,
                              "y": 2255
                            },
                            {
                              "x": 1019,
                              "y": 2255
                            },
                            {
                              "x": 1020,
                              "y": 2341
                            },
                            {
                              "x": 979,
                              "y": 2341
                            }
                          ]
                        },
                        "confidence": 0.99369323,
                        "text": "3"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1014,
                          "y": 2255
                        },
                        {
                          "x": 1068,
                          "y": 2255
                        },
                        {
                          "x": 1069,
                          "y": 2341
                        },
                        {
                          "x": 1015,
                          "y": 2341
                        }
                      ]
                    },
                    "confidence": 0.9863965,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1014,
                              "y": 2255
                            },
                            {
                              "x": 1068,
                              "y": 2255
                            },
                            {
                              "x": 1069,
                              "y": 2341
                            },
                            {
                              "x": 1015,
                              "y": 2341
                            }
                          ]
                        },
                        "confidence": 0.9863965,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "%"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1731,
                  "y": 1532
                },
                {
                  "x": 2405,
                  "y": 1516
                },
                {
                  "x": 2415,
                  "y": 1966
                },
                {
                  "x": 1742,
                  "y": 1982
                }
              ]
            },
            "confidence": 0.9742456,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1731,
                      "y": 1532
                    },
                    {
                      "x": 2405,
                      "y": 1516
                    },
                    {
                      "x": 2415,
                      "y": 1966
                    },
                    {
                      "x": 1742,
                      "y": 1982
                    }
                  ]
                },
                "confidence": 0.9742456,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1747,
                          "y": 1548
                        },
                        {
                          "x": 1786,
                          "y": 1546
                        },
                        {
                          "x": 1791,
                          "y": 1644
                        },
                        {
                          "x": 1752,
                          "y": 1646
                        }
                      ]
                    },
                    "confidence": 0.965669,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1747,
                              "y": 1548
                            },
                            {
                              "x": 1786,
                              "y": 1546
                            },
                            {
                              "x": 1791,
                              "y": 1644
                            },
                            {
                              "x": 1752,
                              "y": 1646
                            }
                          ]
                        },
                        "confidence": 0.965669,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "1"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1818,
                          "y": 1544
                        },
                        {
                          "x": 2090,
                          "y": 1531
                        },
                        {
                          "x": 2094,
                          "y": 1629
                        },
                        {
                          "x": 1823,
                          "y": 1642
                        }
                      ]
                    },
                    "confidence": 0.9785794,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1818,
                              "y": 1544
                            },
                            {
                              "x": 1873,
                              "y": 1541
                            },
                            {
                              "x": 1878,
                              "y": 1639
                            },
                            {
                              "x": 1823,
                              "y": 1642
                            }
                          ]
                        },
                        "confidence": 0.9620287,
                        "text": "x"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1876,
                              "y": 1541
                            },
                            {
                              "x": 1912,
                              "y": 1539
                            },
                            {
                              "x": 1917,
                              "y": 1637
                            },
                            {
                              "x": 1881,
                              "y": 1639
                            }
                          ]
                        },
                        "confidence": 0.98014265,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1913,
                              "y": 1540
                            },
                            {
                              "x": 1957,
                              "y": 1538
                            },
                            {
                              "x": 1962,
                              "y": 1636
                            },
                            {
                              "x": 1918,
                              "y": 1638
                            }
                          ]
                        },
                        "confidence": 0.9753425,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1962,
                              "y": 1537
                            },
                            {
                              "x": 1986,
                              "y": 1536
                            },
                            {
                              "x": 1991,
                              "y": 1634
                            },
                            {
                              "x": 1967,
                              "y": 1635
                            }
                          ]
                        },
                        "confidence": 0.97291136,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2001,
                              "y": 1535
                            },
                            {
                              "x": 2044,
                              "y": 1533
                            },
                            {
                              "x": 2049,
                              "y": 1631
                            },
                            {
                              "x": 2006,
                              "y": 1633
                            }
                          ]
                        },
                        "confidence": 0.9924284,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2046,
                              "y": 1533
                            },
                            {
                              "x": 2090,
                              "y": 1531
                            },
                            {
                              "x": 2095,
                              "y": 1629
                            },
                            {
                              "x": 2051,
                              "y": 1631
                            }
                          ]
                        },
                        "confidence": 0.9886228,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2138,
                          "y": 1529
                        },
                        {
                          "x": 2403,
                          "y": 1516
                        },
                        {
                          "x": 2407,
                          "y": 1614
                        },
                        {
                          "x": 2143,
                          "y": 1627
                        }
                      ]
                    },
                    "confidence": 0.96838,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2138,
                              "y": 1529
                            },
                            {
                              "x": 2171,
                              "y": 1527
                            },
                            {
                              "x": 2176,
                              "y": 1625
                            },
                            {
                              "x": 2143,
                              "y": 1627
                            }
                          ]
                        },
                        "confidence": 0.9849463,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2175,
                              "y": 1527
                            },
                            {
                              "x": 2220,
                              "y": 1525
                            },
                            {
                              "x": 2225,
                              "y": 1623
                            },
                            {
                              "x": 2180,
                              "y": 1625
                            }
                          ]
                        },
                        "confidence": 0.9946726,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2227,
                              "y": 1525
                            },
                            {
                              "x": 2251,
                              "y": 1524
                            },
                            {
                              "x": 2256,
                              "y": 1622
                            },
                            {
                              "x": 2232,
                              "y": 1623
                            }
                          ]
                        },
                        "confidence": 0.94075745,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2267,
                              "y": 1523
                            },
                            {
                              "x": 2309,
                              "y": 1521
                            },
                            {
                              "x": 2314,
                              "y": 1619
                            },
                            {
                              "x": 2272,
                              "y": 1621
                            }
                          ]
                        },
                        "confidence": 0.9638462,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2312,
                              "y": 1521
                            },
                            {
                              "x": 2356,
                              "y": 1519
                            },
                            {
                              "x": 2361,
                              "y": 1617
                            },
                            {
                              "x": 2317,
                              "y": 1619
                            }
                          ]
                        },
                        "confidence": 0.94062966,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2358,
                              "y": 1519
                            },
                            {
                              "x": 2403,
                              "y": 1517
                            },
                            {
                              "x": 2408,
                              "y": 1615
                            },
                            {
                              "x": 2363,
                              "y": 1617
                            }
                          ]
                        },
                        "confidence": 0.9854276,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "B"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1742,
                          "y": 1662
                        },
                        {
                          "x": 1787,
                          "y": 1660
                        },
                        {
                          "x": 1790,
                          "y": 1755
                        },
                        {
                          "x": 1745,
                          "y": 1757
                        }
                      ]
                    },
                    "confidence": 0.9650209,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1742,
                              "y": 1662
                            },
                            {
                              "x": 1787,
                              "y": 1660
                            },
                            {
                              "x": 1790,
                              "y": 1755
                            },
                            {
                              "x": 1745,
                              "y": 1757
                            }
                          ]
                        },
                        "confidence": 0.9650209,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "1"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1819,
                          "y": 1659
                        },
                        {
                          "x": 2092,
                          "y": 1650
                        },
                        {
                          "x": 2095,
                          "y": 1745
                        },
                        {
                          "x": 1822,
                          "y": 1754
                        }
                      ]
                    },
                    "confidence": 0.98698294,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1819,
                              "y": 1659
                            },
                            {
                              "x": 1879,
                              "y": 1657
                            },
                            {
                              "x": 1882,
                              "y": 1752
                            },
                            {
                              "x": 1822,
                              "y": 1754
                            }
                          ]
                        },
                        "confidence": 0.97402287,
                        "text": "x"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1872,
                              "y": 1657
                            },
                            {
                              "x": 1916,
                              "y": 1656
                            },
                            {
                              "x": 1919,
                              "y": 1750
                            },
                            {
                              "x": 1875,
                              "y": 1752
                            }
                          ]
                        },
                        "confidence": 0.99159956,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1915,
                              "y": 1656
                            },
                            {
                              "x": 1963,
                              "y": 1654
                            },
                            {
                              "x": 1966,
                              "y": 1749
                            },
                            {
                              "x": 1918,
                              "y": 1751
                            }
                          ]
                        },
                        "confidence": 0.993292,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1961,
                              "y": 1654
                            },
                            {
                              "x": 1988,
                              "y": 1653
                            },
                            {
                              "x": 1991,
                              "y": 1748
                            },
                            {
                              "x": 1964,
                              "y": 1749
                            }
                          ]
                        },
                        "confidence": 0.9794025,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1999,
                              "y": 1653
                            },
                            {
                              "x": 2045,
                              "y": 1651
                            },
                            {
                              "x": 2048,
                              "y": 1746
                            },
                            {
                              "x": 2002,
                              "y": 1748
                            }
                          ]
                        },
                        "confidence": 0.99306643,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2043,
                              "y": 1651
                            },
                            {
                              "x": 2092,
                              "y": 1649
                            },
                            {
                              "x": 2095,
                              "y": 1744
                            },
                            {
                              "x": 2046,
                              "y": 1746
                            }
                          ]
                        },
                        "confidence": 0.9905143,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2134,
                          "y": 1648
                        },
                        {
                          "x": 2405,
                          "y": 1639
                        },
                        {
                          "x": 2408,
                          "y": 1735
                        },
                        {
                          "x": 2137,
                          "y": 1744
                        }
                      ]
                    },
                    "confidence": 0.98549503,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2134,
                              "y": 1648
                            },
                            {
                              "x": 2175,
                              "y": 1647
                            },
                            {
                              "x": 2178,
                              "y": 1742
                            },
                            {
                              "x": 2137,
                              "y": 1743
                            }
                          ]
                        },
                        "confidence": 0.9874647,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2176,
                              "y": 1647
                            },
                            {
                              "x": 2226,
                              "y": 1645
                            },
                            {
                              "x": 2229,
                              "y": 1740
                            },
                            {
                              "x": 2179,
                              "y": 1742
                            }
                          ]
                        },
                        "confidence": 0.99448836,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2226,
                              "y": 1645
                            },
                            {
                              "x": 2251,
                              "y": 1644
                            },
                            {
                              "x": 2254,
                              "y": 1739
                            },
                            {
                              "x": 2229,
                              "y": 1740
                            }
                          ]
                        },
                        "confidence": 0.9780005,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2266,
                              "y": 1644
                            },
                            {
                              "x": 2311,
                              "y": 1642
                            },
                            {
                              "x": 2314,
                              "y": 1737
                            },
                            {
                              "x": 2269,
                              "y": 1739
                            }
                          ]
                        },
                        "confidence": 0.992247,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2314,
                              "y": 1642
                            },
                            {
                              "x": 2356,
                              "y": 1641
                            },
                            {
                              "x": 2359,
                              "y": 1736
                            },
                            {
                              "x": 2317,
                              "y": 1737
                            }
                          ]
                        },
                        "confidence": 0.96450216,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2359,
                              "y": 1641
                            },
                            {
                              "x": 2405,
                              "y": 1639
                            },
                            {
                              "x": 2408,
                              "y": 1734
                            },
                            {
                              "x": 2362,
                              "y": 1736
                            }
                          ]
                        },
                        "confidence": 0.9962674,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1739,
                          "y": 1756
                        },
                        {
                          "x": 1780,
                          "y": 1756
                        },
                        {
                          "x": 1780,
                          "y": 1859
                        },
                        {
                          "x": 1739,
                          "y": 1859
                        }
                      ]
                    },
                    "confidence": 0.985621,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1739,
                              "y": 1756
                            },
                            {
                              "x": 1780,
                              "y": 1756
                            },
                            {
                              "x": 1780,
                              "y": 1859
                            },
                            {
                              "x": 1739,
                              "y": 1859
                            }
                          ]
                        },
                        "confidence": 0.985621,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "1"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1825,
                          "y": 1756
                        },
                        {
                          "x": 2088,
                          "y": 1757
                        },
                        {
                          "x": 2088,
                          "y": 1861
                        },
                        {
                          "x": 1825,
                          "y": 1860
                        }
                      ]
                    },
                    "confidence": 0.9595002,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1825,
                              "y": 1756
                            },
                            {
                              "x": 1868,
                              "y": 1756
                            },
                            {
                              "x": 1868,
                              "y": 1859
                            },
                            {
                              "x": 1825,
                              "y": 1859
                            }
                          ]
                        },
                        "confidence": 0.91954374,
                        "text": "x"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1870,
                              "y": 1756
                            },
                            {
                              "x": 1918,
                              "y": 1756
                            },
                            {
                              "x": 1918,
                              "y": 1859
                            },
                            {
                              "x": 1870,
                              "y": 1859
                            }
                          ]
                        },
                        "confidence": 0.9836505,
                        "text": "4"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1915,
                              "y": 1757
                            },
                            {
                              "x": 1956,
                              "y": 1757
                            },
                            {
                              "x": 1956,
                              "y": 1860
                            },
                            {
                              "x": 1915,
                              "y": 1860
                            }
                          ]
                        },
                        "confidence": 0.9730237,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1967,
                              "y": 1757
                            },
                            {
                              "x": 1992,
                              "y": 1757
                            },
                            {
                              "x": 1992,
                              "y": 1860
                            },
                            {
                              "x": 1967,
                              "y": 1860
                            }
                          ]
                        },
                        "confidence": 0.93658066,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2001,
                              "y": 1757
                            },
                            {
                              "x": 2043,
                              "y": 1757
                            },
                            {
                              "x": 2043,
                              "y": 1860
                            },
                            {
                              "x": 2001,
                              "y": 1860
                            }
                          ]
                        },
                        "confidence": 0.98118955,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2043,
                              "y": 1757
                            },
                            {
                              "x": 2088,
                              "y": 1757
                            },
                            {
                              "x": 2088,
                              "y": 1860
                            },
                            {
                              "x": 2043,
                              "y": 1860
                            }
                          ]
                        },
                        "confidence": 0.9630132,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2127,
                          "y": 1757
                        },
                        {
                          "x": 2401,
                          "y": 1758
                        },
                        {
                          "x": 2401,
                          "y": 1862
                        },
                        {
                          "x": 2127,
                          "y": 1861
                        }
                      ]
                    },
                    "confidence": 0.97286046,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2127,
                              "y": 1757
                            },
                            {
                              "x": 2174,
                              "y": 1757
                            },
                            {
                              "x": 2174,
                              "y": 1860
                            },
                            {
                              "x": 2127,
                              "y": 1860
                            }
                          ]
                        },
                        "confidence": 0.9779846,
                        "text": "4"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2179,
                              "y": 1758
                            },
                            {
                              "x": 2223,
                              "y": 1758
                            },
                            {
                              "x": 2223,
                              "y": 1861
                            },
                            {
                              "x": 2179,
                              "y": 1861
                            }
                          ]
                        },
                        "confidence": 0.9904994,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2225,
                              "y": 1758
                            },
                            {
                              "x": 2252,
                              "y": 1758
                            },
                            {
                              "x": 2252,
                              "y": 1861
                            },
                            {
                              "x": 2225,
                              "y": 1861
                            }
                          ]
                        },
                        "confidence": 0.95086634,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2267,
                              "y": 1758
                            },
                            {
                              "x": 2312,
                              "y": 1758
                            },
                            {
                              "x": 2312,
                              "y": 1861
                            },
                            {
                              "x": 2267,
                              "y": 1861
                            }
                          ]
                        },
                        "confidence": 0.98811567,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2316,
                              "y": 1758
                            },
                            {
                              "x": 2356,
                              "y": 1758
                            },
                            {
                              "x": 2356,
                              "y": 1861
                            },
                            {
                              "x": 2316,
                              "y": 1861
                            }
                          ]
                        },
                        "confidence": 0.93628216,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2358,
                              "y": 1758
                            },
                            {
                              "x": 2401,
                              "y": 1758
                            },
                            {
                              "x": 2401,
                              "y": 1861
                            },
                            {
                              "x": 2358,
                              "y": 1861
                            }
                          ]
                        },
                        "confidence": 0.9934146,
                        "property": {
                          "detectedBreak": {
                            "type": "EOL_SURE_SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1828,
                          "y": 1883
                        },
                        {
                          "x": 1870,
                          "y": 1882
                        },
                        {
                          "x": 1872,
                          "y": 1976
                        },
                        {
                          "x": 1830,
                          "y": 1977
                        }
                      ]
                    },
                    "confidence": 0.9350579,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1828,
                              "y": 1883
                            },
                            {
                              "x": 1870,
                              "y": 1882
                            },
                            {
                              "x": 1872,
                              "y": 1976
                            },
                            {
                              "x": 1830,
                              "y": 1977
                            }
                          ]
                        },
                        "confidence": 0.9350579,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "1"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1900,
                          "y": 1881
                        },
                        {
                          "x": 2130,
                          "y": 1877
                        },
                        {
                          "x": 2132,
                          "y": 1972
                        },
                        {
                          "x": 1902,
                          "y": 1976
                        }
                      ]
                    },
                    "confidence": 0.9718015,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1900,
                              "y": 1881
                            },
                            {
                              "x": 1965,
                              "y": 1880
                            },
                            {
                              "x": 1967,
                              "y": 1974
                            },
                            {
                              "x": 1902,
                              "y": 1975
                            }
                          ]
                        },
                        "confidence": 0.93257177,
                        "text": "x"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1953,
                              "y": 1880
                            },
                            {
                              "x": 1999,
                              "y": 1879
                            },
                            {
                              "x": 2001,
                              "y": 1973
                            },
                            {
                              "x": 1955,
                              "y": 1974
                            }
                          ]
                        },
                        "confidence": 0.9956816,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2002,
                              "y": 1879
                            },
                            {
                              "x": 2027,
                              "y": 1879
                            },
                            {
                              "x": 2029,
                              "y": 1973
                            },
                            {
                              "x": 2004,
                              "y": 1973
                            }
                          ]
                        },
                        "confidence": 0.98303694,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2042,
                              "y": 1879
                            },
                            {
                              "x": 2084,
                              "y": 1878
                            },
                            {
                              "x": 2086,
                              "y": 1972
                            },
                            {
                              "x": 2044,
                              "y": 1973
                            }
                          ]
                        },
                        "confidence": 0.98074806,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2084,
                              "y": 1878
                            },
                            {
                              "x": 2130,
                              "y": 1877
                            },
                            {
                              "x": 2132,
                              "y": 1971
                            },
                            {
                              "x": 2086,
                              "y": 1972
                            }
                          ]
                        },
                        "confidence": 0.96696913,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2168,
                          "y": 1876
                        },
                        {
                          "x": 2401,
                          "y": 1872
                        },
                        {
                          "x": 2403,
                          "y": 1967
                        },
                        {
                          "x": 2170,
                          "y": 1971
                        }
                      ]
                    },
                    "confidence": 0.9782235,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2168,
                              "y": 1876
                            },
                            {
                              "x": 2215,
                              "y": 1875
                            },
                            {
                              "x": 2217,
                              "y": 1969
                            },
                            {
                              "x": 2170,
                              "y": 1970
                            }
                          ]
                        },
                        "confidence": 0.98510134,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2223,
                              "y": 1876
                            },
                            {
                              "x": 2246,
                              "y": 1876
                            },
                            {
                              "x": 2248,
                              "y": 1970
                            },
                            {
                              "x": 2225,
                              "y": 1970
                            }
                          ]
                        },
                        "confidence": 0.96974057,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2262,
                              "y": 1875
                            },
                            {
                              "x": 2308,
                              "y": 1874
                            },
                            {
                              "x": 2310,
                              "y": 1968
                            },
                            {
                              "x": 2264,
                              "y": 1969
                            }
                          ]
                        },
                        "confidence": 0.97753465,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2307,
                              "y": 1874
                            },
                            {
                              "x": 2354,
                              "y": 1873
                            },
                            {
                              "x": 2356,
                              "y": 1967
                            },
                            {
                              "x": 2309,
                              "y": 1968
                            }
                          ]
                        },
                        "confidence": 0.97148967,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2352,
                              "y": 1873
                            },
                            {
                              "x": 2401,
                              "y": 1872
                            },
                            {
                              "x": 2403,
                              "y": 1966
                            },
                            {
                              "x": 2354,
                              "y": 1967
                            }
                          ]
                        },
                        "confidence": 0.98725116,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "B"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 2169,
                  "y": 2046
                },
                {
                  "x": 2401,
                  "y": 2044
                },
                {
                  "x": 2402,
                  "y": 2143
                },
                {
                  "x": 2170,
                  "y": 2145
                }
              ]
            },
            "confidence": 0.9898259,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 2169,
                      "y": 2046
                    },
                    {
                      "x": 2401,
                      "y": 2044
                    },
                    {
                      "x": 2402,
                      "y": 2143
                    },
                    {
                      "x": 2170,
                      "y": 2145
                    }
                  ]
                },
                "confidence": 0.9898259,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2169,
                          "y": 2046
                        },
                        {
                          "x": 2401,
                          "y": 2044
                        },
                        {
                          "x": 2402,
                          "y": 2143
                        },
                        {
                          "x": 2170,
                          "y": 2145
                        }
                      ]
                    },
                    "confidence": 0.9898259,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2169,
                              "y": 2047
                            },
                            {
                              "x": 2218,
                              "y": 2046
                            },
                            {
                              "x": 2219,
                              "y": 2144
                            },
                            {
                              "x": 2170,
                              "y": 2145
                            }
                          ]
                        },
                        "confidence": 0.987929,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2212,
                              "y": 2046
                            },
                            {
                              "x": 2265,
                              "y": 2045
                            },
                            {
                              "x": 2266,
                              "y": 2143
                            },
                            {
                              "x": 2213,
                              "y": 2144
                            }
                          ]
                        },
                        "confidence": 0.994287,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2269,
                              "y": 2045
                            },
                            {
                              "x": 2299,
                              "y": 2045
                            },
                            {
                              "x": 2300,
                              "y": 2143
                            },
                            {
                              "x": 2270,
                              "y": 2143
                            }
                          ]
                        },
                        "confidence": 0.979908,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2307,
                              "y": 2045
                            },
                            {
                              "x": 2356,
                              "y": 2044
                            },
                            {
                              "x": 2357,
                              "y": 2142
                            },
                            {
                              "x": 2308,
                              "y": 2143
                            }
                          ]
                        },
                        "confidence": 0.9954669,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2353,
                              "y": 2045
                            },
                            {
                              "x": 2401,
                              "y": 2045
                            },
                            {
                              "x": 2402,
                              "y": 2143
                            },
                            {
                              "x": 2354,
                              "y": 2143
                            }
                          ]
                        },
                        "confidence": 0.9915385,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 2176,
                  "y": 2163
                },
                {
                  "x": 2398,
                  "y": 2162
                },
                {
                  "x": 2398,
                  "y": 2259
                },
                {
                  "x": 2176,
                  "y": 2260
                }
              ]
            },
            "confidence": 0.9555232,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 2176,
                      "y": 2163
                    },
                    {
                      "x": 2398,
                      "y": 2162
                    },
                    {
                      "x": 2398,
                      "y": 2259
                    },
                    {
                      "x": 2176,
                      "y": 2260
                    }
                  ]
                },
                "confidence": 0.9555232,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2176,
                          "y": 2163
                        },
                        {
                          "x": 2398,
                          "y": 2162
                        },
                        {
                          "x": 2398,
                          "y": 2259
                        },
                        {
                          "x": 2176,
                          "y": 2260
                        }
                      ]
                    },
                    "confidence": 0.9555232,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2176,
                              "y": 2164
                            },
                            {
                              "x": 2212,
                              "y": 2164
                            },
                            {
                              "x": 2212,
                              "y": 2260
                            },
                            {
                              "x": 2176,
                              "y": 2260
                            }
                          ]
                        },
                        "confidence": 0.9830638,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2214,
                              "y": 2163
                            },
                            {
                              "x": 2263,
                              "y": 2163
                            },
                            {
                              "x": 2263,
                              "y": 2259
                            },
                            {
                              "x": 2214,
                              "y": 2259
                            }
                          ]
                        },
                        "confidence": 0.990146,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2268,
                              "y": 2163
                            },
                            {
                              "x": 2294,
                              "y": 2163
                            },
                            {
                              "x": 2294,
                              "y": 2259
                            },
                            {
                              "x": 2268,
                              "y": 2259
                            }
                          ]
                        },
                        "confidence": 0.81751114,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2306,
                              "y": 2163
                            },
                            {
                              "x": 2352,
                              "y": 2163
                            },
                            {
                              "x": 2352,
                              "y": 2259
                            },
                            {
                              "x": 2306,
                              "y": 2259
                            }
                          ]
                        },
                        "confidence": 0.99679965,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2353,
                              "y": 2163
                            },
                            {
                              "x": 2398,
                              "y": 2163
                            },
                            {
                              "x": 2398,
                              "y": 2259
                            },
                            {
                              "x": 2353,
                              "y": 2259
                            }
                          ]
                        },
                        "confidence": 0.9900955,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 2174,
                  "y": 2281
                },
                {
                  "x": 2401,
                  "y": 2283
                },
                {
                  "x": 2400,
                  "y": 2378
                },
                {
                  "x": 2173,
                  "y": 2376
                }
              ]
            },
            "confidence": 0.9136982,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 2174,
                      "y": 2281
                    },
                    {
                      "x": 2401,
                      "y": 2283
                    },
                    {
                      "x": 2400,
                      "y": 2378
                    },
                    {
                      "x": 2173,
                      "y": 2376
                    }
                  ]
                },
                "confidence": 0.9136982,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2174,
                          "y": 2281
                        },
                        {
                          "x": 2401,
                          "y": 2283
                        },
                        {
                          "x": 2400,
                          "y": 2378
                        },
                        {
                          "x": 2173,
                          "y": 2376
                        }
                      ]
                    },
                    "confidence": 0.9136982,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2174,
                              "y": 2282
                            },
                            {
                              "x": 2210,
                              "y": 2282
                            },
                            {
                              "x": 2209,
                              "y": 2376
                            },
                            {
                              "x": 2173,
                              "y": 2376
                            }
                          ]
                        },
                        "confidence": 0.9857385,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2212,
                              "y": 2282
                            },
                            {
                              "x": 2268,
                              "y": 2282
                            },
                            {
                              "x": 2267,
                              "y": 2376
                            },
                            {
                              "x": 2211,
                              "y": 2376
                            }
                          ]
                        },
                        "confidence": 0.9853767,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2273,
                              "y": 2282
                            },
                            {
                              "x": 2300,
                              "y": 2282
                            },
                            {
                              "x": 2299,
                              "y": 2376
                            },
                            {
                              "x": 2272,
                              "y": 2376
                            }
                          ]
                        },
                        "confidence": 0.6156414,
                        "text": "."
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2301,
                              "y": 2283
                            },
                            {
                              "x": 2355,
                              "y": 2283
                            },
                            {
                              "x": 2354,
                              "y": 2377
                            },
                            {
                              "x": 2300,
                              "y": 2377
                            }
                          ]
                        },
                        "confidence": 0.9943528,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2353,
                              "y": 2283
                            },
                            {
                              "x": 2401,
                              "y": 2283
                            },
                            {
                              "x": 2400,
                              "y": 2377
                            },
                            {
                              "x": 2352,
                              "y": 2377
                            }
                          ]
                        },
                        "confidence": 0.98738146,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "8"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 670,
                  "y": 2370
                },
                {
                  "x": 1019,
                  "y": 2362
                },
                {
                  "x": 1021,
                  "y": 2451
                },
                {
                  "x": 672,
                  "y": 2459
                }
              ]
            },
            "confidence": 0.98592496,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 670,
                      "y": 2370
                    },
                    {
                      "x": 1019,
                      "y": 2362
                    },
                    {
                      "x": 1021,
                      "y": 2451
                    },
                    {
                      "x": 672,
                      "y": 2459
                    }
                  ]
                },
                "confidence": 0.98592496,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 670,
                          "y": 2370
                        },
                        {
                          "x": 801,
                          "y": 2367
                        },
                        {
                          "x": 803,
                          "y": 2456
                        },
                        {
                          "x": 672,
                          "y": 2459
                        }
                      ]
                    },
                    "confidence": 0.98693746,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 670,
                              "y": 2370
                            },
                            {
                              "x": 713,
                              "y": 2369
                            },
                            {
                              "x": 715,
                              "y": 2458
                            },
                            {
                              "x": 672,
                              "y": 2459
                            }
                          ]
                        },
                        "confidence": 0.97990686,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 710,
                              "y": 2369
                            },
                            {
                              "x": 755,
                              "y": 2368
                            },
                            {
                              "x": 757,
                              "y": 2457
                            },
                            {
                              "x": 712,
                              "y": 2458
                            }
                          ]
                        },
                        "confidence": 0.9890215,
                        "text": "T"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 757,
                              "y": 2368
                            },
                            {
                              "x": 801,
                              "y": 2367
                            },
                            {
                              "x": 803,
                              "y": 2456
                            },
                            {
                              "x": 759,
                              "y": 2457
                            }
                          ]
                        },
                        "confidence": 0.991884,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "U"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 845,
                          "y": 2366
                        },
                        {
                          "x": 890,
                          "y": 2365
                        },
                        {
                          "x": 892,
                          "y": 2454
                        },
                        {
                          "x": 847,
                          "y": 2455
                        }
                      ]
                    },
                    "confidence": 0.9941579,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 845,
                              "y": 2366
                            },
                            {
                              "x": 890,
                              "y": 2365
                            },
                            {
                              "x": 892,
                              "y": 2454
                            },
                            {
                              "x": 847,
                              "y": 2455
                            }
                          ]
                        },
                        "confidence": 0.9941579,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "B"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 928,
                          "y": 2364
                        },
                        {
                          "x": 967,
                          "y": 2363
                        },
                        {
                          "x": 969,
                          "y": 2452
                        },
                        {
                          "x": 930,
                          "y": 2453
                        }
                      ]
                    },
                    "confidence": 0.9886414,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 928,
                              "y": 2364
                            },
                            {
                              "x": 967,
                              "y": 2363
                            },
                            {
                              "x": 969,
                              "y": 2452
                            },
                            {
                              "x": 930,
                              "y": 2453
                            }
                          ]
                        },
                        "confidence": 0.9886414,
                        "text": "8"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 971,
                          "y": 2363
                        },
                        {
                          "x": 1019,
                          "y": 2362
                        },
                        {
                          "x": 1021,
                          "y": 2451
                        },
                        {
                          "x": 973,
                          "y": 2452
                        }
                      ]
                    },
                    "confidence": 0.97193825,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 971,
                              "y": 2363
                            },
                            {
                              "x": 1019,
                              "y": 2362
                            },
                            {
                              "x": 1021,
                              "y": 2451
                            },
                            {
                              "x": 973,
                              "y": 2452
                            }
                          ]
                        },
                        "confidence": 0.97193825,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "%"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 670,
                  "y": 2481
                },
                {
                  "x": 1011,
                  "y": 2476
                },
                {
                  "x": 1012,
                  "y": 2561
                },
                {
                  "x": 671,
                  "y": 2566
                }
              ]
            },
            "confidence": 0.9711923,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 670,
                      "y": 2481
                    },
                    {
                      "x": 1011,
                      "y": 2476
                    },
                    {
                      "x": 1012,
                      "y": 2561
                    },
                    {
                      "x": 671,
                      "y": 2566
                    }
                  ]
                },
                "confidence": 0.9711923,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 670,
                          "y": 2481
                        },
                        {
                          "x": 838,
                          "y": 2479
                        },
                        {
                          "x": 839,
                          "y": 2564
                        },
                        {
                          "x": 671,
                          "y": 2566
                        }
                      ]
                    },
                    "confidence": 0.97832096,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 670,
                              "y": 2482
                            },
                            {
                              "x": 710,
                              "y": 2481
                            },
                            {
                              "x": 711,
                              "y": 2565
                            },
                            {
                              "x": 671,
                              "y": 2566
                            }
                          ]
                        },
                        "confidence": 0.98385096,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 712,
                              "y": 2481
                            },
                            {
                              "x": 754,
                              "y": 2480
                            },
                            {
                              "x": 755,
                              "y": 2564
                            },
                            {
                              "x": 713,
                              "y": 2565
                            }
                          ]
                        },
                        "confidence": 0.9601499,
                        "text": "U"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 755,
                              "y": 2480
                            },
                            {
                              "x": 793,
                              "y": 2479
                            },
                            {
                              "x": 794,
                              "y": 2563
                            },
                            {
                              "x": 756,
                              "y": 2564
                            }
                          ]
                        },
                        "confidence": 0.9881377,
                        "text": "M"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 800,
                              "y": 2480
                            },
                            {
                              "x": 838,
                              "y": 2479
                            },
                            {
                              "x": 839,
                              "y": 2563
                            },
                            {
                              "x": 801,
                              "y": 2564
                            }
                          ]
                        },
                        "confidence": 0.98114526,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 886,
                          "y": 2478
                        },
                        {
                          "x": 1011,
                          "y": 2476
                        },
                        {
                          "x": 1012,
                          "y": 2561
                        },
                        {
                          "x": 887,
                          "y": 2563
                        }
                      ]
                    },
                    "confidence": 0.96168745,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 886,
                              "y": 2479
                            },
                            {
                              "x": 928,
                              "y": 2478
                            },
                            {
                              "x": 929,
                              "y": 2562
                            },
                            {
                              "x": 887,
                              "y": 2563
                            }
                          ]
                        },
                        "confidence": 0.97997606,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 929,
                              "y": 2478
                            },
                            {
                              "x": 970,
                              "y": 2477
                            },
                            {
                              "x": 971,
                              "y": 2561
                            },
                            {
                              "x": 930,
                              "y": 2562
                            }
                          ]
                        },
                        "confidence": 0.97829074,
                        "text": "T"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 974,
                              "y": 2477
                            },
                            {
                              "x": 1011,
                              "y": 2477
                            },
                            {
                              "x": 1012,
                              "y": 2560
                            },
                            {
                              "x": 975,
                              "y": 2561
                            }
                          ]
                        },
                        "confidence": 0.9267955,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "U"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 2215,
                  "y": 2400
                },
                {
                  "x": 2395,
                  "y": 2402
                },
                {
                  "x": 2394,
                  "y": 2499
                },
                {
                  "x": 2214,
                  "y": 2497
                }
              ]
            },
            "confidence": 0.9699812,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 2215,
                      "y": 2400
                    },
                    {
                      "x": 2395,
                      "y": 2402
                    },
                    {
                      "x": 2394,
                      "y": 2499
                    },
                    {
                      "x": 2214,
                      "y": 2497
                    }
                  ]
                },
                "confidence": 0.9699812,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2215,
                          "y": 2400
                        },
                        {
                          "x": 2395,
                          "y": 2402
                        },
                        {
                          "x": 2394,
                          "y": 2499
                        },
                        {
                          "x": 2214,
                          "y": 2497
                        }
                      ]
                    },
                    "confidence": 0.9699812,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2215,
                              "y": 2401
                            },
                            {
                              "x": 2258,
                              "y": 2401
                            },
                            {
                              "x": 2257,
                              "y": 2497
                            },
                            {
                              "x": 2214,
                              "y": 2497
                            }
                          ]
                        },
                        "confidence": 0.98781335,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2267,
                              "y": 2401
                            },
                            {
                              "x": 2297,
                              "y": 2401
                            },
                            {
                              "x": 2296,
                              "y": 2497
                            },
                            {
                              "x": 2266,
                              "y": 2497
                            }
                          ]
                        },
                        "confidence": 0.9155151,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2302,
                              "y": 2401
                            },
                            {
                              "x": 2349,
                              "y": 2401
                            },
                            {
                              "x": 2348,
                              "y": 2497
                            },
                            {
                              "x": 2301,
                              "y": 2497
                            }
                          ]
                        },
                        "confidence": 0.99419725,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2354,
                              "y": 2402
                            },
                            {
                              "x": 2395,
                              "y": 2402
                            },
                            {
                              "x": 2394,
                              "y": 2498
                            },
                            {
                              "x": 2353,
                              "y": 2498
                            }
                          ]
                        },
                        "confidence": 0.9823991,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "6"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 2171,
                  "y": 2516
                },
                {
                  "x": 2399,
                  "y": 2526
                },
                {
                  "x": 2395,
                  "y": 2621
                },
                {
                  "x": 2167,
                  "y": 2611
                }
              ]
            },
            "confidence": 0.9000248,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 2171,
                      "y": 2516
                    },
                    {
                      "x": 2399,
                      "y": 2526
                    },
                    {
                      "x": 2395,
                      "y": 2621
                    },
                    {
                      "x": 2167,
                      "y": 2611
                    }
                  ]
                },
                "confidence": 0.9000248,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2171,
                          "y": 2516
                        },
                        {
                          "x": 2399,
                          "y": 2526
                        },
                        {
                          "x": 2395,
                          "y": 2621
                        },
                        {
                          "x": 2167,
                          "y": 2611
                        }
                      ]
                    },
                    "confidence": 0.9000248,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2171,
                              "y": 2517
                            },
                            {
                              "x": 2208,
                              "y": 2519
                            },
                            {
                              "x": 2204,
                              "y": 2613
                            },
                            {
                              "x": 2167,
                              "y": 2611
                            }
                          ]
                        },
                        "confidence": 0.98439956,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2217,
                              "y": 2518
                            },
                            {
                              "x": 2272,
                              "y": 2520
                            },
                            {
                              "x": 2268,
                              "y": 2614
                            },
                            {
                              "x": 2213,
                              "y": 2612
                            }
                          ]
                        },
                        "confidence": 0.98748136,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2268,
                              "y": 2521
                            },
                            {
                              "x": 2306,
                              "y": 2523
                            },
                            {
                              "x": 2302,
                              "y": 2617
                            },
                            {
                              "x": 2264,
                              "y": 2615
                            }
                          ]
                        },
                        "confidence": 0.55265486,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2301,
                              "y": 2522
                            },
                            {
                              "x": 2351,
                              "y": 2524
                            },
                            {
                              "x": 2347,
                              "y": 2618
                            },
                            {
                              "x": 2297,
                              "y": 2616
                            }
                          ]
                        },
                        "confidence": 0.99128723,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2344,
                              "y": 2524
                            },
                            {
                              "x": 2399,
                              "y": 2526
                            },
                            {
                              "x": 2395,
                              "y": 2620
                            },
                            {
                              "x": 2340,
                              "y": 2618
                            }
                          ]
                        },
                        "confidence": 0.98430073,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "4"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 663,
                  "y": 2589
                },
                {
                  "x": 1546,
                  "y": 2575
                },
                {
                  "x": 1551,
                  "y": 2888
                },
                {
                  "x": 668,
                  "y": 2902
                }
              ]
            },
            "confidence": 0.95203,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 663,
                      "y": 2595
                    },
                    {
                      "x": 1341,
                      "y": 2578
                    },
                    {
                      "x": 1344,
                      "y": 2709
                    },
                    {
                      "x": 666,
                      "y": 2726
                    }
                  ]
                },
                "confidence": 0.9912707,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 663,
                          "y": 2595
                        },
                        {
                          "x": 1010,
                          "y": 2586
                        },
                        {
                          "x": 1013,
                          "y": 2717
                        },
                        {
                          "x": 666,
                          "y": 2726
                        }
                      ]
                    },
                    "confidence": 0.9941677,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "id"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 663,
                              "y": 2596
                            },
                            {
                              "x": 750,
                              "y": 2594
                            },
                            {
                              "x": 753,
                              "y": 2724
                            },
                            {
                              "x": 666,
                              "y": 2726
                            }
                          ]
                        },
                        "confidence": 0.99462336,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 754,
                              "y": 2593
                            },
                            {
                              "x": 837,
                              "y": 2591
                            },
                            {
                              "x": 840,
                              "y": 2721
                            },
                            {
                              "x": 757,
                              "y": 2723
                            }
                          ]
                        },
                        "confidence": 0.9953492,
                        "text": "U"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 837,
                              "y": 2591
                            },
                            {
                              "x": 917,
                              "y": 2589
                            },
                            {
                              "x": 920,
                              "y": 2719
                            },
                            {
                              "x": 840,
                              "y": 2721
                            }
                          ]
                        },
                        "confidence": 0.9943033,
                        "text": "M"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 927,
                              "y": 2589
                            },
                            {
                              "x": 1010,
                              "y": 2587
                            },
                            {
                              "x": 1013,
                              "y": 2717
                            },
                            {
                              "x": 930,
                              "y": 2719
                            }
                          ]
                        },
                        "confidence": 0.99239475,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1100,
                          "y": 2584
                        },
                        {
                          "x": 1341,
                          "y": 2578
                        },
                        {
                          "x": 1344,
                          "y": 2709
                        },
                        {
                          "x": 1103,
                          "y": 2715
                        }
                      ]
                    },
                    "confidence": 0.98740816,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "id"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1100,
                              "y": 2585
                            },
                            {
                              "x": 1177,
                              "y": 2583
                            },
                            {
                              "x": 1180,
                              "y": 2713
                            },
                            {
                              "x": 1103,
                              "y": 2715
                            }
                          ]
                        },
                        "confidence": 0.9842503,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1181,
                              "y": 2583
                            },
                            {
                              "x": 1261,
                              "y": 2581
                            },
                            {
                              "x": 1264,
                              "y": 2711
                            },
                            {
                              "x": 1184,
                              "y": 2713
                            }
                          ]
                        },
                        "confidence": 0.99284726,
                        "text": "L"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1266,
                              "y": 2580
                            },
                            {
                              "x": 1341,
                              "y": 2578
                            },
                            {
                              "x": 1344,
                              "y": 2708
                            },
                            {
                              "x": 1269,
                              "y": 2710
                            }
                          ]
                        },
                        "confidence": 0.9851269,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "N"
                      }
                    ]
                  }
                ]
              },
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 667,
                      "y": 2791
                    },
                    {
                      "x": 1549,
                      "y": 2786
                    },
                    {
                      "x": 1550,
                      "y": 2889
                    },
                    {
                      "x": 668,
                      "y": 2894
                    }
                  ]
                },
                "confidence": 0.9382957,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 667,
                          "y": 2791
                        },
                        {
                          "x": 1141,
                          "y": 2788
                        },
                        {
                          "x": 1142,
                          "y": 2891
                        },
                        {
                          "x": 668,
                          "y": 2894
                        }
                      ]
                    },
                    "confidence": 0.98241866,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 667,
                              "y": 2792
                            },
                            {
                              "x": 709,
                              "y": 2792
                            },
                            {
                              "x": 710,
                              "y": 2894
                            },
                            {
                              "x": 668,
                              "y": 2894
                            }
                          ]
                        },
                        "confidence": 0.99170196,
                        "text": "R"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 708,
                              "y": 2791
                            },
                            {
                              "x": 751,
                              "y": 2791
                            },
                            {
                              "x": 752,
                              "y": 2893
                            },
                            {
                              "x": 709,
                              "y": 2893
                            }
                          ]
                        },
                        "confidence": 0.9916542,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 752,
                              "y": 2791
                            },
                            {
                              "x": 796,
                              "y": 2791
                            },
                            {
                              "x": 797,
                              "y": 2893
                            },
                            {
                              "x": 753,
                              "y": 2893
                            }
                          ]
                        },
                        "confidence": 0.9980017,
                        "text": "Z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 795,
                              "y": 2791
                            },
                            {
                              "x": 839,
                              "y": 2791
                            },
                            {
                              "x": 840,
                              "y": 2893
                            },
                            {
                              "x": 796,
                              "y": 2893
                            }
                          ]
                        },
                        "confidence": 0.99642205,
                        "text": "L"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 849,
                              "y": 2790
                            },
                            {
                              "x": 876,
                              "y": 2790
                            },
                            {
                              "x": 877,
                              "y": 2892
                            },
                            {
                              "x": 850,
                              "y": 2892
                            }
                          ]
                        },
                        "confidence": 0.99450624,
                        "text": "I"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 884,
                              "y": 2790
                            },
                            {
                              "x": 926,
                              "y": 2790
                            },
                            {
                              "x": 927,
                              "y": 2892
                            },
                            {
                              "x": 885,
                              "y": 2892
                            }
                          ]
                        },
                        "confidence": 0.9869615,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 928,
                              "y": 2790
                            },
                            {
                              "x": 971,
                              "y": 2790
                            },
                            {
                              "x": 972,
                              "y": 2892
                            },
                            {
                              "x": 929,
                              "y": 2892
                            }
                          ]
                        },
                        "confidence": 0.99013454,
                        "text": "Z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 973,
                              "y": 2790
                            },
                            {
                              "x": 1012,
                              "y": 2790
                            },
                            {
                              "x": 1013,
                              "y": 2892
                            },
                            {
                              "x": 974,
                              "y": 2892
                            }
                          ]
                        },
                        "confidence": 0.9809921,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1010,
                              "y": 2789
                            },
                            {
                              "x": 1054,
                              "y": 2789
                            },
                            {
                              "x": 1055,
                              "y": 2891
                            },
                            {
                              "x": 1011,
                              "y": 2891
                            }
                          ]
                        },
                        "confidence": 0.9712861,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1066,
                              "y": 2789
                            },
                            {
                              "x": 1094,
                              "y": 2789
                            },
                            {
                              "x": 1095,
                              "y": 2891
                            },
                            {
                              "x": 1067,
                              "y": 2891
                            }
                          ]
                        },
                        "confidence": 0.92423505,
                        "text": "I"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1101,
                              "y": 2789
                            },
                            {
                              "x": 1141,
                              "y": 2789
                            },
                            {
                              "x": 1142,
                              "y": 2891
                            },
                            {
                              "x": 1102,
                              "y": 2891
                            }
                          ]
                        },
                        "confidence": 0.9807097,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "E"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1181,
                          "y": 2788
                        },
                        {
                          "x": 1549,
                          "y": 2786
                        },
                        {
                          "x": 1550,
                          "y": 2889
                        },
                        {
                          "x": 1182,
                          "y": 2891
                        }
                      ]
                    },
                    "confidence": 0.8843677,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1181,
                              "y": 2788
                            },
                            {
                              "x": 1220,
                              "y": 2788
                            },
                            {
                              "x": 1221,
                              "y": 2890
                            },
                            {
                              "x": 1182,
                              "y": 2890
                            }
                          ]
                        },
                        "confidence": 0.9693493,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1226,
                              "y": 2788
                            },
                            {
                              "x": 1264,
                              "y": 2788
                            },
                            {
                              "x": 1265,
                              "y": 2890
                            },
                            {
                              "x": 1227,
                              "y": 2890
                            }
                          ]
                        },
                        "confidence": 0.65859187,
                        "text": "Ł"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1266,
                              "y": 2788
                            },
                            {
                              "x": 1308,
                              "y": 2788
                            },
                            {
                              "x": 1309,
                              "y": 2890
                            },
                            {
                              "x": 1267,
                              "y": 2890
                            }
                          ]
                        },
                        "confidence": 0.9116358,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1312,
                              "y": 2788
                            },
                            {
                              "x": 1348,
                              "y": 2788
                            },
                            {
                              "x": 1349,
                              "y": 2890
                            },
                            {
                              "x": 1313,
                              "y": 2890
                            }
                          ]
                        },
                        "confidence": 0.8697693,
                        "text": "T"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1351,
                              "y": 2788
                            },
                            {
                              "x": 1393,
                              "y": 2788
                            },
                            {
                              "x": 1394,
                              "y": 2890
                            },
                            {
                              "x": 1352,
                              "y": 2890
                            }
                          ]
                        },
                        "confidence": 0.90677845,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1396,
                              "y": 2787
                            },
                            {
                              "x": 1433,
                              "y": 2787
                            },
                            {
                              "x": 1434,
                              "y": 2889
                            },
                            {
                              "x": 1397,
                              "y": 2889
                            }
                          ]
                        },
                        "confidence": 0.94128454,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1435,
                              "y": 2787
                            },
                            {
                              "x": 1479,
                              "y": 2787
                            },
                            {
                              "x": 1480,
                              "y": 2889
                            },
                            {
                              "x": 1436,
                              "y": 2889
                            }
                          ]
                        },
                        "confidence": 0.81538385,
                        "text": "Ś"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1478,
                              "y": 2787
                            },
                            {
                              "x": 1522,
                              "y": 2787
                            },
                            {
                              "x": 1523,
                              "y": 2889
                            },
                            {
                              "x": 1479,
                              "y": 2889
                            }
                          ]
                        },
                        "confidence": 0.9606996,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1524,
                              "y": 2786
                            },
                            {
                              "x": 1549,
                              "y": 2786
                            },
                            {
                              "x": 1550,
                              "y": 2888
                            },
                            {
                              "x": 1525,
                              "y": 2888
                            }
                          ]
                        },
                        "confidence": 0.92581683,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "I"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1957,
                  "y": 2612
                },
                {
                  "x": 2398,
                  "y": 2647
                },
                {
                  "x": 2386,
                  "y": 2798
                },
                {
                  "x": 1945,
                  "y": 2764
                }
              ]
            },
            "confidence": 0.9907146,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1957,
                      "y": 2612
                    },
                    {
                      "x": 2398,
                      "y": 2647
                    },
                    {
                      "x": 2386,
                      "y": 2798
                    },
                    {
                      "x": 1945,
                      "y": 2764
                    }
                  ]
                },
                "confidence": 0.9907146,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1957,
                          "y": 2612
                        },
                        {
                          "x": 2398,
                          "y": 2647
                        },
                        {
                          "x": 2386,
                          "y": 2798
                        },
                        {
                          "x": 1945,
                          "y": 2764
                        }
                      ]
                    },
                    "confidence": 0.9907146,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1957,
                              "y": 2613
                            },
                            {
                              "x": 2037,
                              "y": 2619
                            },
                            {
                              "x": 2025,
                              "y": 2770
                            },
                            {
                              "x": 1945,
                              "y": 2764
                            }
                          ]
                        },
                        "confidence": 0.9826825,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2037,
                              "y": 2619
                            },
                            {
                              "x": 2144,
                              "y": 2627
                            },
                            {
                              "x": 2132,
                              "y": 2778
                            },
                            {
                              "x": 2025,
                              "y": 2770
                            }
                          ]
                        },
                        "confidence": 0.9921544,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2143,
                              "y": 2627
                            },
                            {
                              "x": 2204,
                              "y": 2632
                            },
                            {
                              "x": 2192,
                              "y": 2782
                            },
                            {
                              "x": 2131,
                              "y": 2778
                            }
                          ]
                        },
                        "confidence": 0.99186033,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2216,
                              "y": 2633
                            },
                            {
                              "x": 2303,
                              "y": 2640
                            },
                            {
                              "x": 2291,
                              "y": 2790
                            },
                            {
                              "x": 2204,
                              "y": 2784
                            }
                          ]
                        },
                        "confidence": 0.99297625,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2306,
                              "y": 2640
                            },
                            {
                              "x": 2398,
                              "y": 2647
                            },
                            {
                              "x": 2386,
                              "y": 2798
                            },
                            {
                              "x": 2294,
                              "y": 2791
                            }
                          ]
                        },
                        "confidence": 0.99389964,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 663,
                  "y": 2913
                },
                {
                  "x": 1138,
                  "y": 2903
                },
                {
                  "x": 1140,
                  "y": 2994
                },
                {
                  "x": 665,
                  "y": 3004
                }
              ]
            },
            "confidence": 0.96084845,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 663,
                      "y": 2913
                    },
                    {
                      "x": 1138,
                      "y": 2903
                    },
                    {
                      "x": 1140,
                      "y": 2994
                    },
                    {
                      "x": 665,
                      "y": 3004
                    }
                  ]
                },
                "confidence": 0.96084845,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 663,
                          "y": 2914
                        },
                        {
                          "x": 877,
                          "y": 2910
                        },
                        {
                          "x": 879,
                          "y": 3000
                        },
                        {
                          "x": 665,
                          "y": 3004
                        }
                      ]
                    },
                    "confidence": 0.97128916,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 663,
                              "y": 2914
                            },
                            {
                              "x": 704,
                              "y": 2913
                            },
                            {
                              "x": 706,
                              "y": 3003
                            },
                            {
                              "x": 665,
                              "y": 3004
                            }
                          ]
                        },
                        "confidence": 0.9855759,
                        "text": "K"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 709,
                              "y": 2913
                            },
                            {
                              "x": 746,
                              "y": 2912
                            },
                            {
                              "x": 748,
                              "y": 3002
                            },
                            {
                              "x": 711,
                              "y": 3003
                            }
                          ]
                        },
                        "confidence": 0.9793575,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 754,
                              "y": 2912
                            },
                            {
                              "x": 791,
                              "y": 2911
                            },
                            {
                              "x": 793,
                              "y": 3001
                            },
                            {
                              "x": 756,
                              "y": 3002
                            }
                          ]
                        },
                        "confidence": 0.970423,
                        "text": "R"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 798,
                              "y": 2911
                            },
                            {
                              "x": 836,
                              "y": 2910
                            },
                            {
                              "x": 838,
                              "y": 3000
                            },
                            {
                              "x": 800,
                              "y": 3001
                            }
                          ]
                        },
                        "confidence": 0.9514747,
                        "text": "T"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 838,
                              "y": 2910
                            },
                            {
                              "x": 877,
                              "y": 2909
                            },
                            {
                              "x": 879,
                              "y": 2999
                            },
                            {
                              "x": 840,
                              "y": 3000
                            }
                          ]
                        },
                        "confidence": 0.96961457,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "A"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 920,
                          "y": 2908
                        },
                        {
                          "x": 1138,
                          "y": 2904
                        },
                        {
                          "x": 1140,
                          "y": 2995
                        },
                        {
                          "x": 922,
                          "y": 2999
                        }
                      ]
                    },
                    "confidence": 0.9504077,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 920,
                              "y": 2908
                            },
                            {
                              "x": 963,
                              "y": 2907
                            },
                            {
                              "x": 965,
                              "y": 2997
                            },
                            {
                              "x": 922,
                              "y": 2998
                            }
                          ]
                        },
                        "confidence": 0.9733924,
                        "text": "K"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 970,
                              "y": 2907
                            },
                            {
                              "x": 1009,
                              "y": 2906
                            },
                            {
                              "x": 1011,
                              "y": 2996
                            },
                            {
                              "x": 972,
                              "y": 2997
                            }
                          ]
                        },
                        "confidence": 0.9678173,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1011,
                              "y": 2906
                            },
                            {
                              "x": 1053,
                              "y": 2905
                            },
                            {
                              "x": 1055,
                              "y": 2995
                            },
                            {
                              "x": 1013,
                              "y": 2996
                            }
                          ]
                        },
                        "confidence": 0.9239752,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1056,
                              "y": 2906
                            },
                            {
                              "x": 1094,
                              "y": 2905
                            },
                            {
                              "x": 1096,
                              "y": 2995
                            },
                            {
                              "x": 1058,
                              "y": 2996
                            }
                          ]
                        },
                        "confidence": 0.93587434,
                        "text": "t"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1099,
                              "y": 2905
                            },
                            {
                              "x": 1138,
                              "y": 2904
                            },
                            {
                              "x": 1140,
                              "y": 2994
                            },
                            {
                              "x": 1101,
                              "y": 2995
                            }
                          ]
                        },
                        "confidence": 0.95097923,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "a"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 667,
                  "y": 3007
                },
                {
                  "x": 1480,
                  "y": 3018
                },
                {
                  "x": 1478,
                  "y": 3140
                },
                {
                  "x": 665,
                  "y": 3129
                }
              ]
            },
            "confidence": 0.94963485,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 667,
                      "y": 3007
                    },
                    {
                      "x": 1480,
                      "y": 3018
                    },
                    {
                      "x": 1478,
                      "y": 3140
                    },
                    {
                      "x": 665,
                      "y": 3129
                    }
                  ]
                },
                "confidence": 0.94963485,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 667,
                          "y": 3007
                        },
                        {
                          "x": 884,
                          "y": 3010
                        },
                        {
                          "x": 882,
                          "y": 3132
                        },
                        {
                          "x": 665,
                          "y": 3129
                        }
                      ]
                    },
                    "confidence": 0.99082613,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 667,
                              "y": 3008
                            },
                            {
                              "x": 711,
                              "y": 3009
                            },
                            {
                              "x": 709,
                              "y": 3130
                            },
                            {
                              "x": 665,
                              "y": 3129
                            }
                          ]
                        },
                        "confidence": 0.98537946,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 712,
                              "y": 3008
                            },
                            {
                              "x": 755,
                              "y": 3009
                            },
                            {
                              "x": 753,
                              "y": 3130
                            },
                            {
                              "x": 710,
                              "y": 3129
                            }
                          ]
                        },
                        "confidence": 0.99317557,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 759,
                              "y": 3009
                            },
                            {
                              "x": 795,
                              "y": 3009
                            },
                            {
                              "x": 793,
                              "y": 3130
                            },
                            {
                              "x": 757,
                              "y": 3130
                            }
                          ]
                        },
                        "confidence": 0.99351037,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 801,
                              "y": 3009
                            },
                            {
                              "x": 840,
                              "y": 3010
                            },
                            {
                              "x": 838,
                              "y": 3131
                            },
                            {
                              "x": 799,
                              "y": 3130
                            }
                          ]
                        },
                        "confidence": 0.99171615,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 843,
                              "y": 3010
                            },
                            {
                              "x": 884,
                              "y": 3011
                            },
                            {
                              "x": 882,
                              "y": 3132
                            },
                            {
                              "x": 841,
                              "y": 3131
                            }
                          ]
                        },
                        "confidence": 0.99034923,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "3"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 929,
                          "y": 3011
                        },
                        {
                          "x": 962,
                          "y": 3011
                        },
                        {
                          "x": 960,
                          "y": 3132
                        },
                        {
                          "x": 927,
                          "y": 3132
                        }
                      ]
                    },
                    "confidence": 0.9590893,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 929,
                              "y": 3011
                            },
                            {
                              "x": 962,
                              "y": 3011
                            },
                            {
                              "x": 960,
                              "y": 3132
                            },
                            {
                              "x": 927,
                              "y": 3132
                            }
                          ]
                        },
                        "confidence": 0.9590893,
                        "text": "#"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 975,
                          "y": 3011
                        },
                        {
                          "x": 1182,
                          "y": 3014
                        },
                        {
                          "x": 1180,
                          "y": 3136
                        },
                        {
                          "x": 973,
                          "y": 3133
                        }
                      ]
                    },
                    "confidence": 0.8715217,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 975,
                              "y": 3012
                            },
                            {
                              "x": 1014,
                              "y": 3013
                            },
                            {
                              "x": 1012,
                              "y": 3134
                            },
                            {
                              "x": 973,
                              "y": 3133
                            }
                          ]
                        },
                        "confidence": 0.9515961,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1015,
                              "y": 3012
                            },
                            {
                              "x": 1061,
                              "y": 3013
                            },
                            {
                              "x": 1059,
                              "y": 3134
                            },
                            {
                              "x": 1013,
                              "y": 3133
                            }
                          ]
                        },
                        "confidence": 0.61345416,
                        "text": "O"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1062,
                              "y": 3013
                            },
                            {
                              "x": 1103,
                              "y": 3014
                            },
                            {
                              "x": 1101,
                              "y": 3135
                            },
                            {
                              "x": 1060,
                              "y": 3134
                            }
                          ]
                        },
                        "confidence": 0.8168487,
                        "text": "S"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1104,
                              "y": 3013
                            },
                            {
                              "x": 1138,
                              "y": 3013
                            },
                            {
                              "x": 1136,
                              "y": 3134
                            },
                            {
                              "x": 1102,
                              "y": 3134
                            }
                          ]
                        },
                        "confidence": 0.99829924,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1144,
                              "y": 3014
                            },
                            {
                              "x": 1182,
                              "y": 3015
                            },
                            {
                              "x": 1180,
                              "y": 3136
                            },
                            {
                              "x": 1142,
                              "y": 3135
                            }
                          ]
                        },
                        "confidence": 0.9774104,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "8"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1226,
                          "y": 3015
                        },
                        {
                          "x": 1480,
                          "y": 3018
                        },
                        {
                          "x": 1478,
                          "y": 3139
                        },
                        {
                          "x": 1224,
                          "y": 3136
                        }
                      ]
                    },
                    "confidence": 0.97882724,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1226,
                              "y": 3015
                            },
                            {
                              "x": 1266,
                              "y": 3016
                            },
                            {
                              "x": 1264,
                              "y": 3137
                            },
                            {
                              "x": 1224,
                              "y": 3136
                            }
                          ]
                        },
                        "confidence": 0.9882704,
                        "text": "K"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1271,
                              "y": 3016
                            },
                            {
                              "x": 1310,
                              "y": 3017
                            },
                            {
                              "x": 1308,
                              "y": 3138
                            },
                            {
                              "x": 1269,
                              "y": 3137
                            }
                          ]
                        },
                        "confidence": 0.9939149,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1312,
                              "y": 3016
                            },
                            {
                              "x": 1349,
                              "y": 3017
                            },
                            {
                              "x": 1347,
                              "y": 3137
                            },
                            {
                              "x": 1310,
                              "y": 3137
                            }
                          ]
                        },
                        "confidence": 0.97324526,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1352,
                              "y": 3017
                            },
                            {
                              "x": 1391,
                              "y": 3018
                            },
                            {
                              "x": 1389,
                              "y": 3139
                            },
                            {
                              "x": 1350,
                              "y": 3138
                            }
                          ]
                        },
                        "confidence": 0.97516364,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1393,
                              "y": 3017
                            },
                            {
                              "x": 1437,
                              "y": 3018
                            },
                            {
                              "x": 1435,
                              "y": 3139
                            },
                            {
                              "x": 1391,
                              "y": 3138
                            }
                          ]
                        },
                        "confidence": 0.9619535,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1435,
                              "y": 3018
                            },
                            {
                              "x": 1480,
                              "y": 3019
                            },
                            {
                              "x": 1478,
                              "y": 3140
                            },
                            {
                              "x": 1433,
                              "y": 3139
                            }
                          ]
                        },
                        "confidence": 0.98041576,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "R"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1677,
                  "y": 3021
                },
                {
                  "x": 1851,
                  "y": 3023
                },
                {
                  "x": 1849,
                  "y": 3145
                },
                {
                  "x": 1675,
                  "y": 3143
                }
              ]
            },
            "confidence": 0.9577169,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1677,
                      "y": 3021
                    },
                    {
                      "x": 1851,
                      "y": 3023
                    },
                    {
                      "x": 1849,
                      "y": 3145
                    },
                    {
                      "x": 1675,
                      "y": 3143
                    }
                  ]
                },
                "confidence": 0.9577169,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1677,
                          "y": 3021
                        },
                        {
                          "x": 1735,
                          "y": 3022
                        },
                        {
                          "x": 1733,
                          "y": 3143
                        },
                        {
                          "x": 1675,
                          "y": 3142
                        }
                      ]
                    },
                    "confidence": 0.8630143,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1677,
                              "y": 3021
                            },
                            {
                              "x": 1735,
                              "y": 3022
                            },
                            {
                              "x": 1733,
                              "y": 3143
                            },
                            {
                              "x": 1675,
                              "y": 3142
                            }
                          ]
                        },
                        "confidence": 0.8630143,
                        "text": "S"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1734,
                          "y": 3022
                        },
                        {
                          "x": 1760,
                          "y": 3022
                        },
                        {
                          "x": 1758,
                          "y": 3143
                        },
                        {
                          "x": 1732,
                          "y": 3143
                        }
                      ]
                    },
                    "confidence": 0.9884914,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1734,
                              "y": 3022
                            },
                            {
                              "x": 1760,
                              "y": 3022
                            },
                            {
                              "x": 1758,
                              "y": 3143
                            },
                            {
                              "x": 1732,
                              "y": 3143
                            }
                          ]
                        },
                        "confidence": 0.9884914,
                        "text": ":"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1771,
                          "y": 3022
                        },
                        {
                          "x": 1851,
                          "y": 3023
                        },
                        {
                          "x": 1849,
                          "y": 3145
                        },
                        {
                          "x": 1769,
                          "y": 3144
                        }
                      ]
                    },
                    "confidence": 0.9896809,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1771,
                              "y": 3023
                            },
                            {
                              "x": 1815,
                              "y": 3024
                            },
                            {
                              "x": 1813,
                              "y": 3145
                            },
                            {
                              "x": 1769,
                              "y": 3144
                            }
                          ]
                        },
                        "confidence": 0.99010164,
                        "text": "6"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1813,
                              "y": 3023
                            },
                            {
                              "x": 1851,
                              "y": 3024
                            },
                            {
                              "x": 1849,
                              "y": 3145
                            },
                            {
                              "x": 1811,
                              "y": 3144
                            }
                          ]
                        },
                        "confidence": 0.98926014,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "1"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1987,
                  "y": 2958
                },
                {
                  "x": 2390,
                  "y": 3015
                },
                {
                  "x": 2376,
                  "y": 3116
                },
                {
                  "x": 1973,
                  "y": 3059
                }
              ]
            },
            "confidence": 0.9776743,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1987,
                      "y": 2958
                    },
                    {
                      "x": 2390,
                      "y": 3015
                    },
                    {
                      "x": 2376,
                      "y": 3116
                    },
                    {
                      "x": 1973,
                      "y": 3059
                    }
                  ]
                },
                "confidence": 0.9776743,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1987,
                          "y": 2958
                        },
                        {
                          "x": 2216,
                          "y": 2990
                        },
                        {
                          "x": 2202,
                          "y": 3091
                        },
                        {
                          "x": 1973,
                          "y": 3059
                        }
                      ]
                    },
                    "confidence": 0.99347615,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "id"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1987,
                              "y": 2959
                            },
                            {
                              "x": 2036,
                              "y": 2966
                            },
                            {
                              "x": 2021,
                              "y": 3066
                            },
                            {
                              "x": 1973,
                              "y": 3059
                            }
                          ]
                        },
                        "confidence": 0.98202556,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2027,
                              "y": 2964
                            },
                            {
                              "x": 2092,
                              "y": 2973
                            },
                            {
                              "x": 2078,
                              "y": 3073
                            },
                            {
                              "x": 2013,
                              "y": 3064
                            }
                          ]
                        },
                        "confidence": 0.99574995,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2077,
                              "y": 2971
                            },
                            {
                              "x": 2119,
                              "y": 2977
                            },
                            {
                              "x": 2105,
                              "y": 3077
                            },
                            {
                              "x": 2063,
                              "y": 3071
                            }
                          ]
                        },
                        "confidence": 0.9933942,
                        "text": ","
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2116,
                              "y": 2977
                            },
                            {
                              "x": 2169,
                              "y": 2985
                            },
                            {
                              "x": 2155,
                              "y": 3085
                            },
                            {
                              "x": 2102,
                              "y": 3077
                            }
                          ]
                        },
                        "confidence": 0.9979316,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2164,
                              "y": 2983
                            },
                            {
                              "x": 2215,
                              "y": 2990
                            },
                            {
                              "x": 2201,
                              "y": 3090
                            },
                            {
                              "x": 2150,
                              "y": 3083
                            }
                          ]
                        },
                        "confidence": 0.99827933,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2251,
                          "y": 2995
                        },
                        {
                          "x": 2390,
                          "y": 3014
                        },
                        {
                          "x": 2375,
                          "y": 3115
                        },
                        {
                          "x": 2237,
                          "y": 3096
                        }
                      ]
                    },
                    "confidence": 0.951338,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "id"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2251,
                              "y": 2996
                            },
                            {
                              "x": 2299,
                              "y": 3003
                            },
                            {
                              "x": 2284,
                              "y": 3103
                            },
                            {
                              "x": 2237,
                              "y": 3096
                            }
                          ]
                        },
                        "confidence": 0.98776037,
                        "text": "P"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2298,
                              "y": 3002
                            },
                            {
                              "x": 2350,
                              "y": 3009
                            },
                            {
                              "x": 2336,
                              "y": 3109
                            },
                            {
                              "x": 2284,
                              "y": 3102
                            }
                          ]
                        },
                        "confidence": 0.9436481,
                        "text": "L"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2338,
                              "y": 3008
                            },
                            {
                              "x": 2389,
                              "y": 3015
                            },
                            {
                              "x": 2375,
                              "y": 3115
                            },
                            {
                              "x": 2324,
                              "y": 3108
                            }
                          ]
                        },
                        "confidence": 0.92260545,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "N"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1690,
                  "y": 3148
                },
                {
                  "x": 2395,
                  "y": 3270
                },
                {
                  "x": 2378,
                  "y": 3369
                },
                {
                  "x": 1673,
                  "y": 3247
                }
              ]
            },
            "confidence": 0.97464484,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1690,
                      "y": 3148
                    },
                    {
                      "x": 2395,
                      "y": 3270
                    },
                    {
                      "x": 2378,
                      "y": 3369
                    },
                    {
                      "x": 1673,
                      "y": 3247
                    }
                  ]
                },
                "confidence": 0.97464484,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1690,
                          "y": 3148
                        },
                        {
                          "x": 2135,
                          "y": 3225
                        },
                        {
                          "x": 2118,
                          "y": 3324
                        },
                        {
                          "x": 1673,
                          "y": 3247
                        }
                      ]
                    },
                    "confidence": 0.9653776,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1690,
                              "y": 3149
                            },
                            {
                              "x": 1740,
                              "y": 3158
                            },
                            {
                              "x": 1723,
                              "y": 3255
                            },
                            {
                              "x": 1673,
                              "y": 3247
                            }
                          ]
                        },
                        "confidence": 0.97396797,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1730,
                              "y": 3156
                            },
                            {
                              "x": 1791,
                              "y": 3167
                            },
                            {
                              "x": 1774,
                              "y": 3264
                            },
                            {
                              "x": 1713,
                              "y": 3254
                            }
                          ]
                        },
                        "confidence": 0.73647475,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1772,
                              "y": 3163
                            },
                            {
                              "x": 1836,
                              "y": 3174
                            },
                            {
                              "x": 1819,
                              "y": 3272
                            },
                            {
                              "x": 1755,
                              "y": 3261
                            }
                          ]
                        },
                        "confidence": 0.9929987,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1817,
                              "y": 3171
                            },
                            {
                              "x": 1880,
                              "y": 3182
                            },
                            {
                              "x": 1863,
                              "y": 3279
                            },
                            {
                              "x": 1800,
                              "y": 3269
                            }
                          ]
                        },
                        "confidence": 0.99252903,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1866,
                              "y": 3179
                            },
                            {
                              "x": 1921,
                              "y": 3189
                            },
                            {
                              "x": 1904,
                              "y": 3286
                            },
                            {
                              "x": 1849,
                              "y": 3277
                            }
                          ]
                        },
                        "confidence": 0.99145234,
                        "text": "-"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1896,
                              "y": 3184
                            },
                            {
                              "x": 1967,
                              "y": 3196
                            },
                            {
                              "x": 1950,
                              "y": 3294
                            },
                            {
                              "x": 1879,
                              "y": 3282
                            }
                          ]
                        },
                        "confidence": 0.99607664,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1940,
                              "y": 3192
                            },
                            {
                              "x": 2007,
                              "y": 3204
                            },
                            {
                              "x": 1990,
                              "y": 3301
                            },
                            {
                              "x": 1923,
                              "y": 3290
                            }
                          ]
                        },
                        "confidence": 0.99458075,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1987,
                              "y": 3200
                            },
                            {
                              "x": 2046,
                              "y": 3210
                            },
                            {
                              "x": 2029,
                              "y": 3308
                            },
                            {
                              "x": 1970,
                              "y": 3298
                            }
                          ]
                        },
                        "confidence": 0.9920314,
                        "text": "-"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2024,
                              "y": 3207
                            },
                            {
                              "x": 2087,
                              "y": 3218
                            },
                            {
                              "x": 2070,
                              "y": 3315
                            },
                            {
                              "x": 2007,
                              "y": 3305
                            }
                          ]
                        },
                        "confidence": 0.99408984,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2070,
                              "y": 3214
                            },
                            {
                              "x": 2135,
                              "y": 3225
                            },
                            {
                              "x": 2118,
                              "y": 3323
                            },
                            {
                              "x": 2053,
                              "y": 3312
                            }
                          ]
                        },
                        "confidence": 0.98957473,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "2"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 2155,
                          "y": 3229
                        },
                        {
                          "x": 2395,
                          "y": 3271
                        },
                        {
                          "x": 2378,
                          "y": 3368
                        },
                        {
                          "x": 2138,
                          "y": 3327
                        }
                      ]
                    },
                    "confidence": 0.9931792,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2155,
                              "y": 3229
                            },
                            {
                              "x": 2215,
                              "y": 3239
                            },
                            {
                              "x": 2198,
                              "y": 3337
                            },
                            {
                              "x": 2138,
                              "y": 3327
                            }
                          ]
                        },
                        "confidence": 0.9944371,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2210,
                              "y": 3239
                            },
                            {
                              "x": 2269,
                              "y": 3249
                            },
                            {
                              "x": 2252,
                              "y": 3347
                            },
                            {
                              "x": 2193,
                              "y": 3337
                            }
                          ]
                        },
                        "confidence": 0.99648064,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2260,
                              "y": 3247
                            },
                            {
                              "x": 2313,
                              "y": 3256
                            },
                            {
                              "x": 2296,
                              "y": 3354
                            },
                            {
                              "x": 2243,
                              "y": 3345
                            }
                          ]
                        },
                        "confidence": 0.99293536,
                        "text": ":"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2293,
                              "y": 3253
                            },
                            {
                              "x": 2352,
                              "y": 3263
                            },
                            {
                              "x": 2335,
                              "y": 3361
                            },
                            {
                              "x": 2276,
                              "y": 3351
                            }
                          ]
                        },
                        "confidence": 0.9940694,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2343,
                              "y": 3262
                            },
                            {
                              "x": 2395,
                              "y": 3271
                            },
                            {
                              "x": 2378,
                              "y": 3369
                            },
                            {
                              "x": 2326,
                              "y": 3360
                            }
                          ]
                        },
                        "confidence": 0.9879736,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "1"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 664,
                  "y": 3175
                },
                {
                  "x": 2405,
                  "y": 3339
                },
                {
                  "x": 2390,
                  "y": 3506
                },
                {
                  "x": 648,
                  "y": 3342
                }
              ]
            },
            "confidence": 0.96718,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 664,
                      "y": 3175
                    },
                    {
                      "x": 2405,
                      "y": 3339
                    },
                    {
                      "x": 2390,
                      "y": 3506
                    },
                    {
                      "x": 648,
                      "y": 3342
                    }
                  ]
                },
                "confidence": 0.96718,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 664,
                          "y": 3175
                        },
                        {
                          "x": 2405,
                          "y": 3339
                        },
                        {
                          "x": 2390,
                          "y": 3506
                        },
                        {
                          "x": 648,
                          "y": 3342
                        }
                      ]
                    },
                    "confidence": 0.96718,
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 657,
                              "y": 3252
                            },
                            {
                              "x": 707,
                              "y": 3251
                            },
                            {
                              "x": 708,
                              "y": 3341
                            },
                            {
                              "x": 658,
                              "y": 3342
                            }
                          ]
                        },
                        "confidence": 0.9552938,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 707,
                              "y": 3251
                            },
                            {
                              "x": 758,
                              "y": 3250
                            },
                            {
                              "x": 759,
                              "y": 3337
                            },
                            {
                              "x": 708,
                              "y": 3338
                            }
                          ]
                        },
                        "confidence": 0.9666855,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 750,
                              "y": 3250
                            },
                            {
                              "x": 802,
                              "y": 3249
                            },
                            {
                              "x": 803,
                              "y": 3336
                            },
                            {
                              "x": 751,
                              "y": 3337
                            }
                          ]
                        },
                        "confidence": 0.9846296,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 788,
                              "y": 3247
                            },
                            {
                              "x": 835,
                              "y": 3246
                            },
                            {
                              "x": 836,
                              "y": 3335
                            },
                            {
                              "x": 789,
                              "y": 3336
                            }
                          ]
                        },
                        "confidence": 0.9705246,
                        "text": "4"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 836,
                              "y": 3246
                            },
                            {
                              "x": 883,
                              "y": 3245
                            },
                            {
                              "x": 884,
                              "y": 3331
                            },
                            {
                              "x": 837,
                              "y": 3332
                            }
                          ]
                        },
                        "confidence": 0.97959584,
                        "text": "6"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 878,
                              "y": 3243
                            },
                            {
                              "x": 926,
                              "y": 3242
                            },
                            {
                              "x": 927,
                              "y": 3331
                            },
                            {
                              "x": 879,
                              "y": 3332
                            }
                          ]
                        },
                        "confidence": 0.98498696,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 926,
                              "y": 3241
                            },
                            {
                              "x": 971,
                              "y": 3240
                            },
                            {
                              "x": 972,
                              "y": 3326
                            },
                            {
                              "x": 927,
                              "y": 3327
                            }
                          ]
                        },
                        "confidence": 0.9918654,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 969,
                              "y": 3238
                            },
                            {
                              "x": 1011,
                              "y": 3238
                            },
                            {
                              "x": 1012,
                              "y": 3326
                            },
                            {
                              "x": 970,
                              "y": 3326
                            }
                          ]
                        },
                        "confidence": 0.9741869,
                        "text": "B"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1010,
                              "y": 3239
                            },
                            {
                              "x": 1058,
                              "y": 3240
                            },
                            {
                              "x": 1056,
                              "y": 3328
                            },
                            {
                              "x": 1008,
                              "y": 3327
                            }
                          ]
                        },
                        "confidence": 0.9840604,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1052,
                              "y": 3239
                            },
                            {
                              "x": 1098,
                              "y": 3240
                            },
                            {
                              "x": 1096,
                              "y": 3329
                            },
                            {
                              "x": 1050,
                              "y": 3328
                            }
                          ]
                        },
                        "confidence": 0.98351556,
                        "text": "8"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1095,
                              "y": 3238
                            },
                            {
                              "x": 1145,
                              "y": 3239
                            },
                            {
                              "x": 1143,
                              "y": 3328
                            },
                            {
                              "x": 1093,
                              "y": 3327
                            }
                          ]
                        },
                        "confidence": 0.98403585,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1135,
                              "y": 3239
                            },
                            {
                              "x": 1185,
                              "y": 3240
                            },
                            {
                              "x": 1183,
                              "y": 3332
                            },
                            {
                              "x": 1133,
                              "y": 3331
                            }
                          ]
                        },
                        "confidence": 0.9780399,
                        "text": "9"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1180,
                              "y": 3238
                            },
                            {
                              "x": 1225,
                              "y": 3239
                            },
                            {
                              "x": 1223,
                              "y": 3328
                            },
                            {
                              "x": 1178,
                              "y": 3327
                            }
                          ]
                        },
                        "confidence": 0.9878295,
                        "text": "F"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1225,
                              "y": 3239
                            },
                            {
                              "x": 1269,
                              "y": 3240
                            },
                            {
                              "x": 1267,
                              "y": 3329
                            },
                            {
                              "x": 1223,
                              "y": 3328
                            }
                          ]
                        },
                        "confidence": 0.9897381,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1268,
                              "y": 3240
                            },
                            {
                              "x": 1315,
                              "y": 3242
                            },
                            {
                              "x": 1312,
                              "y": 3328
                            },
                            {
                              "x": 1265,
                              "y": 3326
                            }
                          ]
                        },
                        "confidence": 0.98223656,
                        "text": "6"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1307,
                              "y": 3240
                            },
                            {
                              "x": 1364,
                              "y": 3245
                            },
                            {
                              "x": 1357,
                              "y": 3335
                            },
                            {
                              "x": 1300,
                              "y": 3331
                            }
                          ]
                        },
                        "confidence": 0.97800905,
                        "text": "9"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1345,
                              "y": 3243
                            },
                            {
                              "x": 1397,
                              "y": 3247
                            },
                            {
                              "x": 1390,
                              "y": 3336
                            },
                            {
                              "x": 1338,
                              "y": 3332
                            }
                          ]
                        },
                        "confidence": 0.98181355,
                        "text": "4"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1394,
                              "y": 3247
                            },
                            {
                              "x": 1441,
                              "y": 3251
                            },
                            {
                              "x": 1434,
                              "y": 3340
                            },
                            {
                              "x": 1387,
                              "y": 3337
                            }
                          ]
                        },
                        "confidence": 0.97345966,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1435,
                              "y": 3251
                            },
                            {
                              "x": 1479,
                              "y": 3255
                            },
                            {
                              "x": 1472,
                              "y": 3341
                            },
                            {
                              "x": 1428,
                              "y": 3338
                            }
                          ]
                        },
                        "confidence": 0.97413105,
                        "text": "C"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1475,
                              "y": 3256
                            },
                            {
                              "x": 1523,
                              "y": 3260
                            },
                            {
                              "x": 1516,
                              "y": 3346
                            },
                            {
                              "x": 1468,
                              "y": 3342
                            }
                          ]
                        },
                        "confidence": 0.8473253,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1517,
                              "y": 3259
                            },
                            {
                              "x": 1565,
                              "y": 3263
                            },
                            {
                              "x": 1558,
                              "y": 3350
                            },
                            {
                              "x": 1510,
                              "y": 3346
                            }
                          ]
                        },
                        "confidence": 0.98262185,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1557,
                              "y": 3260
                            },
                            {
                              "x": 1610,
                              "y": 3265
                            },
                            {
                              "x": 1600,
                              "y": 3356
                            },
                            {
                              "x": 1548,
                              "y": 3351
                            }
                          ]
                        },
                        "confidence": 0.99043703,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1600,
                              "y": 3263
                            },
                            {
                              "x": 1650,
                              "y": 3270
                            },
                            {
                              "x": 1637,
                              "y": 3359
                            },
                            {
                              "x": 1588,
                              "y": 3352
                            }
                          ]
                        },
                        "confidence": 0.9916695,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1646,
                              "y": 3270
                            },
                            {
                              "x": 1690,
                              "y": 3276
                            },
                            {
                              "x": 1678,
                              "y": 3363
                            },
                            {
                              "x": 1634,
                              "y": 3357
                            }
                          ]
                        },
                        "confidence": 0.99200904,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1685,
                              "y": 3277
                            },
                            {
                              "x": 1733,
                              "y": 3284
                            },
                            {
                              "x": 1720,
                              "y": 3372
                            },
                            {
                              "x": 1673,
                              "y": 3365
                            }
                          ]
                        },
                        "confidence": 0.98619986,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1728,
                              "y": 3284
                            },
                            {
                              "x": 1768,
                              "y": 3289
                            },
                            {
                              "x": 1755,
                              "y": 3379
                            },
                            {
                              "x": 1716,
                              "y": 3373
                            }
                          ]
                        },
                        "confidence": 0.98300123,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1767,
                              "y": 3290
                            },
                            {
                              "x": 1817,
                              "y": 3297
                            },
                            {
                              "x": 1804,
                              "y": 3385
                            },
                            {
                              "x": 1755,
                              "y": 3378
                            }
                          ]
                        },
                        "confidence": 0.95358646,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1810,
                              "y": 3294
                            },
                            {
                              "x": 1861,
                              "y": 3301
                            },
                            {
                              "x": 1848,
                              "y": 3390
                            },
                            {
                              "x": 1798,
                              "y": 3383
                            }
                          ]
                        },
                        "confidence": 0.97943705,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1851,
                              "y": 3300
                            },
                            {
                              "x": 1902,
                              "y": 3309
                            },
                            {
                              "x": 1887,
                              "y": 3399
                            },
                            {
                              "x": 1836,
                              "y": 3391
                            }
                          ]
                        },
                        "confidence": 0.9835932,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1895,
                              "y": 3308
                            },
                            {
                              "x": 1941,
                              "y": 3317
                            },
                            {
                              "x": 1923,
                              "y": 3407
                            },
                            {
                              "x": 1877,
                              "y": 3397
                            }
                          ]
                        },
                        "confidence": 0.98637295,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1938,
                              "y": 3318
                            },
                            {
                              "x": 1988,
                              "y": 3328
                            },
                            {
                              "x": 1970,
                              "y": 3415
                            },
                            {
                              "x": 1920,
                              "y": 3405
                            }
                          ]
                        },
                        "confidence": 0.96863973,
                        "text": "6"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1981,
                              "y": 3327
                            },
                            {
                              "x": 2027,
                              "y": 3336
                            },
                            {
                              "x": 2009,
                              "y": 3425
                            },
                            {
                              "x": 1963,
                              "y": 3415
                            }
                          ]
                        },
                        "confidence": 0.9708228,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2023,
                              "y": 3334
                            },
                            {
                              "x": 2075,
                              "y": 3345
                            },
                            {
                              "x": 2056,
                              "y": 3435
                            },
                            {
                              "x": 2004,
                              "y": 3424
                            }
                          ]
                        },
                        "confidence": 0.9581474,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2065,
                              "y": 3342
                            },
                            {
                              "x": 2116,
                              "y": 3352
                            },
                            {
                              "x": 2097,
                              "y": 3443
                            },
                            {
                              "x": 2046,
                              "y": 3432
                            }
                          ]
                        },
                        "confidence": 0.6368026,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2107,
                              "y": 3354
                            },
                            {
                              "x": 2158,
                              "y": 3364
                            },
                            {
                              "x": 2140,
                              "y": 3455
                            },
                            {
                              "x": 2089,
                              "y": 3445
                            }
                          ]
                        },
                        "confidence": 0.9801371,
                        "text": "8"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2154,
                              "y": 3364
                            },
                            {
                              "x": 2205,
                              "y": 3374
                            },
                            {
                              "x": 2189,
                              "y": 3462
                            },
                            {
                              "x": 2137,
                              "y": 3452
                            }
                          ]
                        },
                        "confidence": 0.9468813,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2197,
                              "y": 3370
                            },
                            {
                              "x": 2256,
                              "y": 3381
                            },
                            {
                              "x": 2239,
                              "y": 3472
                            },
                            {
                              "x": 2180,
                              "y": 3461
                            }
                          ]
                        },
                        "confidence": 0.9843638,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2232,
                              "y": 3380
                            },
                            {
                              "x": 2304,
                              "y": 3393
                            },
                            {
                              "x": 2287,
                              "y": 3484
                            },
                            {
                              "x": 2215,
                              "y": 3470
                            }
                          ]
                        },
                        "confidence": 0.9831121,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2277,
                              "y": 3388
                            },
                            {
                              "x": 2347,
                              "y": 3401
                            },
                            {
                              "x": 2330,
                              "y": 3493
                            },
                            {
                              "x": 2260,
                              "y": 3480
                            }
                          ]
                        },
                        "confidence": 0.991462,
                        "text": "7"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 2325,
                              "y": 3396
                            },
                            {
                              "x": 2399,
                              "y": 3410
                            },
                            {
                              "x": 2381,
                              "y": 3505
                            },
                            {
                              "x": 2307,
                              "y": 3491
                            }
                          ]
                        },
                        "confidence": 0.9859409,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "0"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1300,
                  "y": 3345
                },
                {
                  "x": 1904,
                  "y": 3414
                },
                {
                  "x": 1892,
                  "y": 3523
                },
                {
                  "x": 1288,
                  "y": 3453
                }
              ]
            },
            "confidence": 0.92289925,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1300,
                      "y": 3345
                    },
                    {
                      "x": 1904,
                      "y": 3414
                    },
                    {
                      "x": 1892,
                      "y": 3523
                    },
                    {
                      "x": 1288,
                      "y": 3453
                    }
                  ]
                },
                "confidence": 0.92289925,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1300,
                          "y": 3345
                        },
                        {
                          "x": 1439,
                          "y": 3361
                        },
                        {
                          "x": 1427,
                          "y": 3469
                        },
                        {
                          "x": 1288,
                          "y": 3453
                        }
                      ]
                    },
                    "confidence": 0.6989398,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "mi"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1300,
                              "y": 3346
                            },
                            {
                              "x": 1356,
                              "y": 3352
                            },
                            {
                              "x": 1343,
                              "y": 3460
                            },
                            {
                              "x": 1288,
                              "y": 3453
                            }
                          ]
                        },
                        "confidence": 0.828667,
                        "text": "E"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1341,
                              "y": 3350
                            },
                            {
                              "x": 1395,
                              "y": 3356
                            },
                            {
                              "x": 1382,
                              "y": 3463
                            },
                            {
                              "x": 1329,
                              "y": 3457
                            }
                          ]
                        },
                        "confidence": 0.8465397,
                        "text": "A"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1392,
                              "y": 3356
                            },
                            {
                              "x": 1439,
                              "y": 3361
                            },
                            {
                              "x": 1426,
                              "y": 3469
                            },
                            {
                              "x": 1380,
                              "y": 3463
                            }
                          ]
                        },
                        "confidence": 0.4216128,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "O"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1472,
                          "y": 3365
                        },
                        {
                          "x": 1904,
                          "y": 3415
                        },
                        {
                          "x": 1892,
                          "y": 3523
                        },
                        {
                          "x": 1460,
                          "y": 3473
                        }
                      ]
                    },
                    "confidence": 0.99008703,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "mi"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1472,
                              "y": 3365
                            },
                            {
                              "x": 1523,
                              "y": 3371
                            },
                            {
                              "x": 1510,
                              "y": 3478
                            },
                            {
                              "x": 1460,
                              "y": 3472
                            }
                          ]
                        },
                        "confidence": 0.9888057,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1520,
                              "y": 3371
                            },
                            {
                              "x": 1567,
                              "y": 3376
                            },
                            {
                              "x": 1554,
                              "y": 3484
                            },
                            {
                              "x": 1508,
                              "y": 3478
                            }
                          ]
                        },
                        "confidence": 0.9943334,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1560,
                              "y": 3375
                            },
                            {
                              "x": 1610,
                              "y": 3381
                            },
                            {
                              "x": 1597,
                              "y": 3488
                            },
                            {
                              "x": 1548,
                              "y": 3482
                            }
                          ]
                        },
                        "confidence": 0.9910451,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1602,
                              "y": 3380
                            },
                            {
                              "x": 1647,
                              "y": 3385
                            },
                            {
                              "x": 1634,
                              "y": 3492
                            },
                            {
                              "x": 1590,
                              "y": 3487
                            }
                          ]
                        },
                        "confidence": 0.9932773,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1642,
                              "y": 3385
                            },
                            {
                              "x": 1691,
                              "y": 3391
                            },
                            {
                              "x": 1678,
                              "y": 3498
                            },
                            {
                              "x": 1630,
                              "y": 3492
                            }
                          ]
                        },
                        "confidence": 0.99444073,
                        "text": "6"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1684,
                              "y": 3390
                            },
                            {
                              "x": 1736,
                              "y": 3396
                            },
                            {
                              "x": 1723,
                              "y": 3503
                            },
                            {
                              "x": 1672,
                              "y": 3497
                            }
                          ]
                        },
                        "confidence": 0.9874941,
                        "text": "3"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1723,
                              "y": 3394
                            },
                            {
                              "x": 1780,
                              "y": 3400
                            },
                            {
                              "x": 1767,
                              "y": 3508
                            },
                            {
                              "x": 1711,
                              "y": 3501
                            }
                          ]
                        },
                        "confidence": 0.9892361,
                        "text": "2"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1765,
                              "y": 3399
                            },
                            {
                              "x": 1822,
                              "y": 3405
                            },
                            {
                              "x": 1809,
                              "y": 3513
                            },
                            {
                              "x": 1753,
                              "y": 3506
                            }
                          ]
                        },
                        "confidence": 0.9775434,
                        "text": "0"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1802,
                              "y": 3403
                            },
                            {
                              "x": 1861,
                              "y": 3410
                            },
                            {
                              "x": 1848,
                              "y": 3517
                            },
                            {
                              "x": 1790,
                              "y": 3510
                            }
                          ]
                        },
                        "confidence": 0.99388117,
                        "text": "5"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1850,
                              "y": 3409
                            },
                            {
                              "x": 1904,
                              "y": 3415
                            },
                            {
                              "x": 1891,
                              "y": 3522
                            },
                            {
                              "x": 1838,
                              "y": 3516
                            }
                          ]
                        },
                        "confidence": 0.9908135,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "2"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 658,
                  "y": 3431
                },
                {
                  "x": 2025,
                  "y": 3495
                },
                {
                  "x": 2017,
                  "y": 3683
                },
                {
                  "x": 649,
                  "y": 3619
                }
              ]
            },
            "confidence": 0.9196531,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 658,
                      "y": 3431
                    },
                    {
                      "x": 2025,
                      "y": 3495
                    },
                    {
                      "x": 2017,
                      "y": 3683
                    },
                    {
                      "x": 649,
                      "y": 3619
                    }
                  ]
                },
                "confidence": 0.9196531,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 656,
                          "y": 3481
                        },
                        {
                          "x": 1096,
                          "y": 3472
                        },
                        {
                          "x": 1098,
                          "y": 3568
                        },
                        {
                          "x": 658,
                          "y": 3577
                        }
                      ]
                    },
                    "confidence": 0.9368894,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 656,
                              "y": 3487
                            },
                            {
                              "x": 710,
                              "y": 3486
                            },
                            {
                              "x": 711,
                              "y": 3573
                            },
                            {
                              "x": 657,
                              "y": 3574
                            }
                          ]
                        },
                        "confidence": 0.9111618,
                        "text": "D"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 709,
                              "y": 3501
                            },
                            {
                              "x": 756,
                              "y": 3500
                            },
                            {
                              "x": 757,
                              "y": 3566
                            },
                            {
                              "x": 710,
                              "y": 3567
                            }
                          ]
                        },
                        "confidence": 0.95007885,
                        "text": "z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 759,
                              "y": 3484
                            },
                            {
                              "x": 789,
                              "y": 3484
                            },
                            {
                              "x": 790,
                              "y": 3562
                            },
                            {
                              "x": 760,
                              "y": 3562
                            }
                          ]
                        },
                        "confidence": 0.96687275,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 796,
                              "y": 3497
                            },
                            {
                              "x": 838,
                              "y": 3496
                            },
                            {
                              "x": 839,
                              "y": 3560
                            },
                            {
                              "x": 797,
                              "y": 3561
                            }
                          ]
                        },
                        "confidence": 0.99425364,
                        "text": "e"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 838,
                              "y": 3477
                            },
                            {
                              "x": 881,
                              "y": 3476
                            },
                            {
                              "x": 882,
                              "y": 3560
                            },
                            {
                              "x": 839,
                              "y": 3561
                            }
                          ]
                        },
                        "confidence": 0.99559134,
                        "text": "k"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 879,
                              "y": 3495
                            },
                            {
                              "x": 921,
                              "y": 3494
                            },
                            {
                              "x": 922,
                              "y": 3556
                            },
                            {
                              "x": 880,
                              "y": 3557
                            }
                          ]
                        },
                        "confidence": 0.99504745,
                        "text": "u"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 925,
                              "y": 3477
                            },
                            {
                              "x": 959,
                              "y": 3476
                            },
                            {
                              "x": 960,
                              "y": 3570
                            },
                            {
                              "x": 926,
                              "y": 3571
                            }
                          ]
                        },
                        "confidence": 0.9715368,
                        "text": "j"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 965,
                              "y": 3492
                            },
                            {
                              "x": 1008,
                              "y": 3491
                            },
                            {
                              "x": 1009,
                              "y": 3557
                            },
                            {
                              "x": 966,
                              "y": 3558
                            }
                          ]
                        },
                        "confidence": 0.96868116,
                        "text": "e"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1005,
                              "y": 3494
                            },
                            {
                              "x": 1050,
                              "y": 3492
                            },
                            {
                              "x": 1052,
                              "y": 3557
                            },
                            {
                              "x": 1007,
                              "y": 3559
                            }
                          ]
                        },
                        "confidence": 0.66914517,
                        "text": "m"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1052,
                              "y": 3492
                            },
                            {
                              "x": 1095,
                              "y": 3490
                            },
                            {
                              "x": 1098,
                              "y": 3567
                            },
                            {
                              "x": 1055,
                              "y": 3569
                            }
                          ]
                        },
                        "confidence": 0.94652486,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "y"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1131,
                          "y": 3499
                        },
                        {
                          "x": 1179,
                          "y": 3497
                        },
                        {
                          "x": 1181,
                          "y": 3539
                        },
                        {
                          "x": 1133,
                          "y": 3541
                        }
                      ]
                    },
                    "confidence": 0.5934209,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1131,
                              "y": 3499
                            },
                            {
                              "x": 1179,
                              "y": 3497
                            },
                            {
                              "x": 1181,
                              "y": 3539
                            },
                            {
                              "x": 1133,
                              "y": 3541
                            }
                          ]
                        },
                        "confidence": 0.5934209,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "-"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1212,
                          "y": 3457
                        },
                        {
                          "x": 1645,
                          "y": 3517
                        },
                        {
                          "x": 1631,
                          "y": 3616
                        },
                        {
                          "x": 1198,
                          "y": 3556
                        }
                      ]
                    },
                    "confidence": 0.94999367,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1211,
                              "y": 3466
                            },
                            {
                              "x": 1266,
                              "y": 3464
                            },
                            {
                              "x": 1269,
                              "y": 3550
                            },
                            {
                              "x": 1214,
                              "y": 3552
                            }
                          ]
                        },
                        "confidence": 0.9744792,
                        "text": "Z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1262,
                              "y": 3483
                            },
                            {
                              "x": 1306,
                              "y": 3488
                            },
                            {
                              "x": 1298,
                              "y": 3556
                            },
                            {
                              "x": 1254,
                              "y": 3551
                            }
                          ]
                        },
                        "confidence": 0.99253464,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1302,
                              "y": 3487
                            },
                            {
                              "x": 1348,
                              "y": 3495
                            },
                            {
                              "x": 1336,
                              "y": 3573
                            },
                            {
                              "x": 1289,
                              "y": 3565
                            }
                          ]
                        },
                        "confidence": 0.9925084,
                        "text": "p"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1343,
                              "y": 3495
                            },
                            {
                              "x": 1385,
                              "y": 3502
                            },
                            {
                              "x": 1375,
                              "y": 3567
                            },
                            {
                              "x": 1332,
                              "y": 3560
                            }
                          ]
                        },
                        "confidence": 0.9866522,
                        "text": "r"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1387,
                              "y": 3503
                            },
                            {
                              "x": 1432,
                              "y": 3511
                            },
                            {
                              "x": 1421,
                              "y": 3577
                            },
                            {
                              "x": 1376,
                              "y": 3569
                            }
                          ]
                        },
                        "confidence": 0.9843952,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1427,
                              "y": 3507
                            },
                            {
                              "x": 1476,
                              "y": 3515
                            },
                            {
                              "x": 1465,
                              "y": 3581
                            },
                            {
                              "x": 1416,
                              "y": 3573
                            }
                          ]
                        },
                        "confidence": 0.98813075,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1465,
                              "y": 3514
                            },
                            {
                              "x": 1518,
                              "y": 3523
                            },
                            {
                              "x": 1507,
                              "y": 3588
                            },
                            {
                              "x": 1454,
                              "y": 3579
                            }
                          ]
                        },
                        "confidence": 0.9718345,
                        "text": "z"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1512,
                              "y": 3519
                            },
                            {
                              "x": 1558,
                              "y": 3526
                            },
                            {
                              "x": 1548,
                              "y": 3592
                            },
                            {
                              "x": 1502,
                              "y": 3584
                            }
                          ]
                        },
                        "confidence": 0.9618632,
                        "text": "a"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1552,
                              "y": 3523
                            },
                            {
                              "x": 1601,
                              "y": 3531
                            },
                            {
                              "x": 1590,
                              "y": 3600
                            },
                            {
                              "x": 1541,
                              "y": 3592
                            }
                          ]
                        },
                        "confidence": 0.7010837,
                        "text": "m"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1592,
                              "y": 3529
                            },
                            {
                              "x": 1642,
                              "y": 3537
                            },
                            {
                              "x": 1630,
                              "y": 3616
                            },
                            {
                              "x": 1580,
                              "y": 3608
                            }
                          ]
                        },
                        "confidence": 0.946455,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "y"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1672,
                          "y": 3536
                        },
                        {
                          "x": 2021,
                          "y": 3596
                        },
                        {
                          "x": 2006,
                          "y": 3682
                        },
                        {
                          "x": 1657,
                          "y": 3623
                        }
                      ]
                    },
                    "confidence": 0.9009611,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "pl"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1671,
                              "y": 3541
                            },
                            {
                              "x": 1723,
                              "y": 3549
                            },
                            {
                              "x": 1711,
                              "y": 3628
                            },
                            {
                              "x": 1659,
                              "y": 3620
                            }
                          ]
                        },
                        "confidence": 0.96492684,
                        "text": "p"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1718,
                              "y": 3548
                            },
                            {
                              "x": 1768,
                              "y": 3556
                            },
                            {
                              "x": 1757,
                              "y": 3625
                            },
                            {
                              "x": 1707,
                              "y": 3617
                            }
                          ]
                        },
                        "confidence": 0.96619916,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1756,
                              "y": 3557
                            },
                            {
                              "x": 1805,
                              "y": 3565
                            },
                            {
                              "x": 1794,
                              "y": 3632
                            },
                            {
                              "x": 1745,
                              "y": 3624
                            }
                          ]
                        },
                        "confidence": 0.8907503,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1803,
                              "y": 3568
                            },
                            {
                              "x": 1845,
                              "y": 3575
                            },
                            {
                              "x": 1835,
                              "y": 3640
                            },
                            {
                              "x": 1792,
                              "y": 3633
                            }
                          ]
                        },
                        "confidence": 0.91039145,
                        "text": "o"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1842,
                              "y": 3577
                            },
                            {
                              "x": 1887,
                              "y": 3584
                            },
                            {
                              "x": 1877,
                              "y": 3651
                            },
                            {
                              "x": 1831,
                              "y": 3644
                            }
                          ]
                        },
                        "confidence": 0.66361725,
                        "text": "w"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1882,
                              "y": 3586
                            },
                            {
                              "x": 1931,
                              "y": 3594
                            },
                            {
                              "x": 1921,
                              "y": 3659
                            },
                            {
                              "x": 1871,
                              "y": 3651
                            }
                          ]
                        },
                        "confidence": 0.9244966,
                        "text": "n"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1927,
                              "y": 3580
                            },
                            {
                              "x": 1974,
                              "y": 3588
                            },
                            {
                              "x": 1960,
                              "y": 3670
                            },
                            {
                              "x": 1913,
                              "y": 3662
                            }
                          ]
                        },
                        "confidence": 0.89841413,
                        "text": "i"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1964,
                              "y": 3604
                            },
                            {
                              "x": 2018,
                              "y": 3616
                            },
                            {
                              "x": 2003,
                              "y": 3681
                            },
                            {
                              "x": 1949,
                              "y": 3669
                            }
                          ]
                        },
                        "confidence": 0.98889315,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "e"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "blockType": "TEXT",
            "boundingBox": {
              "vertices": [
                {
                  "x": 1264,
                  "y": 3577
                },
                {
                  "x": 1719,
                  "y": 3629
                },
                {
                  "x": 1708,
                  "y": 3728
                },
                {
                  "x": 1253,
                  "y": 3675
                }
              ]
            },
            "confidence": 0.92132366,
            "paragraphs": [
              {
                "boundingBox": {
                  "vertices": [
                    {
                      "x": 1264,
                      "y": 3577
                    },
                    {
                      "x": 1719,
                      "y": 3629
                    },
                    {
                      "x": 1708,
                      "y": 3728
                    },
                    {
                      "x": 1253,
                      "y": 3675
                    }
                  ]
                },
                "confidence": 0.92132366,
                "words": [
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1264,
                          "y": 3578
                        },
                        {
                          "x": 1351,
                          "y": 3588
                        },
                        {
                          "x": 1340,
                          "y": 3685
                        },
                        {
                          "x": 1253,
                          "y": 3675
                        }
                      ]
                    },
                    "confidence": 0.9425738,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1264,
                              "y": 3578
                            },
                            {
                              "x": 1312,
                              "y": 3583
                            },
                            {
                              "x": 1301,
                              "y": 3681
                            },
                            {
                              "x": 1253,
                              "y": 3675
                            }
                          ]
                        },
                        "confidence": 0.93222505,
                        "text": "N"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1308,
                              "y": 3583
                            },
                            {
                              "x": 1352,
                              "y": 3588
                            },
                            {
                              "x": 1341,
                              "y": 3685
                            },
                            {
                              "x": 1297,
                              "y": 3680
                            }
                          ]
                        },
                        "confidence": 0.9529225,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "r"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1389,
                          "y": 3591
                        },
                        {
                          "x": 1513,
                          "y": 3605
                        },
                        {
                          "x": 1502,
                          "y": 3704
                        },
                        {
                          "x": 1378,
                          "y": 3689
                        }
                      ]
                    },
                    "confidence": 0.95486367,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1389,
                              "y": 3592
                            },
                            {
                              "x": 1434,
                              "y": 3597
                            },
                            {
                              "x": 1423,
                              "y": 3694
                            },
                            {
                              "x": 1378,
                              "y": 3689
                            }
                          ]
                        },
                        "confidence": 0.9821187,
                        "text": "s"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1430,
                              "y": 3597
                            },
                            {
                              "x": 1474,
                              "y": 3602
                            },
                            {
                              "x": 1463,
                              "y": 3699
                            },
                            {
                              "x": 1419,
                              "y": 3694
                            }
                          ]
                        },
                        "confidence": 0.95453084,
                        "text": "y"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1472,
                              "y": 3601
                            },
                            {
                              "x": 1514,
                              "y": 3606
                            },
                            {
                              "x": 1503,
                              "y": 3703
                            },
                            {
                              "x": 1461,
                              "y": 3698
                            }
                          ]
                        },
                        "confidence": 0.92794144,
                        "text": "s"
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1521,
                          "y": 3607
                        },
                        {
                          "x": 1543,
                          "y": 3610
                        },
                        {
                          "x": 1532,
                          "y": 3707
                        },
                        {
                          "x": 1510,
                          "y": 3704
                        }
                      ]
                    },
                    "confidence": 0.5642742,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1521,
                              "y": 3607
                            },
                            {
                              "x": 1543,
                              "y": 3610
                            },
                            {
                              "x": 1532,
                              "y": 3707
                            },
                            {
                              "x": 1510,
                              "y": 3704
                            }
                          ]
                        },
                        "confidence": 0.5642742,
                        "property": {
                          "detectedBreak": {
                            "type": "SPACE"
                          }
                        },
                        "text": "."
                      }
                    ]
                  },
                  {
                    "boundingBox": {
                      "vertices": [
                        {
                          "x": 1598,
                          "y": 3616
                        },
                        {
                          "x": 1719,
                          "y": 3630
                        },
                        {
                          "x": 1708,
                          "y": 3727
                        },
                        {
                          "x": 1587,
                          "y": 3713
                        }
                      ]
                    },
                    "confidence": 0.9926334,
                    "property": {
                      "detectedLanguages": [
                        {
                          "confidence": 1,
                          "languageCode": "en"
                        }
                      ]
                    },
                    "symbols": [
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1598,
                              "y": 3616
                            },
                            {
                              "x": 1636,
                              "y": 3620
                            },
                            {
                              "x": 1625,
                              "y": 3718
                            },
                            {
                              "x": 1587,
                              "y": 3713
                            }
                          ]
                        },
                        "confidence": 0.9894312,
                        "text": "1"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1628,
                              "y": 3619
                            },
                            {
                              "x": 1680,
                              "y": 3625
                            },
                            {
                              "x": 1668,
                              "y": 3722
                            },
                            {
                              "x": 1617,
                              "y": 3716
                            }
                          ]
                        },
                        "confidence": 0.9976347,
                        "text": "4"
                      },
                      {
                        "boundingBox": {
                          "vertices": [
                            {
                              "x": 1675,
                              "y": 3625
                            },
                            {
                              "x": 1719,
                              "y": 3630
                            },
                            {
                              "x": 1708,
                              "y": 3727
                            },
                            {
                              "x": 1664,
                              "y": 3722
                            }
                          ]
                        },
                        "confidence": 0.9908343,
                        "property": {
                          "detectedBreak": {
                            "type": "LINE_BREAK"
                          }
                        },
                        "text": "9"
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ],
        "confidence": 0.95789003,
        "height": 4032,
        "property": {
          "detectedLanguages": [
            {
              "confidence": 0.40643,
              "languageCode": "pl"
            },
            {
              "confidence": 0.22004028,
              "languageCode": "en"
            },
            {
              "confidence": 0.07551908,
              "languageCode": "fr"
            },
            {
              "confidence": 0.02986102,
              "languageCode": "id"
            },
            {
              "confidence": 0.024272101,
              "languageCode": "mi"
            },
            {
              "confidence": 0.015719058,
              "languageCode": "ro"
            }
          ]
        },
        "width": 3024
      }
    ],
    "text": "Charlotte\nChleb i Wino\nPlac Szczepański 2\n31-011 Kraków\nMaison Charlotte Sp. z o.0.\nul. Piękna 11B/2\n00-549 Warszawa\nNIP 7010251730\nnr:92235\nPARAGON FISKALNY\nCroissant Fourre.B\nCH LAVANDE ROSEE.A\n0,5L Cabernet Sauv.A\nCroissant malinowy.B\nSPRZEDAZ OPODATKOWANA A\nSPRZEDAZ OPODATKOWANA B\nPTU A 23%\n1 x10,00 10,00B\n1 x12,00 12,00A\n1 x43,00 43,00A\n1 x7,00 7,00B\n55,00\n17,00\n10.28\nPTU B 8%\nSUMA PTU\n1,26\n11,54\nSUMA PLN\nROZLICZENIE PŁATNOŚCI\n72,00\nKARTA Karta\n00113 #POS18 KACPER\nS:61\n72,00 PLN\n2023-02-22 21:21\nE7A46ADBA809FC694EC0057351DA506E50802270\nEAO 2001632052\nDziekujemy - Zapraszamy ponownie\nNr sys. 149"
  },
  "imagePropertiesAnnotation": {
    "cropHints": [
      {
        "boundingPoly": {
          "vertices": [
            {
              "y": 126
            },
            {
              "x": 3023,
              "y": 126
            },
            {
              "x": 3023,
              "y": 3906
            },
            {
              "y": 3906
            }
          ]
        },
        "confidence": 0.47916666,
        "importanceFraction": 1
      },
      {
        "boundingPoly": {
          "vertices": [
            {
              "y": 403
            },
            {
              "x": 3023,
              "y": 403
            },
            {
              "x": 3023,
              "y": 3427
            },
            {
              "y": 3427
            }
          ]
        },
        "confidence": 0.59375,
        "importanceFraction": 0.99130434
      },
      {
        "boundingPoly": {
          "vertices": [
            {
              "y": 756
            },
            {
              "x": 3023,
              "y": 756
            },
            {
              "x": 3023,
              "y": 3276
            },
            {
              "y": 3276
            }
          ]
        },
        "confidence": 0.625,
        "importanceFraction": 0.8695652
      }
    ],
    "dominantColors": {
      "colors": [
        {
          "color": {
            "blue": 101,
            "green": 118,
            "red": 135
          },
          "hex": "877665",
          "percent": 53.78932953176214,
          "percentRounded": 54,
          "pixelFraction": 0.25817108,
          "rgb": "135, 118,\n 101",
          "score": 0.53702587
        },
        {
          "color": {
            "blue": 21,
            "green": 33,
            "red": 68
          },
          "hex": "442115",
          "percent": 1.0284687442408424,
          "percentRounded": 1,
          "pixelFraction": 0.054867256,
          "rgb": "68, 33,\n 21",
          "score": 0.010268102
        },
        {
          "color": {
            "blue": 131,
            "green": 149,
            "red": 167
          },
          "hex": "A79583",
          "percent": 32.69616997367918,
          "percentRounded": 33,
          "pixelFraction": 0.2101475,
          "rgb": "167, 149,\n 131",
          "score": 0.32643443
        },
        {
          "color": {
            "blue": 70,
            "green": 86,
            "red": 103
          },
          "hex": "675646",
          "percent": 9.93437651890644,
          "percentRounded": 10,
          "pixelFraction": 0.11575221,
          "rgb": "103, 86,\n 70",
          "score": 0.09918356
        },
        {
          "color": {
            "blue": 63,
            "green": 78,
            "red": 110
          },
          "hex": "6E4E3F",
          "percent": 0.7936293340919864,
          "percentRounded": 1,
          "pixelFraction": 0.055221237,
          "rgb": "110, 78,\n 63",
          "score": 0.007923495
        },
        {
          "color": {
            "blue": 155,
            "green": 175,
            "red": 195
          },
          "hex": "C3AF9B",
          "percent": 0.6259959026269946,
          "percentRounded": 1,
          "pixelFraction": 0.0073746312,
          "rgb": "195, 175,\n 155",
          "score": 0.006249864
        },
        {
          "color": {
            "blue": 37,
            "green": 53,
            "red": 67
          },
          "hex": "433525",
          "percent": 0.5420835226229883,
          "percentRounded": 1,
          "pixelFraction": 0.04879056,
          "rgb": "67, 53,\n 37",
          "score": 0.0054120934
        },
        {
          "color": {
            "blue": 94,
            "green": 109,
            "red": 150
          },
          "hex": "966D5E",
          "percent": 0.3253984187358227,
          "percentRounded": 0,
          "pixelFraction": 0.020825958,
          "rgb": "150, 109,\n 94",
          "score": 0.0032487367
        },
        {
          "color": {
            "blue": 11,
            "green": 24,
            "red": 54
          },
          "hex": "36180B",
          "percent": 0.185166385712951,
          "percentRounded": 0,
          "pixelFraction": 0.0061946902,
          "rgb": "54, 24,\n 11",
          "score": 0.0018486778
        },
        {
          "color": {
            "blue": 17,
            "green": 31,
            "red": 40
          },
          "hex": "281F11",
          "percent": 0.07938166762063548,
          "percentRounded": 0,
          "pixelFraction": 0.010265486,
          "rgb": "40, 31,\n 17",
          "score": 0.00079253654
        }
      ]
    }
  },
  "labelAnnotations": [
    {
      "description": "Receipt",
      "mid": "/m/04gcl9",
      "score": 0.98708,
      "topicality": 0.80969805
    },
    {
      "description": "Font",
      "mid": "/m/03gq5hm",
      "score": 0.89829296,
      "topicality": 0.00011102967
    },
    {
      "description": "Number",
      "mid": "/m/05fwb",
      "score": 0.88708675,
      "topicality": 0.0007195818
    },
    {
      "description": "Paper",
      "mid": "/m/0641k",
      "score": 0.82256335,
      "topicality": 0.0007445732
    },
    {
      "description": "Document",
      "mid": "/m/015bv3",
      "score": 0.5071358,
      "topicality": 0.00028226458
    },
    {
      "description": "Restaurant menu",
      "mid": "/m/024gjb",
      "score": 0.5037422,
      "topicality": 0.24527156
    }
  ],
  "safeSearchAnnotation": {
    "adult": "VERY_UNLIKELY",
    "medical": "UNLIKELY",
    "racy": "UNLIKELY",
    "spoof": "UNLIKELY",
    "violence": "VERY_UNLIKELY"
  },
  "textAnnotations": [
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 648,
            "y": 411
          },
          {
            "x": 2420,
            "y": 411
          },
          {
            "x": 2420,
            "y": 3728
          },
          {
            "x": 648,
            "y": 3728
          }
        ]
      },

      "locale": "pl"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1125,
            "y": 414
          },
          {
            "x": 1879,
            "y": 449
          },
          {
            "x": 1874,
            "y": 551
          },
          {
            "x": 1120,
            "y": 516
          }
        ]
      },
      "description": "Charlotte"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1032,
            "y": 524
          },
          {
            "x": 1456,
            "y": 567
          },
          {
            "x": 1448,
            "y": 644
          },
          {
            "x": 1024,
            "y": 602
          }
        ]
      },
      "description": "Chleb"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1566,
            "y": 568
          },
          {
            "x": 1609,
            "y": 570
          },
          {
            "x": 1606,
            "y": 646
          },
          {
            "x": 1563,
            "y": 644
          }
        ]
      },
      "description": "i"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1709,
            "y": 569
          },
          {
            "x": 2047,
            "y": 555
          },
          {
            "x": 2050,
            "y": 637
          },
          {
            "x": 1712,
            "y": 651
          }
        ]
      },
      "description": "Wino"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1156,
            "y": 645
          },
          {
            "x": 1341,
            "y": 664
          },
          {
            "x": 1332,
            "y": 747
          },
          {
            "x": 1147,
            "y": 728
          }
        ]
      },
      "description": "Plac"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1364,
            "y": 665
          },
          {
            "x": 1833,
            "y": 671
          },
          {
            "x": 1832,
            "y": 778
          },
          {
            "x": 1363,
            "y": 772
          }
        ]
      },
      "description": "Szczepański"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1872,
            "y": 663
          },
          {
            "x": 1935,
            "y": 659
          },
          {
            "x": 1940,
            "y": 746
          },
          {
            "x": 1877,
            "y": 750
          }
        ]
      },
      "description": "2"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1243,
            "y": 762
          },
          {
            "x": 1505,
            "y": 771
          },
          {
            "x": 1502,
            "y": 861
          },
          {
            "x": 1240,
            "y": 852
          }
        ]
      },
      "description": "31-011"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1537,
            "y": 772
          },
          {
            "x": 1804,
            "y": 781
          },
          {
            "x": 1801,
            "y": 871
          },
          {
            "x": 1534,
            "y": 862
          }
        ]
      },
      "description": "Kraków"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 939,
            "y": 964
          },
          {
            "x": 1201,
            "y": 971
          },
          {
            "x": 1198,
            "y": 1089
          },
          {
            "x": 936,
            "y": 1082
          }
        ]
      },
      "description": "Maison"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1242,
            "y": 972
          },
          {
            "x": 1638,
            "y": 982
          },
          {
            "x": 1635,
            "y": 1100
          },
          {
            "x": 1239,
            "y": 1090
          }
        ]
      },
      "description": "Charlotte"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1661,
            "y": 983
          },
          {
            "x": 1754,
            "y": 985
          },
          {
            "x": 1751,
            "y": 1102
          },
          {
            "x": 1658,
            "y": 1100
          }
        ]
      },
      "description": "Sp"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1760,
            "y": 985
          },
          {
            "x": 1787,
            "y": 986
          },
          {
            "x": 1784,
            "y": 1103
          },
          {
            "x": 1757,
            "y": 1102
          }
        ]
      },
      "description": "."
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1832,
            "y": 987
          },
          {
            "x": 1886,
            "y": 988
          },
          {
            "x": 1883,
            "y": 1105
          },
          {
            "x": 1829,
            "y": 1104
          }
        ]
      },
      "description": "z"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1917,
            "y": 989
          },
          {
            "x": 2057,
            "y": 993
          },
          {
            "x": 2054,
            "y": 1111
          },
          {
            "x": 1914,
            "y": 1107
          }
        ]
      },
      "description": "o.0"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2062,
            "y": 993
          },
          {
            "x": 2086,
            "y": 994
          },
          {
            "x": 2083,
            "y": 1111
          },
          {
            "x": 2059,
            "y": 1110
          }
        ]
      },
      "description": "."
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1193,
            "y": 1101
          },
          {
            "x": 1290,
            "y": 1101
          },
          {
            "x": 1290,
            "y": 1199
          },
          {
            "x": 1193,
            "y": 1199
          }
        ]
      },
      "description": "ul"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1289,
            "y": 1101
          },
          {
            "x": 1318,
            "y": 1101
          },
          {
            "x": 1318,
            "y": 1199
          },
          {
            "x": 1289,
            "y": 1199
          }
        ]
      },
      "description": "."
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1361,
            "y": 1101
          },
          {
            "x": 1625,
            "y": 1102
          },
          {
            "x": 1625,
            "y": 1201
          },
          {
            "x": 1361,
            "y": 1200
          }
        ]
      },
      "description": "Piękna"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1667,
            "y": 1103
          },
          {
            "x": 1800,
            "y": 1104
          },
          {
            "x": 1800,
            "y": 1202
          },
          {
            "x": 1667,
            "y": 1201
          }
        ]
      },
      "description": "11B"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1796,
            "y": 1103
          },
          {
            "x": 1842,
            "y": 1103
          },
          {
            "x": 1842,
            "y": 1201
          },
          {
            "x": 1796,
            "y": 1201
          }
        ]
      },
      "description": "/"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1832,
            "y": 1104
          },
          {
            "x": 1884,
            "y": 1104
          },
          {
            "x": 1884,
            "y": 1202
          },
          {
            "x": 1832,
            "y": 1202
          }
        ]
      },
      "description": "2"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1199,
            "y": 1214
          },
          {
            "x": 1456,
            "y": 1217
          },
          {
            "x": 1455,
            "y": 1308
          },
          {
            "x": 1198,
            "y": 1305
          }
        ]
      },
      "description": "00-549"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1492,
            "y": 1218
          },
          {
            "x": 1836,
            "y": 1222
          },
          {
            "x": 1835,
            "y": 1313
          },
          {
            "x": 1491,
            "y": 1309
          }
        ]
      },
      "description": "Warszawa"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 670,
            "y": 1289
          },
          {
            "x": 804,
            "y": 1296
          },
          {
            "x": 799,
            "y": 1391
          },
          {
            "x": 665,
            "y": 1384
          }
        ]
      },
      "description": "NIP"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 847,
            "y": 1298
          },
          {
            "x": 1289,
            "y": 1321
          },
          {
            "x": 1285,
            "y": 1416
          },
          {
            "x": 842,
            "y": 1393
          }
        ]
      },
      "description": "7010251730"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2042,
            "y": 1319
          },
          {
            "x": 2155,
            "y": 1311
          },
          {
            "x": 2161,
            "y": 1398
          },
          {
            "x": 2049,
            "y": 1407
          }
        ]
      },
      "description": "nr"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2139,
            "y": 1312
          },
          {
            "x": 2188,
            "y": 1308
          },
          {
            "x": 2194,
            "y": 1395
          },
          {
            "x": 2145,
            "y": 1399
          }
        ]
      },
      "description": ":"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2178,
            "y": 1309
          },
          {
            "x": 2414,
            "y": 1291
          },
          {
            "x": 2421,
            "y": 1378
          },
          {
            "x": 2184,
            "y": 1396
          }
        ]
      },
      "description": "92235"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 855,
            "y": 1421
          },
          {
            "x": 1441,
            "y": 1421
          },
          {
            "x": 1441,
            "y": 1528
          },
          {
            "x": 855,
            "y": 1528
          }
        ]
      },
      "description": "PARAGON"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1540,
            "y": 1421
          },
          {
            "x": 2225,
            "y": 1421
          },
          {
            "x": 2225,
            "y": 1528
          },
          {
            "x": 1540,
            "y": 1528
          }
        ]
      },
      "description": "FISKALNY"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 671,
            "y": 1523
          },
          {
            "x": 1068,
            "y": 1537
          },
          {
            "x": 1065,
            "y": 1629
          },
          {
            "x": 668,
            "y": 1615
          }
        ]
      },
      "description": "Croissant"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1111,
            "y": 1538
          },
          {
            "x": 1452,
            "y": 1550
          },
          {
            "x": 1449,
            "y": 1642
          },
          {
            "x": 1108,
            "y": 1630
          }
        ]
      },
      "description": "Fourre.B"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 673,
            "y": 1638
          },
          {
            "x": 760,
            "y": 1640
          },
          {
            "x": 758,
            "y": 1733
          },
          {
            "x": 671,
            "y": 1731
          }
        ]
      },
      "description": "CH"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 806,
            "y": 1642
          },
          {
            "x": 1112,
            "y": 1650
          },
          {
            "x": 1109,
            "y": 1742
          },
          {
            "x": 804,
            "y": 1734
          }
        ]
      },
      "description": "LAVANDE"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1157,
            "y": 1651
          },
          {
            "x": 1452,
            "y": 1659
          },
          {
            "x": 1449,
            "y": 1752
          },
          {
            "x": 1155,
            "y": 1744
          }
        ]
      },
      "description": "ROSEE.A"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 672,
            "y": 1751
          },
          {
            "x": 859,
            "y": 1752
          },
          {
            "x": 859,
            "y": 1856
          },
          {
            "x": 672,
            "y": 1855
          }
        ]
      },
      "description": "0,5L"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 895,
            "y": 1752
          },
          {
            "x": 1240,
            "y": 1753
          },
          {
            "x": 1240,
            "y": 1857
          },
          {
            "x": 895,
            "y": 1856
          }
        ]
      },
      "description": "Cabernet"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1277,
            "y": 1753
          },
          {
            "x": 1535,
            "y": 1754
          },
          {
            "x": 1535,
            "y": 1858
          },
          {
            "x": 1277,
            "y": 1857
          }
        ]
      },
      "description": "Sauv.A"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 669,
            "y": 1859
          },
          {
            "x": 1064,
            "y": 1869
          },
          {
            "x": 1061,
            "y": 1972
          },
          {
            "x": 666,
            "y": 1962
          }
        ]
      },
      "description": "Croissant"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1113,
            "y": 1871
          },
          {
            "x": 1531,
            "y": 1882
          },
          {
            "x": 1528,
            "y": 1984
          },
          {
            "x": 1110,
            "y": 1973
          }
        ]
      },
      "description": "malinowy.B"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 672,
            "y": 2033
          },
          {
            "x": 1023,
            "y": 2036
          },
          {
            "x": 1022,
            "y": 2125
          },
          {
            "x": 671,
            "y": 2122
          }
        ]
      },
      "description": "SPRZEDAZ"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1067,
            "y": 2036
          },
          {
            "x": 1571,
            "y": 2040
          },
          {
            "x": 1570,
            "y": 2129
          },
          {
            "x": 1066,
            "y": 2125
          }
        ]
      },
      "description": "OPODATKOWANA"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1612,
            "y": 2040
          },
          {
            "x": 1650,
            "y": 2040
          },
          {
            "x": 1649,
            "y": 2128
          },
          {
            "x": 1611,
            "y": 2128
          }
        ]
      },
      "description": "A"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 670,
            "y": 2144
          },
          {
            "x": 1022,
            "y": 2146
          },
          {
            "x": 1022,
            "y": 2237
          },
          {
            "x": 670,
            "y": 2235
          }
        ]
      },
      "description": "SPRZEDAZ"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1067,
            "y": 2146
          },
          {
            "x": 1569,
            "y": 2149
          },
          {
            "x": 1569,
            "y": 2240
          },
          {
            "x": 1067,
            "y": 2237
          }
        ]
      },
      "description": "OPODATKOWANA"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1611,
            "y": 2150
          },
          {
            "x": 1651,
            "y": 2150
          },
          {
            "x": 1651,
            "y": 2240
          },
          {
            "x": 1611,
            "y": 2240
          }
        ]
      },
      "description": "B"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 671,
            "y": 2257
          },
          {
            "x": 801,
            "y": 2256
          },
          {
            "x": 802,
            "y": 2343
          },
          {
            "x": 672,
            "y": 2344
          }
        ]
      },
      "description": "PTU"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 844,
            "y": 2256
          },
          {
            "x": 890,
            "y": 2256
          },
          {
            "x": 891,
            "y": 2342
          },
          {
            "x": 845,
            "y": 2342
          }
        ]
      },
      "description": "A"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 930,
            "y": 2255
          },
          {
            "x": 1019,
            "y": 2254
          },
          {
            "x": 1020,
            "y": 2340
          },
          {
            "x": 931,
            "y": 2341
          }
        ]
      },
      "description": "23"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1014,
            "y": 2255
          },
          {
            "x": 1068,
            "y": 2255
          },
          {
            "x": 1069,
            "y": 2341
          },
          {
            "x": 1015,
            "y": 2341
          }
        ]
      },
      "description": "%"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1747,
            "y": 1548
          },
          {
            "x": 1786,
            "y": 1546
          },
          {
            "x": 1791,
            "y": 1644
          },
          {
            "x": 1752,
            "y": 1646
          }
        ]
      },
      "description": "1"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1818,
            "y": 1544
          },
          {
            "x": 2090,
            "y": 1531
          },
          {
            "x": 2094,
            "y": 1629
          },
          {
            "x": 1823,
            "y": 1642
          }
        ]
      },
      "description": "x10,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2138,
            "y": 1529
          },
          {
            "x": 2403,
            "y": 1516
          },
          {
            "x": 2407,
            "y": 1614
          },
          {
            "x": 2143,
            "y": 1627
          }
        ]
      },
      "description": "10,00B"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1742,
            "y": 1662
          },
          {
            "x": 1787,
            "y": 1660
          },
          {
            "x": 1790,
            "y": 1755
          },
          {
            "x": 1745,
            "y": 1757
          }
        ]
      },
      "description": "1"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1819,
            "y": 1659
          },
          {
            "x": 2092,
            "y": 1650
          },
          {
            "x": 2095,
            "y": 1745
          },
          {
            "x": 1822,
            "y": 1754
          }
        ]
      },
      "description": "x12,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2134,
            "y": 1648
          },
          {
            "x": 2405,
            "y": 1639
          },
          {
            "x": 2408,
            "y": 1735
          },
          {
            "x": 2137,
            "y": 1744
          }
        ]
      },
      "description": "12,00A"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1739,
            "y": 1756
          },
          {
            "x": 1780,
            "y": 1756
          },
          {
            "x": 1780,
            "y": 1859
          },
          {
            "x": 1739,
            "y": 1859
          }
        ]
      },
      "description": "1"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1825,
            "y": 1756
          },
          {
            "x": 2088,
            "y": 1757
          },
          {
            "x": 2088,
            "y": 1861
          },
          {
            "x": 1825,
            "y": 1860
          }
        ]
      },
      "description": "x43,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2127,
            "y": 1757
          },
          {
            "x": 2401,
            "y": 1758
          },
          {
            "x": 2401,
            "y": 1862
          },
          {
            "x": 2127,
            "y": 1861
          }
        ]
      },
      "description": "43,00A"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1828,
            "y": 1883
          },
          {
            "x": 1870,
            "y": 1882
          },
          {
            "x": 1872,
            "y": 1976
          },
          {
            "x": 1830,
            "y": 1977
          }
        ]
      },
      "description": "1"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1900,
            "y": 1881
          },
          {
            "x": 2130,
            "y": 1877
          },
          {
            "x": 2132,
            "y": 1972
          },
          {
            "x": 1902,
            "y": 1976
          }
        ]
      },
      "description": "x7,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2168,
            "y": 1876
          },
          {
            "x": 2401,
            "y": 1872
          },
          {
            "x": 2403,
            "y": 1967
          },
          {
            "x": 2170,
            "y": 1971
          }
        ]
      },
      "description": "7,00B"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2169,
            "y": 2046
          },
          {
            "x": 2401,
            "y": 2044
          },
          {
            "x": 2402,
            "y": 2143
          },
          {
            "x": 2170,
            "y": 2145
          }
        ]
      },
      "description": "55,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2176,
            "y": 2163
          },
          {
            "x": 2398,
            "y": 2162
          },
          {
            "x": 2398,
            "y": 2259
          },
          {
            "x": 2176,
            "y": 2260
          }
        ]
      },
      "description": "17,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2174,
            "y": 2281
          },
          {
            "x": 2401,
            "y": 2283
          },
          {
            "x": 2400,
            "y": 2378
          },
          {
            "x": 2173,
            "y": 2376
          }
        ]
      },
      "description": "10.28"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 670,
            "y": 2370
          },
          {
            "x": 801,
            "y": 2367
          },
          {
            "x": 803,
            "y": 2456
          },
          {
            "x": 672,
            "y": 2459
          }
        ]
      },
      "description": "PTU"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 845,
            "y": 2366
          },
          {
            "x": 890,
            "y": 2365
          },
          {
            "x": 892,
            "y": 2454
          },
          {
            "x": 847,
            "y": 2455
          }
        ]
      },
      "description": "B"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 928,
            "y": 2364
          },
          {
            "x": 967,
            "y": 2363
          },
          {
            "x": 969,
            "y": 2452
          },
          {
            "x": 930,
            "y": 2453
          }
        ]
      },
      "description": "8"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 971,
            "y": 2363
          },
          {
            "x": 1019,
            "y": 2362
          },
          {
            "x": 1021,
            "y": 2451
          },
          {
            "x": 973,
            "y": 2452
          }
        ]
      },
      "description": "%"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 670,
            "y": 2481
          },
          {
            "x": 838,
            "y": 2479
          },
          {
            "x": 839,
            "y": 2564
          },
          {
            "x": 671,
            "y": 2566
          }
        ]
      },
      "description": "SUMA"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 886,
            "y": 2478
          },
          {
            "x": 1011,
            "y": 2476
          },
          {
            "x": 1012,
            "y": 2561
          },
          {
            "x": 887,
            "y": 2563
          }
        ]
      },
      "description": "PTU"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2215,
            "y": 2400
          },
          {
            "x": 2395,
            "y": 2402
          },
          {
            "x": 2394,
            "y": 2499
          },
          {
            "x": 2214,
            "y": 2497
          }
        ]
      },
      "description": "1,26"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2171,
            "y": 2516
          },
          {
            "x": 2399,
            "y": 2526
          },
          {
            "x": 2395,
            "y": 2621
          },
          {
            "x": 2167,
            "y": 2611
          }
        ]
      },
      "description": "11,54"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 663,
            "y": 2595
          },
          {
            "x": 1010,
            "y": 2586
          },
          {
            "x": 1013,
            "y": 2717
          },
          {
            "x": 666,
            "y": 2726
          }
        ]
      },
      "description": "SUMA"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1100,
            "y": 2584
          },
          {
            "x": 1341,
            "y": 2578
          },
          {
            "x": 1344,
            "y": 2709
          },
          {
            "x": 1103,
            "y": 2715
          }
        ]
      },
      "description": "PLN"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 667,
            "y": 2791
          },
          {
            "x": 1141,
            "y": 2788
          },
          {
            "x": 1142,
            "y": 2891
          },
          {
            "x": 668,
            "y": 2894
          }
        ]
      },
      "description": "ROZLICZENIE"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1181,
            "y": 2788
          },
          {
            "x": 1549,
            "y": 2786
          },
          {
            "x": 1550,
            "y": 2889
          },
          {
            "x": 1182,
            "y": 2891
          }
        ]
      },
      "description": "PŁATNOŚCI"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1957,
            "y": 2612
          },
          {
            "x": 2398,
            "y": 2647
          },
          {
            "x": 2386,
            "y": 2798
          },
          {
            "x": 1945,
            "y": 2764
          }
        ]
      },
      "description": "72,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 663,
            "y": 2914
          },
          {
            "x": 877,
            "y": 2910
          },
          {
            "x": 879,
            "y": 3000
          },
          {
            "x": 665,
            "y": 3004
          }
        ]
      },
      "description": "KARTA"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 920,
            "y": 2908
          },
          {
            "x": 1138,
            "y": 2904
          },
          {
            "x": 1140,
            "y": 2995
          },
          {
            "x": 922,
            "y": 2999
          }
        ]
      },
      "description": "Karta"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 667,
            "y": 3007
          },
          {
            "x": 884,
            "y": 3010
          },
          {
            "x": 882,
            "y": 3132
          },
          {
            "x": 665,
            "y": 3129
          }
        ]
      },
      "description": "00113"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 929,
            "y": 3011
          },
          {
            "x": 962,
            "y": 3011
          },
          {
            "x": 960,
            "y": 3132
          },
          {
            "x": 927,
            "y": 3132
          }
        ]
      },
      "description": "#"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 975,
            "y": 3011
          },
          {
            "x": 1182,
            "y": 3014
          },
          {
            "x": 1180,
            "y": 3136
          },
          {
            "x": 973,
            "y": 3133
          }
        ]
      },
      "description": "POS18"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1226,
            "y": 3015
          },
          {
            "x": 1480,
            "y": 3018
          },
          {
            "x": 1478,
            "y": 3139
          },
          {
            "x": 1224,
            "y": 3136
          }
        ]
      },
      "description": "KACPER"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1677,
            "y": 3021
          },
          {
            "x": 1735,
            "y": 3022
          },
          {
            "x": 1733,
            "y": 3143
          },
          {
            "x": 1675,
            "y": 3142
          }
        ]
      },
      "description": "S"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1734,
            "y": 3022
          },
          {
            "x": 1760,
            "y": 3022
          },
          {
            "x": 1758,
            "y": 3143
          },
          {
            "x": 1732,
            "y": 3143
          }
        ]
      },
      "description": ":"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1771,
            "y": 3022
          },
          {
            "x": 1851,
            "y": 3023
          },
          {
            "x": 1849,
            "y": 3145
          },
          {
            "x": 1769,
            "y": 3144
          }
        ]
      },
      "description": "61"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1987,
            "y": 2958
          },
          {
            "x": 2216,
            "y": 2990
          },
          {
            "x": 2202,
            "y": 3091
          },
          {
            "x": 1973,
            "y": 3059
          }
        ]
      },
      "description": "72,00"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2251,
            "y": 2995
          },
          {
            "x": 2390,
            "y": 3014
          },
          {
            "x": 2375,
            "y": 3115
          },
          {
            "x": 2237,
            "y": 3096
          }
        ]
      },
      "description": "PLN"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1690,
            "y": 3148
          },
          {
            "x": 2135,
            "y": 3225
          },
          {
            "x": 2118,
            "y": 3324
          },
          {
            "x": 1673,
            "y": 3247
          }
        ]
      },
      "description": "2023-02-22"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 2155,
            "y": 3229
          },
          {
            "x": 2395,
            "y": 3271
          },
          {
            "x": 2378,
            "y": 3368
          },
          {
            "x": 2138,
            "y": 3327
          }
        ]
      },
      "description": "21:21"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 664,
            "y": 3175
          },
          {
            "x": 2405,
            "y": 3339
          },
          {
            "x": 2390,
            "y": 3506
          },
          {
            "x": 648,
            "y": 3342
          }
        ]
      },
      "description": "E7A46ADBA809FC694EC0057351DA506E50802270"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1300,
            "y": 3345
          },
          {
            "x": 1439,
            "y": 3361
          },
          {
            "x": 1427,
            "y": 3469
          },
          {
            "x": 1288,
            "y": 3453
          }
        ]
      },
      "description": "EAO"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1472,
            "y": 3365
          },
          {
            "x": 1904,
            "y": 3415
          },
          {
            "x": 1892,
            "y": 3523
          },
          {
            "x": 1460,
            "y": 3473
          }
        ]
      },
      "description": "2001632052"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 656,
            "y": 3481
          },
          {
            "x": 1096,
            "y": 3472
          },
          {
            "x": 1098,
            "y": 3568
          },
          {
            "x": 658,
            "y": 3577
          }
        ]
      },
      "description": "Dziekujemy"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1131,
            "y": 3499
          },
          {
            "x": 1179,
            "y": 3497
          },
          {
            "x": 1181,
            "y": 3539
          },
          {
            "x": 1133,
            "y": 3541
          }
        ]
      },
      "description": "-"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1212,
            "y": 3457
          },
          {
            "x": 1645,
            "y": 3517
          },
          {
            "x": 1631,
            "y": 3616
          },
          {
            "x": 1198,
            "y": 3556
          }
        ]
      },
      "description": "Zapraszamy"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1672,
            "y": 3536
          },
          {
            "x": 2021,
            "y": 3596
          },
          {
            "x": 2006,
            "y": 3682
          },
          {
            "x": 1657,
            "y": 3623
          }
        ]
      },
      "description": "ponownie"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1264,
            "y": 3578
          },
          {
            "x": 1351,
            "y": 3588
          },
          {
            "x": 1340,
            "y": 3685
          },
          {
            "x": 1253,
            "y": 3675
          }
        ]
      },
      "description": "Nr"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1389,
            "y": 3591
          },
          {
            "x": 1513,
            "y": 3605
          },
          {
            "x": 1502,
            "y": 3704
          },
          {
            "x": 1378,
            "y": 3689
          }
        ]
      },
      "description": "sys"
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1521,
            "y": 3607
          },
          {
            "x": 1543,
            "y": 3610
          },
          {
            "x": 1532,
            "y": 3707
          },
          {
            "x": 1510,
            "y": 3704
          }
        ]
      },
      "description": "."
    },
    {
      "boundingPoly": {
        "vertices": [
          {
            "x": 1598,
            "y": 3616
          },
          {
            "x": 1719,
            "y": 3630
          },
          {
            "x": 1708,
            "y": 3727
          },
          {
            "x": 1587,
            "y": 3713
          }
        ]
      },
      "description": "149"
    }
  ]
}