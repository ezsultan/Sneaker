import 'package:equatable/equatable.dart';
import 'package:sneaker/model/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  const ProductLoaded({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String error;
  const ProductError({required this.error});
  @override
  List<Object> get props => [error];
}
