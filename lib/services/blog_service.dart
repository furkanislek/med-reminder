import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mr/models/blog_model.dart';

class BlogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'blogs';

  Stream<List<Blog>> getBlogs() {
    return _firestore.collection(_collectionPath).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Blog.fromFirestore(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<Blog?> getBlogById(String id) async {
    try {
      print("-------------------------------");
      print(id);
      print("-------------------------------");
      DocumentSnapshot doc =
          await _firestore.collection(_collectionPath).doc(id).get();
      print("-------------------------------");
      print(doc);
      print("-------------------------------");
      if (doc.exists) {
        return Blog.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }
    } catch (e) {
      print('Error fetching blog by ID: $e');
    }
    return null;
  }
}
