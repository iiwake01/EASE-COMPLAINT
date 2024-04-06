class NotificationModel {

  NotificationModel ( {
    this.id,
    this.uid,
    this.complaintId,
    this.title,
    this.message,
    this.dateTime,
    this.hasRead,
  });

  final String? id;
  final String? uid;
  final String? complaintId;
  final String? title;
  final String? message;
  final String? dateTime;
  final bool? hasRead;
}