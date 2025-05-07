class Blog {
  final String id;
  final String titleTR;
  final String titleEN;
  final String summaryTR;
  final String summaryEN;
  final String articleTR;
  final String articleEN;
  final String imgsrc;
  final List<String> tagsTR;
  final List<String> tagsEN;

  Blog({
    required this.id,
    required this.titleTR,
    required this.titleEN,
    required this.summaryTR,
    required this.summaryEN,
    required this.articleTR,
    required this.articleEN,
    required this.imgsrc,
    required this.tagsTR,
    required this.tagsEN,
  });

  factory Blog.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Blog(
      id: documentId,
      titleTR: data["titleTR"] ?? data["title"] ?? "",
      titleEN: data["titleEN"] ?? data["title"] ?? "",
      summaryTR: data["summaryTR"] ?? data["summary"] ?? "",
      summaryEN: data["summaryEN"] ?? data["summary"] ?? "",
      articleTR: data["articleTR"] ?? data["article"] ?? "",
      articleEN: data["articleEN"] ?? data["article"] ?? "",
      imgsrc: data["imgsrc"] ?? "",
      tagsTR: List<String>.from(data["tagsTR"] ?? data["tags"] ?? []),
      tagsEN: List<String>.from(data["tagsEN"] ?? data["tags"] ?? []),
    );
  }

  List<String> getLocalizedTags(String languageCode) {
    if (languageCode == "tr") {
      return tagsTR.isNotEmpty ? tagsTR : tagsEN;
    }
    return tagsEN.isNotEmpty ? tagsEN : tagsTR;
  }
}
