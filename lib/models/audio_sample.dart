enum SampleType {
  key,
  recitation,
  muwashah,
  instrumental,
}

class AudioSample {
  final String title;
  final String url;
  final SampleType type;
  final String description;

  const AudioSample({
    required this.title,
    required this.url,
    required this.type,
    this.description = '',
  });
}
