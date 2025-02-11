import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/maqam.dart';
import '../models/history_model.dart';
import '../models/exercise_model.dart';
import '../models/audio_sample.dart' as audio;
import '../models/video_lesson_model.dart';
import '../providers/maqamat_provider.dart';
import '../widgets/youtube_player_widget.dart';
import '../widgets/audio_player_widget.dart';

class MaqamDetailScreen extends StatelessWidget {
  final Maqam maqam;

  const MaqamDetailScreen({Key? key, required this.maqam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(maqam.name),
        actions: [
          IconButton(
            icon: Icon(
              maqam.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              context.read<MaqamatProvider>().toggleFavorite(maqam);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection('وصف المقام', maqam.description),
              _buildMoodSection(maqam.mood),
              _buildHistoricalSection(maqam.historicalInfo),
              _buildCulturalSection(maqam),
              _buildNotesSection(maqam.notes),
              _buildAudioSamplesSection(maqam.audioSamples),
              _buildExamplesSection(maqam.examples),
              _buildExercisesSection(maqam.exercises),
              _buildVideoLessonsSection(maqam.videoLessons),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHistoricalSection(HistoricalInfo historicalInfo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'المعلومات التاريخية',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('المنشأ'),
          subtitle: Text(historicalInfo.origin),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text('الفترة التاريخية'),
          subtitle: Text(historicalInfo.period),
        ),
        ListTile(
          leading: const Icon(Icons.trending_up),
          title: const Text('التطور'),
          subtitle: Text(historicalInfo.development),
        ),
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('موسيقيون مشهورون'),
          subtitle: Text(historicalInfo.famousMusicians.join('، ')),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCulturalSection(Maqam maqam) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'السياق الثقافي',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: const Icon(Icons.local_library), // تغيير أيقونة الثقافة
          title: const Text('الاستخدامات'),
          subtitle: Text(maqam.culturalContext),
        ),
        ListTile(
          leading: const Icon(Icons.event),
          title: const Text('المناسبات الشائعة'),
          subtitle: Text(maqam.commonOccasions.join('، ')),
        ),
        ListTile(
          leading: const Icon(Icons.compare_arrows),
          title: const Text('المقامات المرتبطة'),
          subtitle: Text(maqam.relatedMaqamat.join('، ')),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildExercisesSection(List<Exercise> exercises) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'التمارين',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return Card(
              child: ListTile(
                title: Text(exercise.title),
                subtitle: Text(exercise.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            padding: const EdgeInsets.all(16),
                            child: AudioPlayerWidget(
                              url: exercise.audioUrl,
                              title: exercise.title,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.info),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(exercise.title),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(exercise.description),
                                const SizedBox(height: 16),
                                Image.network(exercise.notesImageUrl),
                                const SizedBox(height: 16),
                                Text('مستوى الصعوبة: ${exercise.difficultyLevel}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('إغلاق'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildVideoLessonsSection(List<VideoLesson> lessons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'دروس فيديو',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return Card(
              child: ListTile(
                title: Text(lesson.title),
                subtitle: Text(lesson.description),
                trailing: IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        padding: const EdgeInsets.all(16),
                        child: YouTubePlayerWidget(
                          videoUrl: lesson.videoUrl,
                          title: lesson.title,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMoodSection(MaqamMood mood) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الطابع',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: Icon(_getMoodIcon(mood)),
          title: Text(_getMoodName(mood)),
          subtitle: Text(_getMoodDescription(mood)),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildNotesSection(List<String> notes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'النغمات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: notes.map((note) {
            return Chip(
              label: Text(note),
              backgroundColor: _getMoodColor(maqam.mood).withAlpha(26),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildAudioSamplesSection(List<audio.AudioSample> samples) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'عينات صوتية',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: samples.length,
          itemBuilder: (context, index) {
            final sample = samples[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: AudioPlayerWidget(
                url: sample.url,
                title: sample.title,
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildExamplesSection(List<String> examples) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'أمثلة',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: examples.length,
          itemBuilder: (context, index) {
            final example = examples[index];
            return Card(
              child: ListTile(
                title: Text(example),
                trailing: IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(16),
                        child: AudioPlayerWidget(
                          url: 'assets/audio/examples/${example.toLowerCase().replaceAll(' ', '_')}.mp3',
                          title: example,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  IconData _getMoodIcon(MaqamMood mood) {
    switch (mood) {
      case MaqamMood.joyful:
        return Icons.sentiment_very_satisfied;
      case MaqamMood.sad:
        return Icons.sentiment_very_dissatisfied;
      case MaqamMood.spiritual:
        return Icons.mosque;
      case MaqamMood.heroic:
        return Icons.local_fire_department;
      case MaqamMood.calm:
        return Icons.waves;
    }
  }

  String _getMoodName(MaqamMood mood) {
    switch (mood) {
      case MaqamMood.joyful:
        return 'فرح';
      case MaqamMood.sad:
        return 'حزن';
      case MaqamMood.spiritual:
        return 'روحاني';
      case MaqamMood.heroic:
        return 'حماسي';
      case MaqamMood.calm:
        return 'هادئ';
    }
  }

  String _getMoodDescription(MaqamMood mood) {
    switch (mood) {
      case MaqamMood.joyful:
        return 'مقام يتميز بطابعه المبهج والمفرح، يستخدم غالباً في الأغاني الاحتفالية والمناسبات السعيدة.';
      case MaqamMood.sad:
        return 'مقام ذو طابع حزين وعاطفي، يستخدم في التعبير عن المشاعر الحزينة والعميقة.';
      case MaqamMood.spiritual:
        return 'مقام روحاني يستخدم في الموسيقى الدينية والابتهالات، يتميز بطابعه الروحاني العميق.';
      case MaqamMood.heroic:
        return 'مقام قوي وحماسي، يستخدم في الأغاني الوطنية والحماسية.';
      case MaqamMood.calm:
        return 'مقام هادئ ورقيق، يستخدم في التعبير عن المشاعر الهادئة والرومانسية.';
    }
  }

  Color _getMoodColor(MaqamMood mood) {
    switch (mood) {
      case MaqamMood.joyful:
        return const Color(0xFFFFD700);
      case MaqamMood.sad:
        return const Color(0xFF4682B4);
      case MaqamMood.spiritual:
        return const Color(0xFF800080);
      case MaqamMood.heroic:
        return const Color(0xFFDC143C);
      case MaqamMood.calm:
        return const Color(0xFF98FB98);
    }
  }
}
