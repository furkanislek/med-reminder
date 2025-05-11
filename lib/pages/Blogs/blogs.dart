import 'package:flutter/material.dart';
import 'package:mr/models/blog_model.dart';
import 'package:mr/services/blog_service.dart';
import 'package:get/get.dart';
import 'package:mr/pages/Blogs/blog_detail_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  final BlogService _blogService = BlogService();

  // Kategoriler
  final List<String> categories = ["pills", "health", "Yaşam Tarzı"];

  // Kategori renkleri
  final Map<String, Color> categoryColors = {
    "pills": const Color(0xFFA9C7BB), // Açık yeşil
    "health": const Color(0xFFE7ABAA), // Açık pembe
    "Yaşam Tarzı": const Color(0xFF96B9DF), // Açık mavi
  };

  final Map<String, Color> secondaryCategoryColors = {
    "pills": const Color(0xFFD3F1E5), // Açık yeşil
    "health": const Color(0xFFFCE8E7), // Açık pembe
    "Yaşam Tarzı": const Color(0xFFAFCCEB), // Açık mavi
  };

  final Map<String, Color> textCategoryColors = {
    "pills": const Color(0xFF3B5B52), // Siyah
    "health": const Color(0xFF844140), // Siyah
    "Yaşam Tarzı": const Color(0xFF3B5B52), // Siyah
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
    final currentLocaleTag = Get.locale?.toString() ?? 'en_US';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          _getLocalized("Blog", "Blog"),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Açık gri arkaplan
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
            Map<String, List<Blog>> filteredBlogsByCategory = {};

            // Tüm kategorileri başlat
            for (var category in categories) {
              filteredBlogsByCategory[category] = [];
            }

            // Normal mod - tüm blogları kategorilere ayır
            for (var blog in allBlogs) {
              final category = blog.category;
              if (categories.contains(category)) {
                filteredBlogsByCategory[category]!.add(blog);
              }
            }

            return ListView(
              padding: const EdgeInsets.only(bottom: 20),
              children: [
                for (String category in categories)
                  _buildCategorySection(
                    category,
                    filteredBlogsByCategory[category] ?? [],
                    currentLocaleTag,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategorySection(
    String category,
    List<Blog> categoryBlogs,
    String currentLocaleTag,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: 8.0,
          ),
          child: Text(
            category.tr,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        if (categoryBlogs.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              _getLocalized('Şuan blog yok', 'No blogs available'),
              style: TextStyle(color: Colors.grey[600]),
            ),
          )
        else
          SizedBox(
            height: 280,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              itemCount: categoryBlogs.length,
              itemBuilder: (context, index) {
                final blog = categoryBlogs[index];
                return CategoryBlogCard(
                  blog: blog,
                  color: categoryColors[category] ?? Colors.grey[200]!,
                  secondaryColor:
                      secondaryCategoryColors[category] ?? Colors.grey[200]!,
                  textColor: textCategoryColors[category] ?? Colors.grey[200]!,
                  onTap: () => _navigateToDetail(blog),
                  currentLanguageCode: currentLocaleTag,
                );
              },
            ),
          ),
      ],
    );
  }
}

class CategoryBlogCard extends StatelessWidget {
  final Blog blog;
  final Color color;
  final VoidCallback onTap;
  final String currentLanguageCode;
  final Color secondaryColor;
  final Color textColor;

  const CategoryBlogCard({
    super.key,
    required this.blog,
    required this.color,
    required this.onTap,
    required this.currentLanguageCode,
    required this.secondaryColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final title = blog.getTitle(currentLanguageCode);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(1),
                width: double.infinity,
                child:
                    blog.imgSrc.isNotEmpty
                        ? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(blog.imgSrc),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        )
                        : Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.grey[400],
                        ),
              ),
            ),

            // Alt kısımdaki beyaz bölüm
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultCard extends StatelessWidget {
  final Blog blog;
  final VoidCallback onTap;
  final String currentLanguageCode;

  const SearchResultCard({
    super.key,
    required this.blog,
    required this.onTap,
    required this.currentLanguageCode,
  });

  @override
  Widget build(BuildContext context) {
    final title = blog.getTitle(currentLanguageCode);
    final summary = blog.getSummary(currentLanguageCode);

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blog görseli
              if (blog.imgSrc.isNotEmpty || blog.svg.isNotEmpty)
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      blog.svg.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/svg/${blog.svg}",
                              fit: BoxFit.contain,
                            ),
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              blog.imgSrc,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                  ),
                            ),
                          ),
                ),
              const SizedBox(width: 12),
              // Blog başlık ve özeti
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      summary,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
