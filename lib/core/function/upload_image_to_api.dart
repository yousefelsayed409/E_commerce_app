import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToApi(XFile image) async {
/// 
/// Takes an [XFile] object representing the image to be uploaded.
/// 
/// Returns a [Future] that completes with a [MultipartFile] containing the image data.
Future<MultipartFile> uploadImageToAPI(XFile image) async {
  return await MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
} 
}