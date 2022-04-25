class Product {
  String title;
  String image;
  String link;
  String rating;
  String model;
  int listPrice;
  int sellingPrice;
  Map desc;
  // Optional Parameters
  int? ram;
  int? rom;
  int? battery;
  int? rearcamera;
  int? frontcamera;

  Product(this.title, this.image, this.link, this.rating, this.model,
      this.listPrice, this.sellingPrice, this.desc,
      [this.ram, this.rom, this.battery, this.frontcamera, this.rearcamera]);
}
