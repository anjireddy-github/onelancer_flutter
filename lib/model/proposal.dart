class CreateProposalRequest {
  final String jobId;
  final String coverLetter;
  final double price;

  CreateProposalRequest({
    required this.jobId,
    required this.coverLetter,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'cover_letter': coverLetter,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'CreateProposalRequest{jobId: $jobId, coverLetter: $coverLetter, price: $price}';
  }
}


class ProposalResponse {
  final String jobId;
  final String freelancerId;
  final String proposal;
  final List<String> attachments;
  final PriceDetails proposedPriceDetails;
  final String status;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ProposalResponse({
    required this.jobId,
    required this.freelancerId,
    required this.proposal,
    required this.attachments,
    required this.proposedPriceDetails,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProposalResponse.fromJson(Map<String, dynamic> json) {
    return ProposalResponse(
      jobId: json['job_id'],
      freelancerId: json['freelancer_id'],
      proposal: json['proposal'],
      attachments: List<String>.from(json['attachments']),
      proposedPriceDetails: PriceDetails.fromJson(json['proposed_price_details']),
      status: json['status'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class PriceDetails {
  final double value;
  final String type;

  PriceDetails({
    required this.value,
    required this.type,
  });

  factory PriceDetails.fromJson(Map<String, dynamic> json) {
    return PriceDetails(
      value: json['value'],
      type: json['type'],
    );
  }
}
