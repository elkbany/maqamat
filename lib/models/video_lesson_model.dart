class VideoLesson {
  final String title;       // عنوان الدرس
  final String description; // وصف الدرس
  final String videoUrl;    // رابط الفيديو
  final String instructor;  // اسم المدرس
  final Duration duration;  // مدة الدرس

  const VideoLesson({
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.instructor,
    required this.duration,
  });
}
