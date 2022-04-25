import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vrshoppy/Screens/cart.dart';
import 'package:vrshoppy/Screens/search_results.dart';
import 'package:vrshoppy/Widgets/custom_card.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:vrshoppy/Screens/webview_screen.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  List<String> carouselImages = [
    'assets/images/banner2.png',
    'assets/images/banner3.png'
  ];
  List<String> acceptedWords = [
    'furniture',
    'electronics',
    'mobiles',
    'phones',
    'phone',
    'electronic',
    'beds',
    'bed'
  ];
  final snackBar = const SnackBar(
    content: Text("Sorry! We couldn't find that"),
    backgroundColor: (Colors.black),
  );
  TextEditingController myController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.initState();
    _initSpeech();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void showInSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(onStatus: (val) {
      if (val == 'done') {
        if (acceptedWords.contains(_lastWords)) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchResults(_lastWords)));
        } else {
          showInSnackBar();
        }
      }
    });
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    setState(() {
      _lastWords = '';
    });
    await _speechToText.listen(onResult: _onSpeechResult);
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: SafeArea(
          child: Drawer(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Container(
                    height: size.height * 0.04,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                              'https://vrshoppy.herokuapp.com/vrmode')));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(FontAwesomeIcons.vrCardboard),
                          SizedBox(width: 15),
                          Text("View in VR",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16))
                        ]),
                  ),
                  Container(height: size.height * 0.02),
                  Row(children: const [
                    Icon(Icons.person),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Profile",
                        style: TextStyle(color: Colors.black, fontSize: 16))
                  ]),
                  Container(height: size.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ));
                    },
                    child: Row(children: const [
                      Icon(FontAwesomeIcons.shoppingCart),
                      SizedBox(width: 15),
                      Text("Cart",
                          style: TextStyle(color: Colors.black, fontSize: 16))
                    ]),
                  ),
                  Container(height: size.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return logoutDialog(context);
                          });
                    },
                    child: Row(children: const [
                      Icon(FontAwesomeIcons.powerOff),
                      SizedBox(width: 15),
                      Text("Logout",
                          style: TextStyle(color: Colors.black, fontSize: 16))
                    ]),
                  )
                ])),
          ),
        ),
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.purple,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: myController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: InkWell(
                    onTap: () {
                      String text = myController.text;
                      if (acceptedWords.contains(text)) {
                        FocusScope.of(context).unfocus();
                        myController.clear();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchResults(text)));
                      } else {
                        FocusScope.of(context).unfocus();
                        showInSnackBar();
                      }
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.purple,
          onPressed:
              // If not yet listening for speech start, otherwise stop
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          icon: const Icon(Icons.mic),
          label: Text(
            // If listening is active show the recognized words
            _speechToText.isListening
                ? '$_lastWords'
                // If listening isn't active but could be tell the user
                // how to start it, otherwise indicate that speech
                // recognition is not yet ready or not supported on
                // the target device
                : _speechEnabled
                    ? 'Voice Search'
                    : 'Speech not available',
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            duration: Duration(milliseconds: 1500),
            content: Text('Tap back again to leave app'),
          ),
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: size.height * 0.15,
                width: size.width,
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      carouselImages[index],
                      fit: BoxFit.fitWidth,
                    );
                  },
                  itemCount: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: size.height * 0.72,
                  child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      String image = 'assets/images/electronics.jpg';
                      String text = 'Category';
                      if (index == 0) {
                        image = 'assets/images/electronics.jpg';
                        text = 'Electronics';
                      }
                      if (index == 1) {
                        image = 'assets/images/furniture.jpg';
                        text = 'Furniture';
                      }
                      if (index == 2) {
                        image = 'assets/images/mobiles.jpg';
                        text = 'Mobiles';
                      }
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchResults(text)));
                          },
                          child: customCard(text, image, 250));
                    },
                  ),
                ),
              ),
            ],
          )),
        ));
  }

  Dialog logoutDialog(context) {
    return Dialog(
      backgroundColor: Colors.purple,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text("VR Shoppy",
                    style: TextStyle(
                        fontFamily: 'ProximaNova',
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                const Text("Are you sure you want to logout?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.black.withOpacity(0.4),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "No",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
