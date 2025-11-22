import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyCatalogApp());
}

class MyCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatefulWidget {
  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int selectedTab = 0;
  int bottomIndex = 0;
  final NumberFormat currency = NumberFormat.currency(symbol: '£', decimalDigits: 2);

  final List<String> tabs = ["HOME", "EYES", "LIPS", "FACE"];

  final List<Map<String, dynamic>> products = [

    {
      "image": "lib/assets/images/eyeliner.jpg",
      "title": "Hyper Easy Eyeliner",
      "rating": 4.2,
      "reviews": "1.5K",
      "price": 18.25,
      "oldPrice": 39.65,
      "discount": "53% OFF",
      "tag": "Best Seller",
      "category": "EYES",
    },
    {
      "image":"lib/assets/images/tattoo-liner.jpg" ,
      "title": "Tattoo Liner",
      "rating": 4.4,
      "reviews": "2.1K",
      "price": 19.65,
      "oldPrice": 42.65,
      "discount": "54% OFF",
      "tag": "Top Rated",
      "category": "EYES",
    },
    {
      "image": "lib/assets/images/volumizin-mascara.png",
      "title": "Volumizing Mascara",
      "rating": 4.1,
      "reviews": "3.2K",
      "price": 15.00,
      "oldPrice": 30.00,
      "discount": "50% OFF",
      "tag": "Best Seller",
      "category": "EYES",
    },
    {
      "image": "lib/assets/images/liquid-eyeliner.jpg",
      "title": "Liquid Eyeliner Pro",
      "rating": 4.3,
      "reviews": "980",
      "price": 22.00,
      "oldPrice": 45.00,
      "discount": "51% OFF",
      "tag": "Best Seller",
      "category": "EYES",
    },
    {
      "image": "lib/assets/images/presicion-eyeliner.jpg",
      "title": "Precision Eyeliner",
      "rating": 4.6,
      "reviews": "3.8K",
      "price": 25.00,
      "oldPrice": 50.00,
      "discount": "50% OFF",
      "tag": "Best Seller",
      "category": "EYES",
    },
    {
      "image": "lib/assets/images/waterproof-mascara.jpg",
      "title": "Waterproof Mascara",
      "rating": 4.1,
      "reviews": "1.1K",
      "price": 14.75,
      "oldPrice": 29.99,
      "discount": "51% OFF",
      "tag": "New",
      "category": "EYES",
    },
    {
      "image": "lib/assets/images/eyelash-serum.jpg",
      "title": "Glossy Eyelash Serum",
      "rating": 4.2,
      "reviews": "4.7K",
      "price": 11.30,
      "oldPrice": 23.00,
      "discount": "51% OFF",
      "tag": "Best Seller",
      "category": "EYES",
    },
    {
      "image": "lib/assets/images/browliner.jpg",
      "title": "Precision Brow Liner",
      "rating": 4.0,
      "reviews": "2.9K",
      "price": 9.99,
      "oldPrice": 19.99,
      "discount": "50% OFF",
      "tag": "Top Rated",
      "category": "EYES",
    },

   
    {
      "image": "lib/assets/images/superstay-lip.jpg",
      "title": "Super Stay Lip Vinyl",
      "rating": 4.5,
      "reviews": "5.1K",
      "price": 12.50,
      "oldPrice": 28.00,
      "discount": "55% OFF",
      "tag": "New",
      "category": "LIPS",
    },
    {
      "image": "lib/assets/images/matte-lipstik.jpg",
      "title": "SuperStay Matte Lipstick",
      "rating": 4.0,
      "reviews": "2.4K",
      "price": 10.95,
      "oldPrice": 24.00,
      "discount": "54% OFF",
      "tag": "Top Rated",
      "category": "LIPS",
    },
    {
      "image": "lib/assets/images/plump-lipstik.jpg",
      "title": "Glossy Plump Lip Gloss",
      "rating": 4.2,
      "reviews": "4.7K",
      "price": 11.30,
      "oldPrice": 23.00,
      "discount": "51% OFF",
      "tag": "Best Seller",
      "category": "LIPS",
    },
    {
      "image": "lib/assets/images/velvetmatt-lipstik.jpg",
      "title": "Velvet Matte Lipstick",
      "rating": 4.3,
      "reviews": "3.2K",
      "price": 13.50,
      "oldPrice": 27.00,
      "discount": "50% OFF",
      "tag": "Best Seller",
      "category": "LIPS",
    },
    {
      "image": "lib/assets/images/tintlip.jpg",
      "title": "Lip Tint Rouge",
      "rating": 4.1,
      "reviews": "1.8K",
      "price": 9.99,
      "oldPrice": 19.99,
      "discount": "50% OFF",
      "tag": "New",
      "category": "LIPS",
    },
    {
      "image": "lib/assets/images/liquidlipstik-pro.jpg",
      "title": "Liquid Lipstick Pro",
      "rating": 4.4,
      "reviews": "2.9K",
      "price": 14.25,
      "oldPrice": 28.00,
      "discount": "51% OFF",
      "tag": "Top Rated",
      "category": "LIPS",
    },
    {
      "image": "lib/assets/images/mustrizing-lip.jpg",
      "title": "Moisturizing Lip Balm",
      "rating": 4.2,
      "reviews": "1.1K",
      "price": 8.75,
      "oldPrice": 17.00,
      "discount": "49% OFF",
      "tag": "Best Seller",
      "category": "LIPS",
    },
    {
      "image": "lib/assets/images/matte-lipstik.jpg",
      "title": "Matte Lip Cream",
      "rating": 4.1,
      "reviews": "3.0K",
      "price": 11.50,
      "oldPrice": 22.00,
      "discount": "48% OFF",
      "tag": "Top Rated",
      "category": "LIPS",
    },

   
    {
      "image": "lib/assets/images/liquid-foundation.jpg",
      "title": "Liquid Foundation",
      "rating": 4.2,
      "reviews": "2.1K",
      "price": 20.50,
      "oldPrice": 40.00,
      "discount": "49% OFF",
      "tag": "Best Seller",
      "category": "FACE",
    },
    {
      "image": "lib/assets/images/bbcream.jpg",
      "title": "BB Cream",
      "rating": 4.1,
      "reviews": "1.8K",
      "price": 18.00,
      "oldPrice": 35.00,
      "discount": "48% OFF",
      "tag": "Top Rated",
      "category": "FACE",
    },
    {
      "image": "lib/assets/images/compactpowder.jpg",
      "title": "Compact Powder",
      "rating": 4.0,
      "reviews": "1.5K",
      "price": 15.00,
      "oldPrice": 30.00,
      "discount": "50% OFF",
      "tag": "New",
      "category": "FACE",
    },
    {
      "image": "lib/assets/images/highlighter-stick.jpg",
      "title": "Highlighter Stick",
      "rating": 4.3,
      "reviews": "2.0K",
      "price": 12.50,
      "oldPrice": 25.00,
      "discount": "50% OFF",
      "tag": "Best Seller",
      "category": "FACE",
    },
    {
      "image": "lib/assets/images/blush-powder.jpg",
      "title": "Blush Powder",
      "rating": 4.1,
      "reviews": "1.2K",
      "price": 10.75,
      "oldPrice": 22.00,
      "discount": "51% OFF",
      "tag": "Top Rated",
      "category": "FACE",
    },
    {
      "image": "lib/assets/images/concealer.jpg",
      "title": "Concealer",
      "rating": 4.2,
      "reviews": "2.5K",
      "price": 13.50,
      "oldPrice": 27.00,
      "discount": "50% OFF",
      "tag": "New",
      "category": "FACE",
    },
    {
      "image": "lib/assets/images/face-primer.jpg",
      "title": "Face Primer",
      "rating": 4.0,
      "reviews": "1.9K",
      "price": 14.00,
      "oldPrice": 28.00,
      "discount": "50% OFF",
      "tag": "Best Seller",
      "category": "FACE",
    },
    {
      "image": "lib/assets/images/settig-spray.jpg",
      "title": "Setting Spray",
      "rating": 4.1,
      "reviews": "1.6K",
      "price": 15.50,
      "oldPrice": 30.00,
      "discount": "48% OFF",
      "tag": "Top Rated",
      "category": "FACE",
    },
  ];

