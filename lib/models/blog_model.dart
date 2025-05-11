class Blog {
  final String id;
  final Map<String, String> title;
  final Map<String, String> summary;
  final Map<String, String> article;
  final String imgSrc;
  final Map<String, List<String>> tags;
  final String svg;
  final String category;

  Blog({
    required this.id,
    required this.title,
    required this.summary,
    required this.article,
    required this.imgSrc,
    required this.tags,
    required this.svg,
    required this.category,
  });

  factory Blog.fromFirestore(Map<String, dynamic> data, String documentId) {
    // Gelen veriyi yeni formata göre dönüştür
    Map<String, dynamic> _mapOrEmpty(dynamic value) =>
        value is Map<String, dynamic> ? value : <String, dynamic>{};

    Map<String, dynamic> _tagsOrEmpty(dynamic value) =>
        value is Map<String, dynamic> ? value : <String, dynamic>{};

    final rawTitle = _mapOrEmpty(data["title"]);
    final rawSummary = _mapOrEmpty(data["summary"]);
    final rawArticle = _mapOrEmpty(data["article"]);
    final rawTags = _tagsOrEmpty(data["tags"]);

    return Blog(
      id: documentId,
      svg: (data["svg"] ?? data["Svg"] ?? "") as String,
      category: (data["category"] ?? data["Category"] ?? "") as String,
      title: Map<String, String>.from(rawTitle),
      summary: Map<String, String>.from(rawSummary),
      article: Map<String, String>.from(rawArticle),
      imgSrc: (data["imgSrc"] ?? data["imgsrc"] ?? "") as String,
      tags: rawTags.map(
        (key, value) => MapEntry(key, List<String>.from(value)),
      ),
    );
  }

  String _normalizeCode(String code) => code.toLowerCase().replaceAll('-', '_');

  // Yardımcı: İstenen dil koduna uygun anahtarı bulur (ör: "tr" -> "tr_TR")
  String _resolveLocaleKey(Iterable<String> keys, String languageCode) {
    final normalizedRequested = _normalizeCode(languageCode);

    // Tam veya normalize edilmiş eşleşme
    final exact = keys.firstWhere(
      (k) => _normalizeCode(k) == normalizedRequested,
      orElse: () => "",
    );
    if (exact.isNotEmpty) return exact;

    // Ön ek eşleşmesi ("tr" -> "tr_TR")
    final prefix = keys.firstWhere(
      (k) => _normalizeCode(k).startsWith(normalizedRequested),
      orElse: () => "",
    );
    if (prefix.isNotEmpty) return prefix;

    // İngilizce yedeği
    final en = keys.firstWhere(
      (k) => k.toLowerCase().startsWith("en"),
      orElse: () => keys.isNotEmpty ? keys.first : "",
    );
    return en;
  }

  String _getLocalizedString(Map<String, String> map, String languageCode) {
    if (map.isEmpty) return "";
    final key = _resolveLocaleKey(map.keys, languageCode);
    return map[key] ?? "";
  }

  List<String> _getLocalizedList(
    Map<String, List<String>> map,
    String languageCode,
  ) {
    if (map.isEmpty) return [];
    final key = _resolveLocaleKey(map.keys, languageCode);
    return map[key] ?? [];
  }

  // Dışarıya sunulan yardımcılar
  String getTitle(String languageCode) =>
      _getLocalizedString(title, languageCode);
  String getSummary(String languageCode) =>
      _getLocalizedString(summary, languageCode);
  String getArticle(String languageCode) =>
      _getLocalizedString(article, languageCode);
  List<String> getLocalizedTags(String languageCode) =>
      _getLocalizedList(tags, languageCode);
}
