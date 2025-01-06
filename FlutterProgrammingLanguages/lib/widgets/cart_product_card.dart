import 'package:flutter/material.dart';

class CartProductCard extends StatefulWidget {
  const CartProductCard({super.key});

  @override
  State<CartProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<CartProductCard> {
  final String _productName = 'iPhone 16 Pro';
  final String _productImageUrl = 'assets/iPhone_16_pro.png';
  final double _productPrice = 1200;
  int _productCount = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xfff85247),
          ),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.delete,
            color: Color(0xffffffff),
            size: 40,
          ),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xfff85247),
          ),
          alignment: Alignment.centerRight,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.delete,
            color: Color(0xffffffff),
            size: 40,
          ),
        ),
        child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Color.fromARGB(255, 217, 217, 217),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    _productImageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _productName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 50, 50, 50),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close_rounded,
                              color: Color(0xffD9D9D9),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _productCount--;
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Color(0xffFF8D4D),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$_productCount',
                            style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _productCount++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: Color(0xffFF8D4D),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$${_productPrice * _productCount}',
                            style: TextStyle(
                              color: Color(0xff323232),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
