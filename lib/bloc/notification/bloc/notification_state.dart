import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  final int? count;
  final int? totalNotification;
  const NotificationState({
    this.count,
    this.totalNotification,
  });
  const NotificationState.initState() : this();
  NotificationState copyWith({
    int? count,
    int? totalNotification,
  }) {
    return NotificationState(
      count: count,
      totalNotification: totalNotification,
    );
  }

  @override
  List<Object?> get props => [count, totalNotification];
}
