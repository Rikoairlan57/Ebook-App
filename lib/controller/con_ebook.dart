import 'package:dio/dio.dart';
import 'package:ebook/controller/api.dart';
import 'package:ebook/model/model_ebook.dart';

Future<List<ModelEbook>> fetchEbook(List<ModelEbook> ebook) async{
  var request = await Dio().get(ApiConstant().baseUrl+ApiConstant().api+ApiConstant().latest);
  for (Map<String, dynamic> latest in request.data){
    ebook.add(ModelEbook(
        id: latest['id'],
        title: latest['title'],
        photo: latest['photo'],
        description: latest['description'],
        catId: latest['catId'],
        statusNews: latest['statusNews'],
        pdf: latest['pdf'],
        date: latest['date'],
        authorName: latest['authorName'],
        publisherName: latest['publisherName'],
        page: latest['page'],
        language: latest['language'],
        rating: latest['rating'],
        free: latest['free']));
  }
  return ebook;
}