import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_starting_project/models/product.dart';


final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>((){
  return CartNotifier();
});
final cartTotalProvider = Provider((ref){
  return cartTotal(ref);
});


class CartNotifier extends Notifier<Set<Product>>{

  // initial_state
  @override
  Set<Product> build() {
    return {};
  }

  // methods_to_update_state
  void addProduct(Product product){
    if(!state.contains(product)){
      state = {...state, product};
    }
  }

  void removeProduct(Product product){
    log('${state.length}');
    if(state.contains(product)){
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

int cartTotal(ref){
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;

  for(Product product in cartProducts){
    total += product.price;
  }
  return total;
}

