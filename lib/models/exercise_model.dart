class Exercise {
  final String title;       // عنوان التمرين
  final String description; // وصف التمرين
  final String audioUrl;    // رابط الصوت
  final String notesImageUrl;  // صورة النوتة
  final int difficultyLevel;     // مستوى الصعوبة (1-5)

  const Exercise({
    required this.title,
    required this.description,
    required this.audioUrl,
    required this.notesImageUrl,
    required this.difficultyLevel,
  });
}
