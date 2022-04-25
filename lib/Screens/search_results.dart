import 'package:flutter/material.dart';
import 'package:vrshoppy/Screens/item_screen.dart';
import 'package:vrshoppy/products.dart';

class SearchResults extends StatefulWidget {
  final String text;

  const SearchResults(this.text, {Key? key}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<Product> productList = [];
  List<Product> furnitureList = [];
  List<Product> myList = [];
  List<Product>? tempList;

  @override
  void initState() {
    productList = [
      Product(
          "Galaxy J7 ",
          'assets/images/samsungj7.png',
          'https://vrshoppy.herokuapp.com/samsungj7',
          "4.2 ★",
          "assets/3dmodels/iphone.glb",
          30000,
          24000,
          {
            'RAM | ROM': '3 GB RAM | 32GB ROM',
            'Processor': 'Exynos (Octa Code 1.6 GHz)',
            'Rear Camera': '13MP',
            'Front Camera': '13MP',
            'Display': '5.5 inch TFT LCD',
            'Battery': '3300 mAh',
            'Network Type': '2G, 3G, 4G',
            'SIM Type': 'Dual SIM',
            'Expandable Storage': 'No',
            'Audio Jack': 'No',
            'Quickm Charging': 'No',
            'In the Box':
                'Handset, Data cable, Travel Adaptor, Ejection Pin, Stereo Headset, User Manual',
            'Warranty':
                'Brand Warranty of 1 Year available for Mobile and 6 months for Accessories',
          },
          3,
          32,
          3300,
          13,
          13),
      Product(
          "GlowPhone Plus",
          'assets/images/glowphonepic.png',
          'https://vrshoppy.herokuapp.com/samsungj7',
          "4.2 ★",
          "assets/3dmodels/glowphone.glb",
          12000,
          10000,
          {
            'RAM | ROM': '2 GB RAM | 20GB ROM',
            'Processor': 'Snapdragon (Octa Code 1.6 GHz)',
            'Rear Camera': '8MP',
            'Front Camera': '5MP',
            'Display': '4 inch TFT LCD',
            'Battery': '2000 mAh',
            'Network Type': '2G, 3G, 4G',
            'SIM Type': 'Dual SIM',
            'Expandable Storage': 'No',
            'Audio Jack': 'No',
            'Quickm Charging': 'No',
            'In the Box':
                'Handset, Data cable, Travel Adaptor, Ejection Pin, Stereo Headset, User Manual',
            'Warranty':
                'Brand Warranty of 1 Year available for Mobile and 6 months for Accessories',
          },
          2,
          20,
          2000,
          5,
          8),
      Product(
          "HomingPhone 2",
          'assets/images/homingpinpic.png',
          'https://vrshoppy.herokuapp.com/samsungj7',
          "4.2 ★",
          "assets/3dmodels/homongpin.glb",
          30000,
          24000,
          {
            'RAM | ROM': '5 GB RAM | 40GB ROM',
            'Processor': 'Snapdragon (Octa Code 1.6 GHz)',
            'Rear Camera': '25MP',
            'Front Camera': '25MP',
            'Display': '5.5 inch TFT LCD',
            'Battery': '4000 mAh',
            'Network Type': '2G, 3G, 4G',
            'SIM Type': 'Dual SIM',
            'Expandable Storage': 'No',
            'Audio Jack': 'No',
            'Quickm Charging': 'No',
            'In the Box':
                'Handset, Data cable, Travel Adaptor, Ejection Pin, Stereo Headset, User Manual',
            'Warranty':
                'Brand Warranty of 1 Year available for Mobile and 6 months for Accessories',
          },
          5,
          40,
          4000,
          25,
          25),
      Product(
          "Nexus G7",
          'assets/images/phoneka.png',
          'https://vrshoppy.herokuapp.com/samsungj7',
          "4.0 ★",
          "assets/3dmodels/smartphone.glb",
          35000,
          20000,
          {
            'RAM | ROM': '4 GB RAM | 30GB ROM',
            'Processor': 'Snapdragon (Octa Code 1.6 GHz)',
            'Rear Camera': '12MP',
            'Front Camera': '12MP',
            'Display': '5 inch TFT LCD',
            'Battery': '3000 mAh',
            'Network Type': '2G, 3G, 4G',
            'SIM Type': 'Dual SIM',
            'Expandable Storage': 'No',
            'Audio Jack': 'YES',
            'Quickm Charging': 'No',
            'In the Box':
                'Handset, Data cable, Travel Adaptor, Ejection Pin, Stereo Headset, User Manual',
            'Warranty':
                'Brand Warranty of 1 Year available for Mobile and 6 months for Accessories',
          },
          4,
          30,
          3000,
          12,
          12),
      Product(
          "JBL PARTY BOX 300EU Party Speaker",
          'assets/images/speaker.png',
          'https://vrshoppy.herokuapp.com/jblspeaker',
          "4.5 ★",
          "assets/3dmodels/speaker.glb",
          60000,
          52999, {
        'Model': 'JBLS+PARTYBOX300EU',
        'Product Dimensions': '32 x 31 x 69 cm; 15.84 Kilograms',
        'Wattage': '120 Watts',
        'Battery Life': '18 Hours',
      })
    ];

    furnitureList = [
      Product(
          'European Wood Double Bed',
          'assets/images/bed1.png',
          'https://vrshoppyy.herokuapp.com/beds',
          "3.9 ★",
          "assets/3dmodels/bed1.glb",
          40000,
          30000, {
        'Dimensions': '206cm (W) x 159cm (L) x 88cm (H)',
        'Material':
            'Made with premium European standard particle board with an elegant finish that is resistant to humidity and stains.',
        'Storage':
            'Comes with spacious box storage for storing clothes, toys, linens, etc',
        'Testing':
            'Underwent dynamic loading tests over 21,000 cycles for durability and 10,000 cycles for edge stability',
        'Mattress Size': 'Ideal mattress size is 75*60 inch',
        'Capacity':
            'Load bearing capacity of 360kgs to provide proper support, Free from burrs and sharp edges for enhanced safety',
        'Safety':
            'Made free from toxins or harmful chemicals to promise safe usage',
        'Warrarnty': 'Includes a 3-year warranty on manufacturing defects',
      }),
      Product(
          'Stainless Metal Single Bed',
          'assets/images/bed2.png',
          'https://vrshoppyy.herokuapp.com/beds',
          "3.5 ★",
          "assets/3dmodels/bed2.glb",
          20000,
          15000, {
        'Dimensions': '72 IN(6ft) x 30 IN(2.5ft)',
        'Features':
            'Ready to use a roll away bed that can be quickly folded and placed within the cabinet, if not in use, slip away under the bed or into a closet.',
        'Noise Making':
            'Full platform bed frame offers a quiet, noise-free, supportive foundation for a mattress no box spring needed',
        'Folding Action':
            'Super folding Mechanism-Noiseless-Fast to fold and unfold.',
        'Mattress Size': 'Ideal mattress size is 75*60 inch',
        'Capacity': 'The folding bed can hold 300kg without any problems.',
        'Safety':
            'Made free from toxins or harmful chemicals to promise safe usage',
        'Warrarnty': 'Includes a 2-year warranty on manufacturing defects',
      }),
    ];

    if (widget.text == "furniture" || widget.text == "Furniture") {
      myList = furnitureList;
    } else {
      myList = productList;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // cloning list
    tempList = [...productList];
    tempList!..removeAt(tempList!.length - 1);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: SizedBox(
                  height: size.height * 0.05,
                  child: Text("Search Results for: " + widget.text,
                      style: TextStyle(fontSize: 20)),
                ),
              ),

              // Search Results list
              SizedBox(
                height: size.height * 0.75,
                width: size.height * 0.95,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      Product product = myList[index];
                      return GestureDetector(
                        onTap: () {
                          var anotherTempList = [...tempList!];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ItemPage(
                                    product: myList[index],
                                    remaining: anotherTempList
                                      ..remove(myList[index]),
                                  )));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                height: size.height * 0.15,
                                width: size.height * 0.15,
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.65,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.sellingPrice.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    RichText(
                                        maxLines: 10,
                                        softWrap: true,
                                        text: TextSpan(children: [
                                          TextSpan(
                                            style:
                                                TextStyle(color: Colors.black),
                                            text: product.title,
                                          ),
                                        ]))
                                  ]),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      );
                    },
                    itemCount: productList.length),
              ),
            ],
          ),
        ));
  }
}
