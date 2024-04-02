class Complaint {
  final String photo;
  final String name;
  final String zone;
  final String complaintType;
  final String date;
  final String status;
  final String uid;

  Complaint(
      {required this.photo,
      required this.name,
      required this.zone,
      required this.complaintType,
      required this.date,
      required this.status,
      required this.uid});
}
