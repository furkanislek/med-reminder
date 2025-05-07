import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // Placeholder, will add to pubspec
import 'package:mr/models/blog_model.dart';
import 'package:get/get.dart'; // For localization

class BlogDetailPage extends StatelessWidget {
  final Blog blog;

  const BlogDetailPage({super.key, required this.blog});

  String _getLocalizedText(String tr, String en) {
    if (Get.locale?.languageCode == 'tr') {
      return tr;
    }
    return en;
  }

  @override
  Widget build(BuildContext context) {
    final articleContent = _getLocalizedText(blog.articleTR, blog.articleEN);
    final currentLanguageCode = Get.locale?.languageCode ?? 'en';
    final localizedTags = blog.getLocalizedTags(currentLanguageCode);
    print("article");
    print(articleContent);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (blog.imgsrc.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  blog.imgsrc,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      heightFactor: 3,
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            if (blog.imgsrc.isNotEmpty) const SizedBox(height: 16.0),

            Html(
              data:
                  articleContent.isEmpty
                      ? "<p>${_getLocalizedText('İçerik bulunamadı.', 'Content not available.')}</p>"
                      : articleContent,
              style: {
                "body": Style(
                  fontSize: FontSize(16.0),
                  textAlign: TextAlign.justify,
                  lineHeight: LineHeight.em(1.5),
                ),
                "h1": Style(
                  fontSize: FontSize(22.0),
                  textAlign: TextAlign.justify,
                  fontWeight: FontWeight.bold,
                ),
                "h2": Style(
                  fontSize: FontSize(20.0),
                  textAlign: TextAlign.justify,
                  fontWeight: FontWeight.bold,
                ),
                "h3": Style(
                  fontSize: FontSize(18.0),
                  textAlign: TextAlign.justify,
                  fontWeight: FontWeight.bold,
                ),
                "p": Style(
                  margin: Margins.symmetric(vertical: 8.0),
                  textAlign: TextAlign.justify,
                ),
              },
            ),
            const SizedBox(height: 24.0),

            if (localizedTags.isNotEmpty)
              Text(
                _getLocalizedText('Etiketler:', 'Tags:'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (localizedTags.isNotEmpty) const SizedBox(height: 8.0),
            if (localizedTags.isNotEmpty)
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children:
                    localizedTags
                        .map(
                          (tag) => Chip(
                            label: Text(tag.toLowerCase()),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondaryContainer.withOpacity(0.7),
                            labelStyle: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onSecondaryContainer,
                              fontSize: 12,
                            ),
                          ),
                        )
                        .toList(),
              ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
