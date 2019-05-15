import 'package:first_app/models/product.dart';
import 'package:first_app/models/users.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ConectedProductsModel on Model{


  List<Product> _products = [];
  int _selProductIndex;
  User _authenticatedUser;

  void addProduct(String title, String description, String image, double price){

    final Product newProduct =
    Product(
        title: title,
        description: description,
        price: price,
        image: image,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id);
    _products.add(newProduct);
    _selProductIndex = null;
    notifyListeners();

  }


}

mixin  ProductsModel on ConectedProductsModel{


  bool _showFavorites = false;


  int get selectedProductIndex => _selProductIndex;

  Product get selectedProduct {
    if(selectedProductIndex == null)
    {
      return null;
    }
    return displayedProducts[selectedProductIndex];
  }



  bool get displayFavoritesOnly{
    return _showFavorites;
  }

  List<Product> get AllProducts{

    return List.from(_products);
  }



  List<Product> get displayedProducts{
    if(_showFavorites){
      return _products.where((Product product)=> product.isFavorite).toList();
    }
    return List.from(_products);
  }

  void toggleDisplayMode(){
    _showFavorites = !_showFavorites;
    notifyListeners();
  }



  void updateProduct( String title, String description, String image, double price){
    final Product updatedProduct =
    Product(
        title: title,
        description: description,
        price: price,
        image: image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);


    _products[selectedProductIndex] = updatedProduct;

  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
  }

  void toggleProductFavoriteStatus(){

    final bool isCurrentlyFavorite = _products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newFavoriteStatus);
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
    //_selectedProductIndex = null;

  }

  void selectProduct(int index)
  {
    _selProductIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }
}


mixin   UserModel on  ConectedProductsModel{

  void login(String email, String password){
    _authenticatedUser = User(id:'dsfsdfsdfsd', email: email, password: password);
  }



}

