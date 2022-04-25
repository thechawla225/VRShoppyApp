import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrshoppy/Providers/cart_provider.dart';
import 'package:vrshoppy/products.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final snackBar = const SnackBar(
    content: Text("Removed From Cart"),
    backgroundColor: (Colors.black),
  );
  void showInSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    CartNotifier cartProvider = Provider.of<CartNotifier>(context);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(child: SingleChildScrollView(
          child: Consumer<CartNotifier>(builder: (context, notifier, _) {
        List<Product> cart = notifier.cart;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: size.height * 0.90,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  Product product = cart[index];
                  return GestureDetector(
                    onLongPress: () {
                      cartProvider.removeFromCart(product);
                      showInSnackBar();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  style: const TextStyle(fontSize: 20),
                                ),
                                RichText(
                                    maxLines: 10,
                                    softWrap: true,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        style: const TextStyle(
                                            color: Colors.black),
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
                itemCount: cart.length),
          ),
        );
      }))),
    );
  }
}
