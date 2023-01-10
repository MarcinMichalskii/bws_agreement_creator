import 'package:bws_agreement_creator/additional_employee_data.dart';
import 'package:bws_agreement_creator/address_data.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'form.g.dart';

@CopyWith()
class FormState {
  FormState({
    required this.name,
    required this.lastName,
    required this.areYouB2b,
    required this.city,
    required this.birthday,
    required this.isStudent,
    required this.worksForOtherEmployee,
    required this.companyName,
    required this.companyAddress,
    required this.companyCity,
    required this.nip,
    this.frontStudentIdImage,
    this.backStudentIdImage,
    required this.worksInOtherCompany,
    required this.otherCompanyName,
    required this.otherCompanyNip,
    required this.hasTwoAdresses,
    required this.hasRent,
    required this.hasRetiring,
    required this.rentDecisizionDate,
    required this.retiringSignature,
    required this.rentSignature,
    required this.retiringDecizionDate,
    required this.worksOnUop,
    required this.sickInsurance,
    required this.invalidStatus,
    required this.secondName,
    required this.pesel,
    required this.passportOrIdNumber,
    required this.familyName,
    required this.agreementWithTime,
    required this.agreementWithTimeStart,
    required this.agreementWithTimeEnd,
    required this.placeOfLiving,
    required this.placeOfDomicile,
    required this.schoolName,
    required this.earnsMoreThanMinimalWage,
    required this.parentName,
    required this.parentAdres,
    required this.parentPesel,
    required this.parentId,
    required this.additionalEmployees,
    required this.krs,
    required this.internetComunicator,
    required this.phoneNumber,
    required this.emailAddress,
    this.frontStudentIdData,
    this.backStudentIdData,
    required this.dontHavePesel,
    required this.representedBy,
    required this.roleOfRepresentant,
    this.frontIdData,
    this.backIdData,
    this.frontIdImage,
    this.backIdImage,
  });
  final String name;
  final String lastName;
  final bool areYouB2b;
  final String city;
  final DateTime birthday;
  final bool isStudent;
  final bool worksForOtherEmployee;
  final String companyName;
  final String nip;
  final Image? frontStudentIdImage;
  final Image? backStudentIdImage;
  final bool worksInOtherCompany;
  final String otherCompanyName;
  final String otherCompanyNip;
  final bool hasTwoAdresses;
  final bool hasRent;
  final DateTime rentDecisizionDate;
  final String rentSignature;
  final bool hasRetiring;
  final DateTime retiringDecizionDate;
  final String retiringSignature;
  final bool worksOnUop;
  final bool sickInsurance;
  final bool invalidStatus;
  final String secondName;
  final String pesel;
  final String passportOrIdNumber;
  final String familyName;
  final bool agreementWithTime;
  final DateTime agreementWithTimeStart;
  final DateTime agreementWithTimeEnd;
  final AdressData placeOfLiving;
  final AdressData placeOfDomicile;
  final String schoolName;
  final bool earnsMoreThanMinimalWage;
  final String parentName;
  final String parentAdres;
  final String parentPesel;
  final String parentId;
  final String companyAddress;
  final String companyCity;
  final List<AdditionalEmployeeData> additionalEmployees;
  final String krs;
  final String internetComunicator;
  final String phoneNumber;
  final String emailAddress;
  final Uint8List? frontStudentIdData;
  final Uint8List? backStudentIdData;
  final bool dontHavePesel;
  final String representedBy;
  final String roleOfRepresentant;
  final Uint8List? backIdData;
  final Uint8List? frontIdData;
  final Image? frontIdImage;
  final Image? backIdImage;

  bool get areBothIdNumbersEmpty {
    return pesel.isEmpty && passportOrIdNumber.isEmpty;
  }

  bool get isBasicDataEmpty {
    return (name.isEmpty ||
        lastName.isEmpty ||
        areBothIdNumbersEmpty ||
        phoneNumber.isEmpty ||
        emailAddress.isEmpty);
  }

  bool get invalidStudentData {
    return frontStudentIdImage == null ||
        backStudentIdImage == null ||
        schoolName.isEmpty;
  }

  bool get invalidOtherCompanyData {
    return otherCompanyName.isEmpty ||
        otherCompanyNip.isEmpty ||
        !otherCompanyNip.isValidNip();
  }

  bool get invalidCompanyRepresentant {
    if (representedBy.isNotEmpty && roleOfRepresentant.isNotEmpty) {
      return false;
    }
    if (representedBy.isEmpty && roleOfRepresentant.isEmpty) {
      return false;
    }

    return true;
  }

  bool get invalidB2b {
    return companyName.isEmpty ||
        nip.isEmpty ||
        !nip.isValidNip() ||
        companyAddress.isEmpty ||
        companyCity.isEmpty ||
        internetComunicator.isEmpty ||
        invalidCompanyRepresentant;
  }

