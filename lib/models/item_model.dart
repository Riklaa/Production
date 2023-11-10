class ItemModel {
  String name;
  String date;
  bool boxIsSelected;

  ItemModel(
      {required this.name, required this.date, required this.boxIsSelected});

  static List<ItemModel> getItemModel() {
    List<ItemModel> itemModels = [];

    itemModels.add(ItemModel(
      name: 'Coil Spring 839',
      date: '05/12/2022',
      boxIsSelected: true,
    ));

    itemModels.add(ItemModel(
      name: 'Inerbox Weg 24886',
      date: '05/12/2022',
      boxIsSelected: true,
    ));

    itemModels.add(ItemModel(
      name: 'Body N54',
      date: '05/12/2022',
      boxIsSelected: true,
    ));

    itemModels.add(ItemModel(
      name: 'Modular Jake 63737',
      date: '05/12/2022',
      boxIsSelected: true,
    ));

    return itemModels;
  }
}
