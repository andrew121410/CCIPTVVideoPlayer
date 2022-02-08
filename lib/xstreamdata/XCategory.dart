class XCategory {
  final String _categoryId;
  final String _categoryName;
  final int _parentId;

  XCategory(this._categoryId, this._categoryName, this._parentId);

  int get parentId => _parentId;

  String get categoryName => _categoryName;

  String get categoryId => _categoryId;

  factory XCategory.fromJson(Map<String, dynamic> data) {
    final categoryId = data["category_id"] as String;
    final categoryName = data['category_name'] as String;
    final parentId = data['parent_id'] as int;
    return XCategory(categoryId, categoryName, parentId);
  }
}