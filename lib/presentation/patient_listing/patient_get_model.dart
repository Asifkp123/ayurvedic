class PatientModel {
  final int id;
  final List<Map<String, dynamic>> patientDetailsSet;
  final Map<String, dynamic> branch;
  final String user;
  final String payment;
  final String name;
  final String phone;
  final String address;
  final dynamic price;
  final int totalAmount;
  final int discountAmount;
  final int advanceAmount;
  final int balanceAmount;
  final String dateAndTime;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String treatmentName;

  PatientModel({
    required this.id,
    required this.patientDetailsSet,
    required this.branch,
    required this.user,
    required this.payment,
    required this.name,
    required this.phone,
    required this.address,
    required this.price,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateAndTime,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.treatmentName,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      patientDetailsSet: List<Map<String, dynamic>>.from(json['patientdetails_set'] ?? []),
      branch: json['branch'] is Map<String, dynamic> ? Map<String, dynamic>.from(json['branch']) : {},
      user: json['user'] ?? '',
      payment: json['payment'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      price: json['price'],
      totalAmount: json['total_amount'] ?? 0,
      discountAmount: json['discount_amount'] ?? 0,
      advanceAmount: json['advance_amount'] ?? 0,
      balanceAmount: json['balance_amount'] ?? 0,
      dateAndTime: json['date_nd_time'] ?? '',
      isActive: json['is_active'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      treatmentName: json['treatment_name'] ?? 'Couple Combo Package (Rejuven...',
    );
  }
}