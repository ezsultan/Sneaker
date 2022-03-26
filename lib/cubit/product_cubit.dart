import 'package:bloc/bloc.dart';
import 'package:sneaker/model/product_model.dart';
import 'package:sneaker/service/product_services.dart';

import 'product_states.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> getProduct() async {
    try {
      emit(ProductLoading());
      List<ProductModel> products = await ProductService().getProduct();
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }
}
