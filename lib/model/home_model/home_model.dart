class HomeModel{
  bool? status;
  String? message;
  Data? data;
  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data{
  int? currentPage ;
  List<DataProduct>?  dataProduct;
  Data.fromJson(Map<String, dynamic> json){
   if(json['data'] != null){
     dataProduct = [];
     json['data'].forEach((element){
       dataProduct?.add(DataProduct.fromJson(element));
     });
   }
  }
}


class DataProduct{
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorite;
  bool? inCart;
  DataProduct.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];

    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}