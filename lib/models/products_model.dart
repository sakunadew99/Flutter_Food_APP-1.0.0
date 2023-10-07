class Produc{
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel>? get products => _products;

  Produc({required totalSize, required typeId, required offset, required products}){
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Produc.fromJson(Map<String, dynamic> json) {
    _totalSize = json['totalSize'];
    _typeId = json['typeId'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(new ProductModel.fromJson(v));
      });
    }
  }

}

class ProductModel{
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  int? typeId;
  int? stars;
  String? createdAt;
  String? updatedAt;
  String? location;

  ProductModel(
    {
      this.id,
      this.name,  
      this.description,
      this.image,
      this.price,
      this.typeId,
      this.stars,
      this.createdAt,
      this.updatedAt,
      this.location

    }
  );

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    typeId = json['typeId'];
    stars = json['stars'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    location = json['location'];
  }
}