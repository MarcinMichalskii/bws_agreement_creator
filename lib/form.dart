import 'package:bws_agreement_creator/address_data.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'form.g.dart';

@CopyWith()
class FormState {
  FormState(
      {required this.name,
      required this.lastName,
      required this.areYouB2b,
      required this.city,
      required this.birthday,
      required this.isStudent,
      required this.worksForOtherEmployee,
      required this.companyName,
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
      required this.parentId});
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
}

class FormNotifier extends StateNotifier<FormState> {
  FormNotifier()
      : super(FormState(
            name: '',
            lastName: '',
            areYouB2b: false,
            city: '',
            birthday: DateTime.now().add(Duration(days: -365 * 18 - 1)),
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
            parentId: ''));

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
    state = state.copyWith(retiringSignature: value);
  }

  void setRentDecisionDate(DateTime value) {
    state = state.copyWith(rentDecisizionDate: value);
  }

  void setRetiringSignature(String value) {
    state = state.copyWith(rentSignature: value);
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
}
