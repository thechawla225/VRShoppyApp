import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:vrshoppy/products.dart';
import 'package:vrshoppy/Screens/webview_screen.dart';
import 'package:vrshoppy/Providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ItemPage extends StatefulWidget {
  final Product? product;
  final List<Product>? remaining;
  const ItemPage({Key? key, this.product, this.remaining}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String title = "Init Val";
  String rating = "2.2 ★";
  String rateSetSize = "2,161 ratings";
  String model = '';
  int listPrice = 30000;
  int sellingPrice = 24000;
  String url = 'http://vrshoppy.herokuapp.com/vrmode';
  int? discount;
  List<TableRow> tableRows = [];
  Product? product;
  int number = 1;
  List<Product>? remaining;

  @override
  void initState() {
    remaining = widget.remaining;
    product = widget.product;
    title = product!.title;
    rating = product!.rating;
    model = product!.model;
    listPrice = product!.listPrice;
    sellingPrice = product!.sellingPrice;
    url = product!.link;
    tableRows = makeTable(product!.desc);

    discount = (((listPrice - sellingPrice) / listPrice) * 100).round();

    super.initState();
  }

  List<TableRow> makeTable(Map desc) {
    List<TableRow> tableRows = [];
    TableRow myWidget;
    for (var key in desc.keys) {
      myWidget = TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              key,
              style: const TextStyle(fontSize: 17),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(desc[key], style: const TextStyle(fontSize: 17))
          ]),
        ),
      ]);
      tableRows.add(myWidget);
    }

    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    CartNotifier cartProvider = Provider.of<CartNotifier>(context);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
            onTap: () {
              cartProvider.addToCart(product!);
            },
            child: Container(
                color: Colors.green,
                height: size.height * 0.08,
                width: size.width * 0.50,
                child: const Center(
                    child: Text("ADD TO CART",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
          ),
          GestureDetector(
            child: Container(
                color: Colors.purple,
                height: size.height * 0.08,
                width: size.width * 0.50,
                child: const Center(
                    child: Text("BUY NOW",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
          ),
        ]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => WebViewScreen(url)));
              },
              icon: const FaIcon(FontAwesomeIcons.vrCardboard,
                  color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.45,
                child: ModelViewer(
                  src: model,
                  ar: true,
                  autoRotate: true,
                  autoPlay: true,
                  cameraControls: true,
                ),
              ),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "ProximaNova"),
                      children: [TextSpan(text: title)])),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.green),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: Center(
                        child: Text(
                          rating,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      rateSetSize,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "ProximaNova"),
                        children: [
                      TextSpan(
                          text: listPrice.toString(),
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.blueGrey)),
                      TextSpan(
                          text: " ₹" + sellingPrice.toString(),
                          style: const TextStyle(fontSize: 23)),
                      TextSpan(
                          text: " " + discount.toString() + "% off",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 23)),
                    ])),
              ),
              const Text(
                "Product Details",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Table(
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: tableRows,
                  )),
              SizedBox(height: 25),
              Text(
                "Stats Comparison",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              showComparison(remaining!)
            ],
          ),
        ),
      ),
    );
  }

  Widget showComparison(List<Product> remaining) {
    Widget myDivider = const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Divider(
          color: Colors.black,
          thickness: 1.5,
        ));

    List<Widget> titles = [];
    List<num> rams = [];
    List<num> roms = [];
    List<num> batterySizes = [];
    List<num> frontCameras = [];
    List<num> rearCameras = [];
    List<String> headings = [
      "Ram",
      "Rom",
      "Battery Size",
      "Front Camera",
      "Rear Camera"
    ];

    for (var i = 0; i < 3; i++) {
      Product product = remaining[i];
      Widget tempTitle = Text(
        product.title,
        style: const TextStyle(fontSize: 13),
      );
      titles.add(tempTitle);
      rams.add(product.ram!);
      roms.add(product.rom!);
      batterySizes.add(product.battery!);
      frontCameras.add(product.frontcamera!);
      rearCameras.add(product.rearcamera!);
    }
    List<List<num>> listOfLists = [
      rams,
      roms,
      batterySizes,
      frontCameras,
      rearCameras
    ];

    List<Widget> children = [
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: titles)
    ];

    for (var i = 0; i < 5; i++) {
      Widget tempText = Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(headings[i]));
      Widget tempGraph = SfSparkBarChart(
        data: listOfLists[i],
        labelDisplayMode: SparkChartLabelDisplayMode.all,
        labelStyle: const TextStyle(
          fontSize: 17,
          fontFamily: "ProximaNova",
        ),
      );

      children.add(myDivider);
      children.add(tempText);
      children.add(tempGraph);
    }
    return Column(
      children: children,
    );
  }
}
