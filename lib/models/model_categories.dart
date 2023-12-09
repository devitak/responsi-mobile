class CategoriesModel {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  CategoriesModel({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });
}

List<CategoriesModel> categoriesItems = [
  CategoriesModel(
    strCategoryThumb: 'assets/beef.png',
    strCategory: 'beef',
    strCategoryDescription: 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
  ),
  CategoriesModel(
    strCategoryThumb: 'assets/chicken.png',
    strCategory: 'chicken',
    strCategoryDescription: 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
  ),
  CategoriesModel(
    strCategoryThumb: 'assets/dessert.png',
    strCategory: 'dessert',
    strCategoryDescription: 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
  ),
  CategoriesModel(
    strCategoryThumb: 'assets/lamb.png',
    strCategory: 'lamb',
    strCategoryDescription: 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
  ),
  CategoriesModel(
    strCategoryThumb: 'assets/miscellaneous.png',
    strCategory: 'miscellaneous',
    strCategoryDescription: 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
  ),
  CategoriesModel(
    strCategoryThumb: 'assets/pasta.png',
    strCategory: 'pasta',
    strCategoryDescription: 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
  ),
];