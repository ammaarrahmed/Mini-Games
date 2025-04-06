import 'package:flutter/material.dart';
import 'api/open_food_facts_api.dart';
import 'dart:math';

void main() => runApp(SugarGameApp());

class SugarGameApp extends StatelessWidget {
  const SugarGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Hub',
      theme: ThemeData(
        primarySwatch: Colors.brown, // Keep the primary swatch as brown
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Set the top bar color to black
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // Set top bar text color to white
          iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
        ),
        scaffoldBackgroundColor: Color(0xFF4E4A45), // Set the background color to brownish grey
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF8B5E3C), // Set button color to mild brown
            foregroundColor: Colors.white, // Set button text color to white
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Set default text color to white
          bodyMedium: TextStyle(color: Colors.white), // Set secondary text color to white
        ),
      ),
      home: MainScreen(), // Set MainScreen as the initial screen
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game Hub')), // Top bar text color is set globally
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose a Game',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SugarGameScreen()),
                );
              },
              child: Text('Play Sugar Game'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaloprixGameScreen()),
                );
              },
              child: Text('Play Caloprix (Nutri-Score Guessing)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PriceGuessingGameScreen()),
                );
              },
              child: Text('Play The Price is Right (Price Guessing)'),
            ),
          ],
        ),
      ),
    );
  }
}

class SugarGameScreen extends StatefulWidget {
  const SugarGameScreen({super.key});

  @override
  _SugarGameScreenState createState() => _SugarGameScreenState();
}

class _SugarGameScreenState extends State<SugarGameScreen> with SingleTickerProviderStateMixin {
  final List<String> barcodes = [
    "5060495116988", "3017620429484", "3046920029480", "5000159484695", "5449000131805",
    "7622210449283", "7613034626844", "5000112548167", "8715700110626", "8000500310428",
    "7613033565977", "5000159411127", "5449000054227", "5000112548167", "7613033565977",
    "8000500310428", "8715700110626", "7622210449283", "5449000131805", "3017620429484"
  ];

  String productName = "";
  String productImage = "";
  int actualSugarCubes = 0;
  double guessedSugarCubes = 0;
  bool? isCorrect;

  late AnimationController _controller;
  late Animation<double> _fallAnimation;

  // Debugging data
  Map<String, int> sugarContentByBarcode = {};
  bool showDebugInfo = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fallAnimation = Tween<double>(begin: -50, end: MediaQuery.of(context).size.height * 0.7).animate(
      // Adjust the end position to 20% lower (70% of the screen height)
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _fetchProductData();
    _fetchSugarContentForDebugging();
  }

  Future<void> _fetchProductData() async {
    final randomBarcode = barcodes[Random().nextInt(barcodes.length)];
    final product = await OpenFoodFactsAPI.fetchProduct(randomBarcode);
    if (product != null) {
      setState(() {
        productName = product['product_name'] ?? "Unknown Product";
        productImage = product['image_url'] ?? "";
        actualSugarCubes = (product['nutriments']['sugars_100g'] ?? 0).round();
      });
    }
  }

