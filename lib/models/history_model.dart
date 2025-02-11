class HistoricalInfo {
  final String origin;      // منشأ المقام
  final String period;      // الفترة التاريخية
  final String development; // تطور المقام
  final List<String> famousMusicians; // موسيقيون مشهورون

  const HistoricalInfo({
    required this.origin,
    required this.period,
    required this.development,
    required this.famousMusicians,
  });
}
