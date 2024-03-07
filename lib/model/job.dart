// Request
class CreateJobRequest {
  final String title;
  final String experienceTitle;
  final String description;
  final PriceDetails priceDetails;
  final String currency;
  final ExpectedDuration expectedDuration;
  final String status;


  CreateJobRequest({
    required this.title,
    required this.experienceTitle,
    required this.description,
    required this.priceDetails,
    required this.currency,
    required this.expectedDuration,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'experience_title': experienceTitle,
      'data': description,
      'price_details': priceDetails.toJson(),
      'currency': currency,
      'expected_duration': expectedDuration.toJson(),
      'status': status
    };
  }
}

//Response
class JobResponse {
  final String title;
  final String experienceTitle;
  final String data;
  final List<String> attachments;
  final PriceDetails priceDetails;
  final String currency;
  final String status;
  final String authorId;
  final ExpectedDuration expectedDuration;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  JobResponse({
    required this.title,
    required this.experienceTitle,
    required this.data,
    required this.attachments,
    required this.priceDetails,
    required this.currency,
    required this.status,
    required this.authorId,
    required this.expectedDuration,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    return JobResponse(
      title: json['title'],
      experienceTitle: json['experience_title'],
      data: json['data'],
      attachments: List<String>.from(json['attachments']),
      priceDetails: PriceDetails.fromJson(json['price_details']),
      currency: json['currency'],
      status: json['status'],
      authorId: json['author_id'],
      expectedDuration: ExpectedDuration.fromJson(json['expected_duration']),
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class PriceDetails {
  final String type;
  final String value;

  PriceDetails({
    required this.type,
    required this.value,
  });

  factory PriceDetails.fromJson(Map<String, dynamic> json) {
    return PriceDetails(
      type: json['type'],
      value: json['value'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }
}

class ExpectedDuration {
  final String days;

  ExpectedDuration({
    required this.days,
  });

  factory ExpectedDuration.fromJson(Map<String, dynamic> json) {
    return ExpectedDuration(
      days: json['days'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'days': days,
    };
  }
}
