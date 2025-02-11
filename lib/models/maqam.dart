import 'history_model.dart';
import 'exercise_model.dart';
import 'video_lesson_model.dart';
import 'audio_sample.dart' as audio;

enum MaqamMood {
  joyful,
  sad,
  spiritual,
  heroic,
  calm,
}

class Maqam {
  final String id;
  final String name;
  final List<String> notes;
  final String description;
  final List<audio.AudioSample> audioSamples;
  final List<String> examples;
  final MaqamMood mood;
  final String culturalContext;
  final List<String> commonOccasions;
  final List<String> relatedMaqamat;
  final List<Exercise> exercises;
  final List<VideoLesson> videoLessons;
  final HistoricalInfo historicalInfo;
  final bool isFavorite;

  const Maqam({
    required this.id,
    required this.name,
    required this.notes,
    required this.description,
    required this.audioSamples,
    required this.examples,
    required this.mood,
    required this.culturalContext,
    required this.commonOccasions,
    required this.relatedMaqamat,
    required this.exercises,
    required this.videoLessons,
    required this.historicalInfo,
    this.isFavorite = false,
  });

  List<audio.AudioSample> getAudioSamplesByType(audio.SampleType type) {
    return audioSamples.where((sample) => sample.type == type).toList();
  }

  Maqam copyWith({
    String? id,
    String? name,
    List<String>? notes,
    String? description,
    List<audio.AudioSample>? audioSamples,
    List<String>? examples,
    MaqamMood? mood,
    String? culturalContext,
    List<String>? commonOccasions,
    List<String>? relatedMaqamat,
    List<Exercise>? exercises,
    List<VideoLesson>? videoLessons,
    HistoricalInfo? historicalInfo,
    bool? isFavorite,
  }) {
    return Maqam(
      id: id ?? this.id,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      description: description ?? this.description,
      audioSamples: audioSamples ?? this.audioSamples,
      examples: examples ?? this.examples,
      mood: mood ?? this.mood,
      culturalContext: culturalContext ?? this.culturalContext,
      commonOccasions: commonOccasions ?? this.commonOccasions,
      relatedMaqamat: relatedMaqamat ?? this.relatedMaqamat,
      exercises: exercises ?? this.exercises,
      videoLessons: videoLessons ?? this.videoLessons,
      historicalInfo: historicalInfo ?? this.historicalInfo,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  static final List<Maqam> sampleMaqamat = [
    maqamRast,
    maqamBayati,
    maqamSika,
    maqamNahawand,
    maqamHijaz,
    maqamSaba,
    maqamAjam,
    maqamKurd,
  ];

  static final maqamRast = Maqam(
    id: 'rast',
    name: 'راست',
    notes: ['دو', 'ري', 'مي♭', 'فا', 'صول', 'لا', 'سي♭', 'دو'],
    description: 'مقام راست هو مقام أساسي في الموسيقى العربية',
    mood: MaqamMood.joyful,
    historicalInfo: const HistoricalInfo(
      origin: 'بلاد فارس',
      period: 'القرن الثامن الهجري',
      development: 'تطور من النظام الموسيقي الفارسي القديم',
      famousMusicians: ['صفي الدين الأرموي', 'عبد القادر المراغي'],
    ),
    culturalContext: 'يستخدم في المناسبات السعيدة والاحتفالات',
    commonOccasions: ['الأعراس', 'الحفلات', 'المناسبات الدينية'],
    relatedMaqamat: ['نهاوند', 'بيات', 'سيكاه'],
    examples: ['يا حبيبي الغالي', 'لما بدا يتثنى'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/rast_taqsim.mp3',
        title: 'تقسيم راست',
        description: 'تقسيم على العود في مقام راست',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/rast_samai.mp3',
        title: 'سماعي راست',
        description: 'سماعي راست - تأليف جميل بك الطنبوري',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/rast_vocal.mp3',
        title: 'غناء راست',
        description: 'موشح في مقام راست',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين أساسي',
        description: 'تمرين بسيط للتعرف على سلم راست',
        audioUrl: 'assets/exercises/rast_basic.mp3',
        notesImageUrl: 'assets/exercises/rast_basic_notes.png',
        difficultyLevel: 1,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام راست - الجزء الأول',
        description: 'شرح مفصل لمقام راست وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example1',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
    isFavorite: false,
  );

  static final maqamBayati = Maqam(
    id: 'bayati',
    name: 'بياتي',
    notes: ['ري', 'مي♭', 'فا', 'صول', 'لا', 'سي♭', 'دو', 'ري'],
    description: 'مقام بياتي هو مقام حزين في الموسيقى العربية',
    mood: MaqamMood.sad,
    historicalInfo: const HistoricalInfo(
      origin: 'بلاد فارس',
      period: 'القرن الثامن الهجري',
      development: 'تطور من النظام الموسيقي الفارسي القديم',
      famousMusicians: ['صفي الدين الأرموي', 'عبد القادر المراغي'],
    ),
    culturalContext: 'يستخدم في المناسبات الحزينة والاحتفالات',
    commonOccasions: ['المناسبات الحزينة', 'الحفلات', 'المناسبات الدينية'],
    relatedMaqamat: ['راست', 'نهاوند', 'سيكاه'],
    examples: ['يا ظالمني', 'أنا في انتظارك'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/bayati_taqsim.mp3',
        title: 'تقسيم بياتي',
        description: 'تقسيم على العود في مقام بياتي',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/bayati_samai.mp3',
        title: 'سماعي بياتي',
        description: 'سماعي بياتي - تأليف جميل بك الطنبوري',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/bayati_vocal.mp3',
        title: 'غناء بياتي',
        description: 'موشح في مقام بياتي',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين أساسي',
        description: 'تمرين بسيط للتعرف على سلم بياتي',
        audioUrl: 'assets/exercises/bayati_basic.mp3',
        notesImageUrl: 'assets/exercises/bayati_basic_notes.png',
        difficultyLevel: 1,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام بياتي - الجزء الأول',
        description: 'شرح مفصل لمقام بياتي وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example2',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
    isFavorite: false,
  );

  static final maqamSika = Maqam(
    id: 'sika',
    name: 'سيكاه',
    notes: ['مي⅟₂♭', 'فا', 'صول', 'لا', 'سي♭', 'دو', 'ري', 'مي⅟₂♭'],
    description: 'مقام سيكاه هو مقام يتميز بطابعه الروحاني في الموسيقى العربية',
    mood: MaqamMood.spiritual,
    historicalInfo: const HistoricalInfo(
      origin: 'مصر',
      period: 'القرن التاسع الهجري',
      development: 'تطور في مصر وانتشر في بلاد الشام',
      famousMusicians: ['سيد درويش', 'محمد عبد الوهاب'],
    ),
    culturalContext: 'يستخدم في الإنشاد الديني والابتهالات',
    commonOccasions: ['المناسبات الدينية', 'الابتهالات', 'المدائح النبوية'],
    relatedMaqamat: ['راست', 'بياتي', 'نهاوند'],
    examples: ['يا مسافر وحدك', 'طلع البدر علينا'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/sika_taqsim.mp3',
        title: 'تقسيم سيكاه',
        description: 'تقسيم على العود في مقام سيكاه',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/sika_samai.mp3',
        title: 'سماعي سيكاه',
        description: 'سماعي سيكاه - تأليف عبده داغر',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/sika_vocal.mp3',
        title: 'موشح سيكاه',
        description: 'موشح في مقام سيكاه',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين سيكاه أساسي',
        description: 'تمرين بسيط للتعرف على سلم سيكاه',
        audioUrl: 'assets/exercises/sika_basic.mp3',
        notesImageUrl: 'assets/exercises/sika_basic_notes.png',
        difficultyLevel: 2,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام سيكاه - الجزء الأول',
        description: 'شرح مفصل لمقام سيكاه وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example3',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
  );

  static final maqamNahawand = Maqam(
    id: 'nahawand',
    name: 'نهاوند',
    notes: ['دو', 'ري', 'مي♭', 'فا', 'صول', 'لا♭', 'سي♭', 'دو'],
    description: 'مقام نهاوند هو مقام رومانسي في الموسيقى العربية',
    mood: MaqamMood.sad,
    historicalInfo: const HistoricalInfo(
      origin: 'إيران',
      period: 'القرن الثامن الهجري',
      development: 'تطور في مدينة نهاوند الإيرانية',
      famousMusicians: ['محمد عبد الوهاب', 'فريد الأطرش'],
    ),
    culturalContext: 'يستخدم في الأغاني العاطفية والرومانسية',
    commonOccasions: ['الحفلات', 'السهرات الموسيقية', 'الأغاني العاطفية'],
    relatedMaqamat: ['راست', 'بياتي', 'كرد'],
    examples: ['ليلة حب', 'أنت عمري'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/nahawand_taqsim.mp3',
        title: 'تقسيم نهاوند',
        description: 'تقسيم على العود في مقام نهاوند',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/nahawand_samai.mp3',
        title: 'سماعي نهاوند',
        description: 'سماعي نهاوند - تأليف جميل عويس',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/nahawand_vocal.mp3',
        title: 'موشح نهاوند',
        description: 'موشح في مقام نهاوند',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين نهاوند أساسي',
        description: 'تمرين بسيط للتعرف على سلم نهاوند',
        audioUrl: 'assets/exercises/nahawand_basic.mp3',
        notesImageUrl: 'assets/exercises/nahawand_basic_notes.png',
        difficultyLevel: 2,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام نهاوند - الجزء الأول',
        description: 'شرح مفصل لمقام نهاوند وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example4',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
  );

  static final maqamHijaz = Maqam(
    id: 'hijaz',
    name: 'حجاز',
    notes: ['ري', 'مي♭', 'فا♯', 'صول', 'لا', 'سي♭', 'دو', 'ري'],
    description: 'مقام حجاز هو مقام شرقي أصيل يتميز بطابعه الحزين والعميق',
    mood: MaqamMood.sad,
    historicalInfo: const HistoricalInfo(
      origin: 'الحجاز',
      period: 'القرن السابع الهجري',
      development: 'تطور في منطقة الحجاز وانتشر في العالم العربي',
      famousMusicians: ['صباح فخري', 'وديع الصافي'],
    ),
    culturalContext: 'يستخدم في الموسيقى الكلاسيكية والطرب',
    commonOccasions: ['الحفلات', 'المجالس الطربية', 'المناسبات الدينية'],
    relatedMaqamat: ['راست', 'بياتي', 'صبا'],
    examples: ['يا طير', 'قدك المياس'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/hijaz_taqsim.mp3',
        title: 'تقسيم حجاز',
        description: 'تقسيم على العود في مقام حجاز',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/hijaz_samai.mp3',
        title: 'سماعي حجاز',
        description: 'سماعي حجاز - تأليف عمر البطش',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/hijaz_vocal.mp3',
        title: 'موشح حجاز',
        description: 'موشح في مقام حجاز',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين حجاز أساسي',
        description: 'تمرين بسيط للتعرف على سلم حجاز',
        audioUrl: 'assets/exercises/hijaz_basic.mp3',
        notesImageUrl: 'assets/exercises/hijaz_basic_notes.png',
        difficultyLevel: 2,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام حجاز - الجزء الأول',
        description: 'شرح مفصل لمقام حجاز وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example5',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
  );

  static final maqamSaba = Maqam(
    id: 'saba',
    name: 'صبا',
    notes: ['ري', 'مي♭', 'فا', 'صول♭', 'لا♭', 'سي♭', 'دو', 'ري'],
    description:
        'مقام صبا هو مقام حزين وعميق، يستخدم في التعبير عن مشاعر الحزن والشوق',
    mood: MaqamMood.sad,
    historicalInfo: const HistoricalInfo(
      origin: 'العراق',
      period: 'القرن الثامن الهجري',
      development: 'تطور في العراق وانتشر في بلاد الشام',
      famousMusicians: ['ناظم الغزالي', 'محمد القبانجي'],
    ),
    culturalContext: 'يستخدم في القصائد الحزينة والموال العراقي',
    commonOccasions: ['المجالس الطربية', 'القصائد', 'الموال'],
    relatedMaqamat: ['حجاز', 'بياتي', 'راست'],
    examples: ['فوق النخل', 'يا طير الورد'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/saba_taqsim.mp3',
        title: 'تقسيم صبا',
        description: 'تقسيم على العود في مقام صبا',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/saba_samai.mp3',
        title: 'سماعي صبا',
        description: 'سماعي صبا - تأليف جميل بشير',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/saba_vocal.mp3',
        title: 'موشح صبا',
        description: 'موشح في مقام صبا',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين صبا أساسي',
        description: 'تمرين بسيط للتعرف على سلم صبا',
        audioUrl: 'assets/exercises/saba_basic.mp3',
        notesImageUrl: 'assets/exercises/saba_basic_notes.png',
        difficultyLevel: 3,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام صبا - الجزء الأول',
        description: 'شرح مفصل لمقام صبا وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example6',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
  );

  static final maqamAjam = Maqam(
    id: 'ajam',
    name: 'عجم',
    notes: ['دو', 'ري', 'مي', 'فا', 'صول', 'لا', 'سي', 'دو'],
    description:
        'مقام عجم هو مقام فرح وبهيج، يشبه السلم الكبير في الموسيقى الغربية',
    mood: MaqamMood.joyful,
    historicalInfo: const HistoricalInfo(
      origin: 'بلاد فارس',
      period: 'القرن التاسع الهجري',
      development: 'تطور في بلاد فارس وانتقل إلى الموسيقى العربية',
      famousMusicians: ['سيد درويش', 'رياض السنباطي'],
    ),
    culturalContext: 'يستخدم في الأغاني الوطنية والفرح',
    commonOccasions: ['الأعراس', 'الاحتفالات الوطنية', 'المناسبات السعيدة'],
    relatedMaqamat: ['راست', 'نهاوند', 'جهاركاه'],
    examples: ['بلادي بلادي', 'الحلوة دي'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/ajam_taqsim.mp3',
        title: 'تقسيم عجم',
        description: 'تقسيم على العود في مقام عجم',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/ajam_samai.mp3',
        title: 'سماعي عجم',
        description: 'سماعي عجم - تأليف محمد عبد الوهاب',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/ajam_vocal.mp3',
        title: 'موشح عجم',
        description: 'موشح في مقام عجم',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين عجم أساسي',
        description: 'تمرين بسيط للتعرف على سلم عجم',
        audioUrl: 'assets/exercises/ajam_basic.mp3',
        notesImageUrl: 'assets/exercises/ajam_basic_notes.png',
        difficultyLevel: 1,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام عجم - الجزء الأول',
        description: 'شرح مفصل لمقام عجم وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example7',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
  );

  static final maqamKurd = Maqam(
    id: 'kurd',
    name: 'كرد',
    notes: ['ري', 'مي♭', 'فا', 'صول', 'لا', 'سي♭', 'دو', 'ري'],
    description: 'مقام كرد هو مقام تركي الأصل، يتميز بطابعه الحزين والرومانسي',
    mood: MaqamMood.sad,
    historicalInfo: const HistoricalInfo(
      origin: 'كردستان',
      period: 'القرن العاشر الهجري',
      development:
          'تطور في المناطق الكردية وانتشر في الموسيقى التركية والعربية',
      famousMusicians: ['محمد عبد الوهاب', 'زكريا أحمد'],
    ),
    culturalContext: 'يستخدم في الأغاني العاطفية والشعبية',
    commonOccasions: ['الحفلات', 'المجالس الطربية', 'الأغاني الشعبية'],
    relatedMaqamat: ['نهاوند', 'حجاز', 'بياتي'],
    examples: ['على بلد المحبوب', 'يا مسهرني'],
    audioSamples: [
      audio.AudioSample(
        url: 'assets/audio/kurd_taqsim.mp3',
        title: 'تقسيم كرد',
        description: 'تقسيم على العود في مقام كرد',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/kurd_samai.mp3',
        title: 'سماعي كرد',
        description: 'سماعي كرد - تأليف جميل عويس',
        type: audio.SampleType.instrumental,
      ),
      audio.AudioSample(
        url: 'assets/audio/kurd_vocal.mp3',
        title: 'موشح كرد',
        description: 'موشح في مقام كرد',
        type: audio.SampleType.muwashah,
      ),
    ],
    exercises: [
      Exercise(
        title: 'تمرين كرد أساسي',
        description: 'تمرين بسيط للتعرف على سلم كرد',
        audioUrl: 'assets/exercises/kurd_basic.mp3',
        notesImageUrl: 'assets/exercises/kurd_basic_notes.png',
        difficultyLevel: 2,
      ),
    ],
    videoLessons: [
      VideoLesson(
        title: 'مقام كرد - الجزء الأول',
        description: 'شرح مفصل لمقام كرد وطريقة عزفه',
        videoUrl: 'https://youtube.com/watch?v=example8',
        instructor: 'د. أحمد',
        duration: const Duration(minutes: 15),
      ),
    ],
  );
}
