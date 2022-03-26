import 'dart:convert';
import 'package:http/http.dart' as http;
import '../common/constant.dart';
import '../model/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProduct() async {
    var url = Uri.parse(Constant.baseUrl + Constant.product);
    var header = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      for (var item in data) {
        ProductModel product = ProductModel.fromJson(item);
        products.add(product);
      }
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
