import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as imgs;

class GetImage {
  static Future<String?> getImageHash(String imagePath) async {
    try {
      // Fetch the image
      final response = await http.get(Uri.parse(imagePath));
      final rawImage = response.bodyBytes;
      final image = imgs.decodeImage(rawImage);

      if (image != null) {
        // Generate the BlurHash
        final blurHash = BlurHash.encode(image, numCompX: 4, numCompY: 3);
        return blurHash.hash;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching or encoding image: $e");
      } // Handle potential errors
    }

    return null;
  }
}