  String? get validationErrorText {
    if (isBasicDataEmpty) {
      return "Sprawdź dane osobowe";
    } else if (areYouB2b && !invalidB2b) {
      return null;
    } else if (areYouB2b && invalidB2b) {
      return "Sprawdź dane Twojej firmy";
    } else if (dontHavePesel && (frontIdData == null || backIdData == null)) {
      return "Sprawdź dane dokumentu";
    } else if (placeOfDomicile.isFilledInCorrectly) {
      return "Sprawdź miejsce zameldowania";
    } else if (placeOfLiving.isFilledInCorrectly && hasTwoAdresses) {
      return "Sprawdź miejsce zamieszkania";
    } else if (isStudent && invalidStudentData) {
      return "Sprawdź dane statusu studenta";
    } else if (hasRetiring && retiringSignature.isEmpty) {
      return "Sprawdź sygnaturę emyrtury";
    } else if (hasRent && rentSignature.isEmpty) {
      return "Sprawdź sygnaturę renty";
    } else if (worksInOtherCompany && invalidOtherCompanyData) {
      return "Sprawdź czy podałeś poprawne dane firmy w której jesteś zatrudniony";
    } else {
      return null;
    }
  }
}

class FormNotifier extends StateNotifier<FormState> {
  FormNotifier()
      : super(FormState(
          name: '',
          lastName: '',
          areYouB2b: false,
          city: '',
          birthday: DateTime.now().add(Duration(days: -365 * 18 - 4)),
          isStudent: false,
          worksForOtherEmployee: false,
          companyName: '',
          nip: '',
          worksInOtherCompany: false,
          otherCompanyName: '',
          otherCompanyNip: '',
          hasTwoAdresses: false,
          hasRent: false,
          hasRetiring: false,
          rentDecisizionDate: DateTime.now(),
          rentSignature: '',
          retiringDecizionDate: DateTime.now(),
          retiringSignature: '',
          worksOnUop: false,
          sickInsurance: false,
          invalidStatus: false,
          passportOrIdNumber: '',
          pesel: '',
          secondName: '',
          familyName: '',
          agreementWithTime: false,
          agreementWithTimeStart: DateTime.now(),
          agreementWithTimeEnd: DateTime.now(),
          placeOfLiving: AdressData(),
          placeOfDomicile: AdressData(),
          schoolName: '',
          earnsMoreThanMinimalWage: false,
          parentName: '',
          parentAdres: '',
          parentPesel: '',
          parentId: '',
          companyAddress: '',
          companyCity: '',
          additionalEmployees: [],
          krs: '',
          phoneNumber: '',
          emailAddress: '',
          internetComunicator: '',
          backStudentIdData: null,
          frontStudentIdData: null,
          dontHavePesel: false,
          representedBy: '',
          roleOfRepresentant: '',
        ));

  static final provider =
      StateNotifierProvider.autoDispose<FormNotifier, FormState>((ref) {
    return FormNotifier();
  });

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setLastName(String value) {
    state = state.copyWith(lastName: value);
  }

  void setAreYouB2B(bool value) {
    state = state.copyWith(areYouB2b: value);
  }

  void setCity(String value) {
    state = state.copyWith(city: value);
  }

  void setCompanyName(String value) {
    state = state.copyWith(companyName: value);
  }

  void setCompanyNip(String value) {
    state = state.copyWith(nip: value);
  }

  void setCompanyCity(String value) {
    state = state.copyWith(companyCity: value);
  }

  void setCompanyAddress(String value) {
    state = state.copyWith(companyAddress: value);
  }

  void setBirthDay(DateTime value) {
    state = state.copyWith(birthday: value);
  }

  void setAreYouStudent(bool value) {
    state = state.copyWith(isStudent: value);
  }

  void setWorksForOtherEmployee(bool value) {
    state = state.copyWith(worksForOtherEmployee: value);
  }

  void setFrontStudentIdImage(Image? value) {
    state = state.copyWith(frontStudentIdImage: value);
  }

  void setBackStudentIdImage(Image? value) {
    state = state.copyWith(backStudentIdImage: value);
  }

  void setWorksInOtherCompany(bool value) {
    state = state.copyWith(worksInOtherCompany: value);
  }

  void setOtherCompanyNip(String value) {
    state = state.copyWith(otherCompanyNip: value);
  }

  void setOtherCompanyName(String value) {
    state = state.copyWith(otherCompanyName: value);
  }

  void setHasTwoAdresses(bool value) {
    state = state.copyWith(hasTwoAdresses: value);
  }

  void setHasRent(bool value) {
    state = state.copyWith(hasRent: value);
  }

  void setHasRetiring(bool value) {
    state = state.copyWith(hasRetiring: value);
  }

  void setRentSignature(String value) {
    state = state.copyWith(rentSignature: value);
  }

  void setRentDecisionDate(DateTime value) {
    state = state.copyWith(rentDecisizionDate: value);
  }

