import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prodution/models/product_model.dart';
import 'package:prodution/pages/detailhistory.dart';
import 'package:prodution/pages/signin.dart';

List<ProductModel> products = [];

bool isLoggedIn = false;

class homepage extends StatefulWidget {
  // Homepage({super.key});

  final String username;
  bool isLoggedIn;

  homepage({required this.username, required this.isLoggedIn});

  @override
  State<homepage> createState() => _HomeState();
}

class _HomeState extends State<homepage> {
  late Future<List<ProductModel>> _productsFuture;

  int canceledCount = 0;
  int finishedCount = 0;
  int ongoingCount = 0;

  bool _isLoaded = false;

  void _performLogout() {
    setState(() {
      widget.isLoggedIn = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => signin()),
    );
  }

  void initState() {
    super.initState();
    _productsFuture = ProductModel.getProductmodel();
    _getInitialInfo();
  }

  void _getInitialInfo() async {
    List<ProductModel> production = await _productsFuture;
    canceledCount = production
        .where((product) => product.status.toLowerCase() == 'canceled')
        .length;
    finishedCount = production
        .where((product) => product.status.toLowerCase() == 'finished')
        .length;
    ongoingCount = production
        .where((product) => product.status.toLowerCase() == 'ongoing')
        .length;

    if (!_isLoaded) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _head(),
          FutureBuilder<List<ProductModel>>(
            future: _productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<ProductModel> product = snapshot.data!;
                return _body(product);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _body(List<ProductModel> products) {
    List<ProductModel> ongoingProducts = products
        .where((product) => product.status.toLowerCase() == 'ongoing')
        .toList();

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ongoingProducts
                      .length, // Menggunakan produk dengan status 'ongoing' saja
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(),
                  itemBuilder: (context, index) {
                    return Container(height: 120, color: Color(0xff092863));
                  },
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Product On Progress',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: ongoingProducts.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 82,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 150.0, bottom: 5),
                              child: Text(
                                ongoingProducts[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromARGB(255, 0, 34, 205),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              ongoingProducts[index].status,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => detailhistory(),
                            ));
                          },
                          child: SvgPicture.asset(
                            'assets/icons/next.svg',
                            width: 20,
                            height: 20,
                            color: Color.fromARGB(255, 0, 34, 205),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: ongoingProducts[index].boxIsSelected
                          ? Colors.white
                          : Color.fromARGB(0, 255, 7, 7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 320,
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 295,
                    child: widget.isLoggedIn
                        ? GestureDetector(
                            onTap: () {
                              _performLogout();
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 35,
                                width: 35,
                                color: Color(0xff092863),
                                child: Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signin()),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 40,
                                width: 40,
                                color: Color(0xff092863),
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Production Status Apps',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          widget.isLoggedIn
                              ? 'Hi, ${widget.username} !'
                              : 'Hi, User !',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 120,
          left: 20,
          child: Container(
            height: 160,
            width: 315,
            decoration: BoxDecoration(
              color: Color(0xffD4E3FF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Production Note',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 185),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Canceled     : ' + canceledCount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff092863),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Ongoing       : ' + ongoingCount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff092863),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Finished       : ' + finishedCount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff092863),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
