import 'package:flutter/material.dart';
import 'package:mr/models/blog_model.dart';
import 'package:mr/services/blog_service.dart';
import 'package:get/get.dart';
import 'package:mr/pages/Blogs/blog_detail_page.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  final BlogService _blogService = BlogService();
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchTerm = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _getLocalized(String tr, String en) {
    if (Get.locale?.languageCode == 'tr') {
      return tr;
    }
    return en;
  }

  void _navigateToDetail(Blog blog) {
    Get.to(() => BlogDetailPage(blog: blog));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(_getLocalized('Blog', 'Blog')),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width * 0.95,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: _getLocalized(
                    'Makalelerde ara...',
                    'Search articles...',
                  ),
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,

                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  suffixIcon:
                      _searchTerm.isNotEmpty
                          ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                          : null,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: width,
            child: StreamBuilder<List<Blog>>(
              stream: _blogService.getBlogs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      _getLocalized('Bir hata oluştu.', 'An error occurred.'),
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      _getLocalized(
                        'Blog yazısı bulunamadı.',
                        'No blog posts found.',
                      ),
                    ),
                  );
                }

                List<Blog> allBlogs = snapshot.data!;
                List<Blog> filteredBlogs =
                    allBlogs.where((blog) {
                      final titleTR = blog.titleTR.toLowerCase();
                      final titleEN = blog.titleEN.toLowerCase();
                      final summaryTR = blog.summaryTR.toLowerCase();
                      final summaryEN = blog.summaryEN.toLowerCase();
                      final currentLangTitle = _getLocalized(titleTR, titleEN);
                      final currentLangSummary = _getLocalized(
                        summaryTR,
                        summaryEN,
                      );

                      return currentLangTitle.contains(_searchTerm) ||
                          currentLangSummary.contains(_searchTerm) ||
                          titleTR.contains(_searchTerm) ||
                          titleEN.contains(_searchTerm) ||
                          summaryTR.contains(_searchTerm) ||
                          summaryEN.contains(_searchTerm);
                    }).toList();

                if (filteredBlogs.isEmpty && _searchTerm.isNotEmpty) {
                  return Center(
                    child: Text(
                      _getLocalized(
                        'Aramanızla eşleşen sonuç bulunamadı.',
                        'No results found for your search.',
                      ),
                    ),
                  );
                }

                if (filteredBlogs.isEmpty &&
                    _searchTerm.isEmpty &&
                    allBlogs.isNotEmpty) {
                  filteredBlogs = allBlogs;
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: filteredBlogs.length,
                  itemBuilder: (context, index) {
                    final blog = filteredBlogs[index];
                    return BlogCard(
                      blog: blog,
                      onTap: () => _navigateToDetail(blog),
                      currentLanguageCode: Get.locale?.languageCode ?? 'en',
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final Blog blog;
  final VoidCallback onTap;
  final String currentLanguageCode;

  const BlogCard({
    super.key,
    required this.blog,
    required this.onTap,
    required this.currentLanguageCode,
  });

  String _getLocalizedText(String tr, String en) {
    return currentLanguageCode == 'tr' ? tr : en;
  }

  @override
  Widget build(BuildContext context) {
    final title = _getLocalizedText(blog.titleTR, blog.titleEN);
    final summary = _getLocalizedText(blog.summaryTR, blog.summaryEN);

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blog.imgsrc.isNotEmpty)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    blog.imgsrc,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 40,
                          ),
                        ),
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      summary,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: onTap,
                        child: Text(
                          _getLocalizedText('Devamını Oku', 'Read More'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
