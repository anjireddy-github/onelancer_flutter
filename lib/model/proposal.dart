class CreateProposalRequest {
  final String jobId;
  final String coverLetter;
  final double price;
  final String currency;

  CreateProposalRequest({
    required this.jobId,
    required this.coverLetter,
    required this.price,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'cover_letter': coverLetter,
      'price': price,
      'currency': currency,
    };
  }

  @override
  String toString() {
    return 'CreateProposalRequest{jobId: $jobId, coverLetter: $coverLetter, price: $price, currency: $currency}';
  }
}


//Response Model
class ProposalResponse {
  final String jobId;
  final String freelancerId;
  final String coverLetter;
  final double price;
  final String currency;
  final String status;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  ProposalResponse({
    required this.jobId,
    required this.freelancerId,
    required this.coverLetter,
    required this.price,
    required this.currency,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProposalResponse.fromJson(Map<String, dynamic> json) {
    return ProposalResponse(
      jobId: json['job_id'] as String,
      freelancerId: json['freelancer_id'] as String,
      coverLetter: json['cover_letter'] as String,
      price: json['price'].toDouble(),
      currency: json['currency'] as String,
      status: json['status'] as String,
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: json['__v'] as int,
    );
  }

  @override
  String toString() {
    return 'ProposalResponse{jobId: $jobId, freelancerId: $freelancerId, coverLetter: $coverLetter, price: $price, currency: $currency, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}