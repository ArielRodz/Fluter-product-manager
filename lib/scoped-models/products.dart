import 'package:first_app/models/product.dart';
import 'package:scoped_model/scoped_model.dart';


class ProductsModel extends Model{

  List<Product>_products =[];

  int _selectedProductIndex;
  bool _showFavorites = false;


  int get selectedProductIndex => _selectedProductIndex;

  Product get selectedProduct {
      if(_selectedProductIndex == null)
      {
        return null;
      }
      return displayedProducts[selectedProductIndex];
  }



  bool get displayFavoritesOnly{
    return _showFavorites;
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


  void addProduct(Product product){
      _products.add(product);
      _selectedProductIndex = null;

  }

  void updateProduct( Product product){
      _products[_selectedProductIndex] = product;
      _selectedProductIndex = null;

  }

  void deleteProduct() {
      _products.removeAt(_selectedProductIndex);
      _selectedProductIndex = null;
  }

  void toggleProductFavoriteStatus(){

    final bool IsCurrentlyFavorite = _products[_selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !IsCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavorite: newFavoriteStatus);
        _products[selectedProductIndex] = updatedProduct;
        _selectedProductIndex = null;
        notifyListeners();
        //_selectedProductIndex = null;

  }

  void selectProduct(int index)
  {
    _selectedProductIndex = index;
  }






}