  @override
  Widget build(BuildContext context) {
  
    final filteredProducts = selectedTab == 0
        ? products // HOME
        : products.where((p) => p['category'] == tabs[selectedTab]).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        title: Text(
          "Explore Collection",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [Icon(Icons.search, color: Colors.black), SizedBox(width: 12)],
      ),
      body: Column(
        children: [
          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tabs.length,
                (i) => GestureDetector(
                  onTap: () => setState(() => selectedTab = i),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedTab == i ? Colors.black : Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      tabs[i],
                      style: TextStyle(
                        color: selectedTab == i ? Colors.white : Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: filteredProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.60,
              ),
              itemBuilder: (context, index) {
                final p = filteredProducts[index];
                return ProductCard(product: p, currencyFormatter: currency);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (idx) => setState(() => bottomIndex = idx),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: "Deals"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Map<String, dynamic> product;
  final NumberFormat currencyFormatter;

  const ProductCard({required this.product, required this.currencyFormatter, Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool wished = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final img = p['image'] as String;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: [
                    Positioned.fill(child: Padding(padding: EdgeInsets.all(8), child: Image.asset(img, fit: BoxFit.contain))),
                    Positioned(
                      left: 8,
                      top: 8,
                      child: Container(
                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFEDFFEC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          p['tag'],
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                   
                    Positioned(
                      right: 8,
                      top: 8,
                      child: GestureDetector(
                        onTap: () => setState(() => wished = !wished),
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: wished ? Colors.red.shade50 : Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            wished ? Icons.favorite : Icons.favorite_border,
                            color: wished ? Colors.red : Colors.grey[700],
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 6),

             
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  p['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),

              SizedBox(height: 6),

        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.green, size: 16),
                    SizedBox(width: 6),
                    Text('${p['rating']} (${p['reviews']})',
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),

              SizedBox(height: 6),

            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      widget.currencyFormatter.format(p['price']),
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 6),
                    Text(
                      widget.currencyFormatter.format(p['oldPrice']),
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ),

       
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  p['discount'],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),

              SizedBox(height: 38), // 
            ],
          ),

         
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.add_shopping_cart,
                  color: Colors.white, size: 18),

               //grid
            ),
          ),
        ],
      ),
    );
  }
}