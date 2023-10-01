import 'package:movies/core/class/crud.dart';

class MoviesLink {
  Crud crud;

  MoviesLink({required this.crud});

  getMostPopular(int page) async {
    var response = await crud
        .postData("https://www.episodate.com/api/most-popular?page=$page", {});
    return response.fold((l) => l, (r) => r);
  }
  getSearch(String searchText,int page) async {
    var response = await crud
        .postData("https://www.episodate.com/api/search?q=$searchText&page=$page", {});
    return response.fold((l) => l, (r) => r);
  }
}
