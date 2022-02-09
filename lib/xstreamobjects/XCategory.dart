class XCategory {
  final String _categoryId;
  final String _name;
  final int _parentId;

  XCategory(this._categoryId, this._name, this._parentId);

  int get parentId => _parentId;

  String get categoryName => _name;

  String get categoryId => _categoryId;

  factory XCategory.fromJson(Map<String, dynamic> data) {
    final categoryId = data["category_id"] as String;
    final name = data['category_name'] as String;
    final parentId = data['parent_id'] as int;
    return XCategory(categoryId, name, parentId);
  }
}