  Future<void> _fetchSugarContentForDebugging() async {
    for (String barcode in barcodes) {
      final product = await OpenFoodFactsAPI.fetchProduct(barcode);
      if (product != null) {
        final sugarContent = (product['nutriments']['sugars_100g'] ?? 0).round();
        if (mounted) {
          setState(() {
            sugarContentByBarcode[barcode] = sugarContent;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkGuess() {
    setState(() {
      isCorrect = (guessedSugarCubes.round() == actualSugarCubes);
      if (!isCorrect!) {
        _controller.reset();
        _controller.forward();
      }
    });

    // Load the next product after a delay
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          guessedSugarCubes = 0; // Reset the slider
          isCorrect = null; // Reset the result
        });
        _fetchProductData(); // Fetch the next product
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How Much Sugar?'), // Top bar text color is set globally
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Top bar color is already set globally in the theme
      ),
      body: productName.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      productImage.isNotEmpty
                          ? Image.network(
                              productImage,
                              height: 200,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.broken_image, size: 200, color: Colors.grey);
                              },
                            )
                          : Icon(Icons.broken_image, size: 200, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        productName,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Guess the sugar (in cubes): ${guessedSugarCubes.round()}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Slider(
                        min: 0,
                        max: 15,
                        divisions: 15,
                        value: guessedSugarCubes,
                        onChanged: (val) {
                          setState(() {
                            guessedSugarCubes = val;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: checkGuess,
                        child: Text('Submit Guess'),
                      ),
                      if (isCorrect != null)
                        Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              isCorrect! ? 'Correct! 🎉' : 'Oops! It’s $actualSugarCubes cubes.',
                              style: TextStyle(
                                fontSize: 18,
                                color: isCorrect! ? Colors.green : Colors.red,
                              ),
                            ),
                            SizedBox(height: 10),
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 30,
                              width: actualSugarCubes * 20,
                              color: Colors.brown[200],
                              child: Center(
                                child: Text(
                                  '$actualSugarCubes sugar cubes',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Loading next product...',
                              style: TextStyle(fontSize: 16, color: Colors.white70),
                            ),
                          ],
                        ),
                      if (showDebugInfo)
                        Expanded(
                          child: ListView(
                            children: sugarContentByBarcode.entries.map((entry) {
                              return ListTile(
                                title: Text(
                                  "Barcode: ${entry.key}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  "Sugar: ${entry.value}g/100g",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
                if (isCorrect == false)
                  Stack(
                    children: List.generate(5, (index) {
                      return AnimatedBuilder(
                        animation: _fallAnimation,
                        builder: (context, child) {
                          return Positioned(
                            top: _fallAnimation.value,
                            left: MediaQuery.of(context).size.width / 2 - 100 + (index * 40),
                            child: Image.asset(
                              'assets/sugar-cube.png',
                              width: 50,
                              height: 50,
                            ),
                          );
                        },
                      );
                    }),
                  ),
              ],
            ),
    );
  }
}

class CaloprixGameScreen extends StatefulWidget {
  const CaloprixGameScreen({super.key});

  @override
  _CaloprixGameScreenState createState() => _CaloprixGameScreenState();
}

class _CaloprixGameScreenState extends State<CaloprixGameScreen> {
  final List<String> barcodes = [
    "5060495116988", "3017620429484", "3046920029480", "5000159484695", "5449000131805",
    "7622210449283", "7613034626844", "5000112548167", "8715700110626", "8000500310428"
  ];

  String productName = "";
  String productImage = "";
  String correctNutriScore = "";
  String? guessedNutriScore;
  bool? isCorrect;
  int streak = 0;
  bool isLoading = true; // Add loading state

  @override
  void initState() {
    super.initState();
    _fetchProductData();
  }

  Future<void> _fetchProductData() async {
    setState(() {
      isLoading = true; // Start loading
    });
    final randomBarcode = barcodes[Random().nextInt(barcodes.length)];
    final product = await OpenFoodFactsAPI.fetchProduct(randomBarcode);
    if (product != null) {
      setState(() {
        productName = product['product_name'] ?? "Unknown Product";
        productImage = product['image_url'] ?? "";
        correctNutriScore = product['nutriscore_grade']?.toUpperCase() ?? "Unknown";
        isLoading = false; // Stop loading
      });
    }
  }

  void checkGuess(String guess) {
    setState(() {
      guessedNutriScore = guess;
      isCorrect = (guess == correctNutriScore);
      if (isCorrect!) {
        streak++;
      } else {
        streak = 0; // Reset streak on incorrect guess
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caloprix (Nutri-Score Guessing)'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  productImage.isNotEmpty
                      ? Image.network(
                          productImage,
                          height: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.broken_image, size: 200, color: Colors.grey);
                          },
                        )
                      : Icon(Icons.broken_image, size: 200, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    productName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Guess the Nutri-Score:",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: ["A", "B", "C", "D", "E"].map((score) {
                      return ElevatedButton(
                        onPressed: () => checkGuess(score),
                        child: Text(score),
                      );
                    }).toList(),
                  ),
                  if (isCorrect != null)
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          isCorrect!
                              ? 'Correct! 🎉 Your streak: $streak'
                              : 'Oops! The correct answer is $correctNutriScore.',
                          style: TextStyle(
                            fontSize: 18,
                            color: isCorrect! ? Colors.green : Colors.red,
                          ),
                        ),
                        if (!isCorrect!)
                          SizedBox(height: 10),
                        if (!isCorrect!)
                          Text(
                            'Nutri-Score is based on factors like calories, sugar, fat, and fiber.',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                ],
              ),
            ),
    );
  }
}

class PriceGuessingGameScreen extends StatefulWidget {
  const PriceGuessingGameScreen({super.key});

  @override
  _PriceGuessingGameScreenState createState() => _PriceGuessingGameScreenState();
}

class _PriceGuessingGameScreenState extends State<PriceGuessingGameScreen> {
  final List<String> barcodes = [
    "5060495116988", "3017620429484", "3046920029480", "5000159484695", "5449000131805",
    "7622210449283", "7613034626844", "5000112548167", "8715700110626", "8000500310428"
  ];

  String productName = "";
  String productImage = "";
  double actualPrice = 0.0;
  double guessedPrice = 0.0;
  String feedback = "Start guessing!";
  bool isLoading = true; // Add loading state
  double maxPrice = 0.0; // Dynamically set max price
  int divisions = 100; // Dynamically set divisions

  @override
  void initState() {
    super.initState();
    _fetchProductData();
  }

  Future<void> _fetchProductData() async {
    setState(() {
      isLoading = true; // Start loading
    });
    final randomBarcode = barcodes[Random().nextInt(barcodes.length)];
    final product = await OpenFoodFactsAPI.fetchProduct(randomBarcode);
    if (product != null) {
      setState(() {
        productName = product['product_name'] ?? "Unknown Product";
        productImage = product['image_url'] ?? "";
        actualPrice = (product['product_price'] ?? 0.0).toDouble();
        maxPrice = (actualPrice * 2).ceilToDouble(); // Set max price dynamically
        divisions = 100; // Reset divisions
        guessedPrice = 0.0; // Reset guessed price
        isLoading = false; // Stop loading
      });
    } else {
      setState(() {
        isLoading = false; // Stop loading even if the product fetch fails
      });
    }
  }

  void checkGuess() {
    setState(() {
      if (guessedPrice < actualPrice) {
        feedback = "More!";
      } else if (guessedPrice > actualPrice) {
        feedback = "Less!";
      } else {
        feedback = "Correct! 🎉";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Price is Right (Price Guessing)'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  productImage.isNotEmpty
                      ? Image.network(
                          productImage,
                          height: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.broken_image, size: 200, color: Colors.grey);
                          },
                        )
                      : Icon(Icons.broken_image, size: 200, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    productName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Guess the price:",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "\$${guessedPrice.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Slider(
                    min: 0,
                    max: maxPrice > 0 ? maxPrice : 1.0, // Ensure maxPrice is valid
                    divisions: divisions > 0 ? divisions : 1, // Ensure divisions are valid
                    value: guessedPrice,
                    onChanged: (val) {
                      setState(() {
                        guessedPrice = val;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: checkGuess,
                    child: Text('Submit Guess'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    feedback,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
    );
  }
}
