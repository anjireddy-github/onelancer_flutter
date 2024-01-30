//Request Model
class UploadJobRequest {
  final String title;
  final String experienceTitle;
  final String data;
  final double price;
  final String currency;
  final ExpectedDuration expectedDuration;

  UploadJobRequest({
    required this.title,
    required this.experienceTitle,
    required this.data,
    required this.price,
    required this.currency,
    required this.expectedDuration,
  });

  factory UploadJobRequest.fromJson(Map<String, dynamic> json) {
    return UploadJobRequest(
      title: json['title'] as String,
      experienceTitle: json['experience_title'] as String,
      data: json['data'] as String,
      price: json['price'].toDouble(),
      currency: json['currency'] as String,
      expectedDuration: ExpectedDuration.fromJson(json['expected_duration']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'experience_title': experienceTitle,
      'data': data,
      'price': price,
      'currency': currency,
      'expected_duration': expectedDuration.toJson(),
    };
  }

  @override
  String toString() {
    return 'UploadJobRequest{title: $title, experienceTitle: $experienceTitle, data: $data, price: $price, currency: $currency, expectedDuration: $expectedDuration}';
  }
}

class ExpectedDuration {
  final int days;

  ExpectedDuration({required this.days});

  factory ExpectedDuration.fromJson(Map<String, dynamic> json) {
    return ExpectedDuration(
      days: json['days'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'days': days,
    };
  }

  @override
  String toString() {
    return 'ExpectedDuration{days: $days}';
  }
}

//Response model
class JobResponse {
  final String title;
  final String experienceTitle;
  final String data;
  final double price;
  final String currency;
  final String status;
  final String authorId;
  final ExpectedDuration expectedDuration;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  JobResponse({
    required this.title,
    required this.experienceTitle,
    required this.data,
    required this.price,
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
      title: json['title'] as String,
      experienceTitle: json['experience_title'] as String,
      data: json['data'] as String,
      price: json['price'].toDouble(),
      currency: json['currency'] as String,
      status: json['status'] as String,
      authorId: json['author_id'] as String,
      expectedDuration: ExpectedDuration.fromJson(json['expected_duration']),
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: json['__v'] as int,
    );
  }

  @override
  String toString() {
    return 'JobResponse{title: $title, experienceTitle: $experienceTitle, data: $data, price: $price, currency: $currency, status: $status, authorId: $authorId, expectedDuration: $expectedDuration, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}