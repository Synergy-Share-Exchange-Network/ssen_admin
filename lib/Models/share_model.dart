import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShareModel {
  final double savingAccountPercentage;
  final String proclamationNumber;
  final int minimumNumberOfBuyer;
  final int maximumNumberOfBuyer;
  final List<String> bankInformation;
  final List<String> shareImage;
  final double unitSharePrice;
  final double noOfShares;
  final double divident;
  final double minimumPaymentInPercent;
  final double minimumNumberOfSharesToBuy;
  final double maximumNumberOfSharesToBuy;
  String requirement;
  String identification;
  String companyID;
  String description;
  List<String> searchKeyWords;
  List<String> returnDividentDescription;
  int timeToReturnRemainPayment;
  String currency;
  String dateAdded;
  double totalSoldShares;
  bool isDeleted;
  bool isHidden;
  ShareModel({
    required this.savingAccountPercentage,
    required this.proclamationNumber,
    required this.minimumNumberOfBuyer,
    required this.maximumNumberOfBuyer,
    required this.bankInformation,
    required this.shareImage,
    required this.unitSharePrice,
    required this.noOfShares,
    required this.divident,
    required this.minimumPaymentInPercent,
    required this.minimumNumberOfSharesToBuy,
    required this.maximumNumberOfSharesToBuy,
    requirement,
    identification,
    companyID,
    description,
    searchKeyWords,
    returnDividentDescription,
    timeToReturnRemainPayment,
    currency,
    dateAdded,
    totalSoldShares,
    isDeleted,
    isHidden,
  })  : requirement = requirement ?? '',
        identification = identification ?? '',
        companyID = companyID ?? '',
        description = description ?? '',
        searchKeyWords = searchKeyWords ?? [''],
        returnDividentDescription = returnDividentDescription ?? [''],
        timeToReturnRemainPayment = timeToReturnRemainPayment ?? 0,
        currency = currency ?? '',
        dateAdded = dateAdded ?? '',
        totalSoldShares = totalSoldShares ?? 0.0,
        isDeleted = isDeleted ?? false,
        isHidden = isHidden ?? false;

  ShareModel copyWith({
    double? savingAccountPercentage,
    String? proclamationNumber,
    int? minimumNumberOfBuyer,
    int? maximumNumberOfBuyer,
    List<String>? bankInformation,
    List<String>? shareImage,
    double? unitSharePrice,
    double? noOfShares,
    double? divident,
    double? minimumPaymentInPercent,
    double? minimumNumberOfSharesToBuy,
    double? maximumNumberOfSharesToBuy,
    String? requirement,
    String? identification,
    String? companyID,
    String? description,
    List<String>? searchKeyWords,
    List<String>? returnDividentDescription,
    int? timeToReturnRemainPayment,
    String? currency,
    String? dateAdded,
    double? totalSoldShares,
    bool? isDeleted,
    bool? isHidden,
  }) {
    return ShareModel(
      savingAccountPercentage:
          savingAccountPercentage ?? this.savingAccountPercentage,
      proclamationNumber: proclamationNumber ?? this.proclamationNumber,
      minimumNumberOfBuyer: minimumNumberOfBuyer ?? this.minimumNumberOfBuyer,
      maximumNumberOfBuyer: maximumNumberOfBuyer ?? this.maximumNumberOfBuyer,
      bankInformation: bankInformation ?? this.bankInformation,
      shareImage: shareImage ?? this.shareImage,
      unitSharePrice: unitSharePrice ?? this.unitSharePrice,
      noOfShares: noOfShares ?? this.noOfShares,
      divident: divident ?? this.divident,
      minimumPaymentInPercent:
          minimumPaymentInPercent ?? this.minimumPaymentInPercent,
      minimumNumberOfSharesToBuy:
          minimumNumberOfSharesToBuy ?? this.minimumNumberOfSharesToBuy,
      maximumNumberOfSharesToBuy:
          maximumNumberOfSharesToBuy ?? this.maximumNumberOfSharesToBuy,
      requirement: requirement ?? this.requirement,
      identification: identification ?? this.identification,
      companyID: companyID ?? this.companyID,
      description: description ?? this.description,
      searchKeyWords: searchKeyWords ?? this.searchKeyWords,
      returnDividentDescription:
          returnDividentDescription ?? this.returnDividentDescription,
      timeToReturnRemainPayment:
          timeToReturnRemainPayment ?? this.timeToReturnRemainPayment,
      currency: currency ?? this.currency,
      dateAdded: dateAdded ?? this.dateAdded,
      totalSoldShares: totalSoldShares ?? this.totalSoldShares,
      isDeleted: isDeleted ?? this.isDeleted,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'savingAccountPercentage': savingAccountPercentage,
      'proclamationNumber': proclamationNumber,
      'minimumNumberOfBuyer': minimumNumberOfBuyer,
      'maximumNumberOfBuyer': maximumNumberOfBuyer,
      'bankInformation': bankInformation,
      'shareImage': shareImage,
      'unitSharePrice': unitSharePrice,
      'noOfShares': noOfShares,
      'divident': divident,
      'minimumPaymentInPercent': minimumPaymentInPercent,
      'minimumNumberOfSharesToBuy': minimumNumberOfSharesToBuy,
      'maximumNumberOfSharesToBuy': maximumNumberOfSharesToBuy,
      'requirement': requirement,
      'identification': identification,
      'companyID': companyID,
      'description': description,
      'searchKeyWords': searchKeyWords,
      'returnDividentDescription': returnDividentDescription,
      'timeToReturnRemainPayment': timeToReturnRemainPayment,
      'currency': currency,
      'dateAdded': dateAdded,
      'totalSoldShares': totalSoldShares,
      'isDeleted': isDeleted,
      'isHidden': isHidden,
    };
  }

  // factory ShareModel.fromMap(Map<String, dynamic> map) {
  //   return ShareModel(
  //     savingAccountPercentage: map['savingAccountPercentage'] as double,
  //     proclamationNumber: map['proclamationNumber'] as String,
  //     minimumNumberOfBuyer: map['minimumNumberOfBuyer'] as int,
  //     maximumNumberOfBuyer: map['maximumNumberOfBuyer'] as int,
  //     bankInformation:
  //         List<String>.from(map['bankInformation'] as List<dynamic>),
  //     shareImage: List<String>.from(map['shareImage'] as List<dynamic>),
  //     unitSharePrice: map['unitSharePrice'] as double,
  //     noOfShares: map['noOfShares'] as double,
  //     divident: map['divident'] as double,
  //     minimumPaymentInPercent: map['minimumPaymentInPercent'] as double,
  //     minimumNumberOfSharesToBuy: map['minimumNumberOfSharesToBuy'] as double,
  //     maximumNumberOfSharesToBuy: map['maximumNumberOfSharesToBuy'] as double,
  //     requirement: map['requirement'] as String,
  //     identification: map['identification'] as String,
  //     companyID: map['companyID'] as String,
  //     description: map['description'] as String,
  //     searchKeyWords: List<String>.from(map['searchKeyWords'] as List<dynamic>),
  //     returnDividentDescription:
  //         List<String>.from(map['returnDividentDescription'] as List<dynamic>),
  //     timeToReturnRemainPayment: map['timeToReturnRemainPayment'] as int,
  //     currency: map['currency'] as String,
  //     dateAdded: map['dateAdded'] as String,
  //     isDeleted: map['isDeleted'] ?? false,
  //     isHidden: map['isHidden'] ?? false,
  //   );
  // }
  factory ShareModel.fromMap(Map<String, dynamic> map) {
    return ShareModel(
      savingAccountPercentage: (map['savingAccountPercentage'] is int)
          ? (map['savingAccountPercentage'] as int).toDouble()
          : map['savingAccountPercentage'] as double,
      proclamationNumber: map['proclamationNumber'] as String,
      minimumNumberOfBuyer: map['minimumNumberOfBuyer'] as int,
      maximumNumberOfBuyer: map['maximumNumberOfBuyer'] as int,
      bankInformation: List<String>.from(
          map['bankInformation'].map((item) => item as String)),
      shareImage:
          List<String>.from(map['shareImage'].map((item) => item as String)),
      unitSharePrice: (map['unitSharePrice'] is int)
          ? (map['unitSharePrice'] as int).toDouble()
          : map['unitSharePrice'] as double,
      noOfShares: (map['noOfShares'] is int)
          ? (map['noOfShares'] as int).toDouble()
          : map['noOfShares'] as double,
      divident: (map['divident'] is int)
          ? (map['divident'] as int).toDouble()
          : map['divident'] as double,
      minimumPaymentInPercent: (map['minimumPaymentInPercent'] is int)
          ? (map['minimumPaymentInPercent'] as int).toDouble()
          : map['minimumPaymentInPercent'] as double,
      minimumNumberOfSharesToBuy: (map['minimumNumberOfSharesToBuy'] is int)
          ? (map['minimumNumberOfSharesToBuy'] as int).toDouble()
          : map['minimumNumberOfSharesToBuy'] as double,
      maximumNumberOfSharesToBuy: (map['maximumNumberOfSharesToBuy'] is int)
          ? (map['maximumNumberOfSharesToBuy'] as int).toDouble()
          : map['maximumNumberOfSharesToBuy'] as double,
      requirement: map['requirement'] as String,
      identification: map['identification'] as String,
      companyID: map['companyID'] as String,
      description: map['description'] as String,
      searchKeyWords: List<String>.from(
          map['searchKeyWords'].map((item) => item as String)),
      returnDividentDescription: List<String>.from(
          map['returnDividentDescription'].map((item) => item as String)),
      timeToReturnRemainPayment: map['timeToReturnRemainPayment'] as int,
      currency: map['currency'] as String,
      dateAdded: map['dateAdded'] as String,
      totalSoldShares: (map['totalSoldShares'] is int)
          ? (map['totalSoldShares'] as int).toDouble()
          : map['totalSoldShares'] as double,
      isDeleted: map['isDeleted'] ?? false,
      isHidden: map['isHidden'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShareModel.fromJson(String source) =>
      ShareModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShareModel(savingAccountPercentage: $savingAccountPercentage, proclamationNumber: $proclamationNumber, minimumNumberOfBuyer: $minimumNumberOfBuyer, maximumNumberOfBuyer: $maximumNumberOfBuyer, bankInformation: $bankInformation, shareImage: $shareImage, unitSharePrice: $unitSharePrice, noOfShares: $noOfShares, divident: $divident, minimumPaymentInPercent: $minimumPaymentInPercent, minimumNumberOfSharesToBuy: $minimumNumberOfSharesToBuy, maximumNumberOfSharesToBuy: $maximumNumberOfSharesToBuy, requirement: $requirement, identification: $identification, companyID: $companyID, description: $description, searchKeyWords: $searchKeyWords, returnDividentDescription: $returnDividentDescription, timeToReturnRemainPayment: $timeToReturnRemainPayment, currency: $currency, dateAdded: $dateAdded, totalSoldShares: $totalSoldShares, isDeleted: $isDeleted,isHidden: $isHidden)';
  }
}


// void main(List<String> args) {
//   ShareModel M = ShareModel(
//     savingAccountPercentage: 12,
//     proclamationNumber: "proclamationNumber",
//     minimumNumberOfBuyer: 12,
//     maximumNumberOfBuyer: 12,
//     bankInformation: ['bankInfo1', 'bankInfo2'], // Provide a list of strings
//     shareImage: ['image1', 'image2'], // Provide a list of strings
//     unitSharePrice: 10.0, // Replace with the actual value
//     noOfShares: 100.0, // Replace with the actual value
//     divident: 5.0, // Replace with the actual value
//     minimumPaymentInPercent: 10.0, // Replace with the actual value
//     minimumNumberOfSharesToBuy: 1.0, // Replace with the actual value
//     maximumNumberOfSharesToBuy: 10.0, // Replace with the actual value
//     requirement: "Requirements", // Replace with the actual value
//     description: "Description", // Replace with the actual value
//     searchKeyWords: ['keyword1', 'keyword2'], // Provide a list of strings
//     returnDividentDescription: ["1", "10"], // Replace with the actual value
//     timeToReturnRemainPayment: 60, // Replace with the actual value
//     currency: "USD", // Replace with the actual value
//     dateAdded: "121212", // Replace with the actual value
//   );

//   print(M.toString());
// }