  void setRetiringSignature(String value) {
    state = state.copyWith(retiringSignature: value);
  }

  void setRetiringDecisionDate(DateTime value) {
    state = state.copyWith(retiringDecizionDate: value);
  }

  void setWorksOnUop(bool value) {
    state = state.copyWith(worksOnUop: value);
  }

  void setSickInsurance(bool value) {
    state = state.copyWith(sickInsurance: value);
  }

  void setInvalidStatus(bool value) {
    state = state.copyWith(invalidStatus: value);
  }

  void setSecondName(String value) {
    state = state.copyWith(secondName: value);
  }

  void setFamilyName(String value) {
    state = state.copyWith(familyName: value);
  }

  void setPesel(String value) {
    state = state.copyWith(pesel: value);
  }

  void setPassportOrId(String value) {
    state = state.copyWith(passportOrIdNumber: value);
  }

  void setAgreementWithTime(bool value) {
    state = state.copyWith(agreementWithTime: value);
  }

  void setEarnsMoreThanMinimalWage(bool value) {
    state = state.copyWith(earnsMoreThanMinimalWage: value);
  }

  void setAgreementWithTimeStart(DateTime value) {
    state = state.copyWith(agreementWithTimeStart: value);
  }

  void setAgreementWithTimeEnd(DateTime value) {
    state = state.copyWith(agreementWithTimeEnd: value);
  }

  void setPlaceOfLiving(AdressData value) {
    state = state.copyWith(placeOfLiving: value);
  }

  void setPlaceOfDomicile(AdressData value) {
    state = state.copyWith(placeOfDomicile: value);
  }

  void setSchoolName(String value) {
    state = state.copyWith(schoolName: value);
  }

  void setParentName(String value) {
    state = state.copyWith(parentName: value);
  }

  void setParentAdres(String value) {
    state = state.copyWith(parentAdres: value);
  }

  void setParentPesel(String value) {
    state = state.copyWith(parentPesel: value);
  }

  void setParentIdNumber(String value) {
    state = state.copyWith(parentId: value);
  }

  void setAdditionalEmployee(AdditionalEmployeeData value) {
    var employees = state.additionalEmployees;
    final employeeIndex =
        employees.indexWhere((element) => element.id == value.id);

    if (employeeIndex == -1) {
      employees.add(value);
    } else {
      employees[employeeIndex] = value;
    }
    state = state.copyWith(additionalEmployees: employees);
  }

  void removeAdditionalEmployee(String id) {
    var employees = state.additionalEmployees;
    employees.removeWhere((element) => element.id == id);
    state = state.copyWith(additionalEmployees: employees);
  }

  void setKrs(String value) {
    state = state.copyWith(krs: value);
  }

  void setPhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value);
  }

  void setEmailAddress(String value) {
    state = state.copyWith(emailAddress: value);
  }

  void setInternetComunicator(String value) {
    state = state.copyWith(internetComunicator: value);
  }

  void setBackStudentIdData(Uint8List? value) {
    state = state.copyWith(backStudentIdData: value);
  }

  void setFrontStudentIdData(Uint8List? value) {
    state = state.copyWith(frontStudentIdData: value);
  }

  void setDontHavePesel(bool value) {
    state = state.copyWith(dontHavePesel: value);
  }

  void setRepresentedBy(String value) {
    state = state.copyWith(representedBy: value);
  }

  void setRoleOfRepresentant(String value) {
    state = state.copyWith(roleOfRepresentant: value);
  }

  void setBackIdData(Uint8List? value) {
    state = state.copyWith(backIdData: value);
  }

  void setFrontIdData(Uint8List? value) {
    state = state.copyWith(frontIdData: value);
  }

  void setFrontIdImage(Image? value) {
    state = state.copyWith(frontIdImage: value);
  }

  void setBackIdImage(Image? value) {
    state = state.copyWith(backIdImage: value);
  }

  String? isEmptyValidator(String? value) {
    if (value?.isEmpty == true) {
      return 'To pole nie może być puste';
    } else {
      return null;
    }
  }

  String? isValidPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null) {
      return null;
    }
    String pattern = r'^(?:[+0][1-9])?[0-9]{9,12}$';
    RegExp phoneExp = RegExp(pattern);
    if (phoneExp.hasMatch(phoneNumber)) {
      return null;
    } else {
      return "Nieprawidłowy numer telefonu";
    }
  }

  String? isValidEmail(String? email) {
    if (email == null) {
      return null;
    }
    final RegExp emailexp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    if (emailexp.hasMatch(email)) {
      return null;
    } else {
      return "Nieprawidłowy email";
    }
  }

  String? isValidZipCode(String? zipCode) {
    if (zipCode == null) {
      return null;
    }
    final RegExp regex = RegExp(r'^[0-9]{2}-[0-9]{3}$');
    if (regex.hasMatch(zipCode)) {
      return null;
    } else {
      return "Nieprawidłowy kod pocztowy";
    }
  }
}
