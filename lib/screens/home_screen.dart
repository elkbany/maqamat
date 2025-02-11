import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/maqam.dart';
import '../providers/maqamat_provider.dart';
import './maqam_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  Color _getMoodColor(MaqamMood mood) {
    switch (mood) {
      case MaqamMood.joyful:
        return const Color(0xFFFFD700); // ذهبي
      case MaqamMood.sad:
        return const Color(0xFF4682B4); // أزرق داكن
      case MaqamMood.spiritual:
        return const Color(0xFF800080); // بنفسجي
      case MaqamMood.heroic:
        return const Color(0xFFDC143C); // أحمر
      case MaqamMood.calm:
        return const Color(0xFF98FB98); // أخضر فاتح
    }
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildMaqamatList(List<Maqam> maqamat) {
    if (maqamat.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.music_note_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.primary.withAlpha(128),
            ),
            const SizedBox(height: 16),
            Text(
              'لا توجد مقامات',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary.withAlpha(128),
                  ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: maqamat.length,
      itemBuilder: (context, index) {
        final maqam = maqamat[index];
        final moodColor = _getMoodColor(maqam.mood);
        
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MaqamDetailScreen(maqam: maqam),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          moodColor.withAlpha(204),
                          moodColor.withAlpha(102),
                        ],
                      ),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            _getMoodIcon(maqam.mood),
                            size: 48,
                            color: Colors.white.withAlpha(204),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: IconButton(
                            icon: Icon(
                              maqam.isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: maqam.isFavorite ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              Provider.of<MaqamatProvider>(context, listen: false)
                                  .toggleFavorite(maqam);
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(13),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _getMoodName(maqam.mood),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maqam.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          maqam.notes.join(' - '),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MaqamatProvider>(
        builder: (context, maqamatProvider, child) {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 150,
                  floating: true,
                  pinned: true,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'المقامات الموسيقية',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    centerTitle: true,
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(80),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      height: 80,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'ابحث عن مقام...',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                        ),
                        onChanged: (value) {
                          maqamatProvider.searchMaqamat(value);
                        },
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildMaqamatList(maqamatProvider.filteredMaqamat),
                _buildMaqamatList(
                  maqamatProvider.filteredMaqamat
                      .where((maqam) => maqam.isFavorite)
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
          ),
        ),
        child: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
          indicatorColor: Theme.of(context).colorScheme.primary,
          tabs: const [
            Tab(
              icon: Icon(Icons.music_note),
              text: 'كل المقامات',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'المفضلة',
            ),
          ],
        ),
      ),
    );
  }
}
