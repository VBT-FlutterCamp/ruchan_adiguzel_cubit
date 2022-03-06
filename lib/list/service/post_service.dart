import 'package:dio/dio.dart';
import '../model/post_model.dart';

abstract class IPostService {
  final Dio dio;

  IPostService(this.dio);
  Future<List<PostModel>> getData();
}

class PostService extends IPostService {
  PostService(Dio dio) : super(dio);
  @override
  Future<List<PostModel>> getData() async {
    final response = await dio.get(servicePath.POSTS.rawValue);
    if (response.statusCode == 200) {
      final data = response.data as List;
      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw DioError(
          requestOptions: RequestOptions(path: response.realUri.path));
    }
  }
}

enum servicePath { POSTS, BASE_URL }

extension servicePathExtension on servicePath {
  String get rawValue {
    switch (this) {
      case servicePath.POSTS:
        return "/posts";
      case servicePath.BASE_URL:
        return "https://jsonplaceholder.typicode.com";
    }
  }
}
