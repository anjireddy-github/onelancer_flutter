class TimeUtils {
  static String formatRelativeTime(DateTime time) {
    Duration difference = DateTime.now().difference(time);

    if (difference.inDays > 0) {
      if (difference.inDays == 1) {
        return 'Yesterday';
      } else {
        return '${time.day}/${time.month}/${time.year}';
      }
    } else if (difference.inHours > 0) {
      return '${time.hour}:${time.minute}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min ago';
    } else {
      return 'Just now';
    }
  }
}