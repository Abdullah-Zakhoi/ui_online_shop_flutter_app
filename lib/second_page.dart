import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'models/Product.dart';

class SecondPage extends StatefulWidget {
  SecondPage({@required this.clickOnItemToNextPage});
  final int clickOnItemToNextPage;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: products[widget.clickOnItemToNextPage].color,
        appBar: AppBar(
          elevation: 0.2,
          backgroundColor: products[widget.clickOnItemToNextPage].color,
          leading: FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.keyboard_backspace,
              size: 40,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: null,
              child: Icon(
                Icons.search,
                size: 40,
                color: Colors.white,
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.3),
                      padding: EdgeInsets.only(
                        top: size.height * 0.12,
                        left: kDefaultPaddin,
                        right: kDefaultPaddin,
                      ),
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Color'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        buildContainerColors(
                                            products[widget
                                                    .clickOnItemToNextPage]
                                                .color,
                                            true),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        buildContainerColors(
                                            Colors.orange, false),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        buildContainerColors(
                                            Colors.grey, false),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(color: kTextColor),
                                    children: [
                                      TextSpan(text: "Size\n"),
                                      TextSpan(
                                        text:
                                            "${products[widget.clickOnItemToNextPage].size} cm",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 20, top: 10, bottom: 30),
                            child: Text(
                              products[widget.clickOnItemToNextPage]
                                  .description,
                              style: TextStyle(height: 1.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
//                                mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    buildOutlineButton(
                                      icon: Icons.remove,
                                      press: () {
                                        if (numOfItems > 1) {
                                          setState(() {
                                            numOfItems--;
                                          });
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: kDefaultPaddin / 2),
                                      child: Text(
                                        // if our item is less  then 10 then  it shows 01 02 like that
                                        numOfItems.toString().padLeft(2, "0"),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    buildOutlineButton(
                                        icon: Icons.add,
                                        press: () {
                                          setState(() {
                                            numOfItems++;
                                          });
                                        }),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF6464),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/icons/heart.svg"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefaultPaddin),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin:
                                      EdgeInsets.only(right: kDefaultPaddin),
                                  height: 50,
                                  width: 58,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color:
                                          products[widget.clickOnItemToNextPage]
                                              .color,
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/add_to_cart.svg",
                                      color:
                                          products[widget.clickOnItemToNextPage]
                                              .color,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      color:
                                          products[widget.clickOnItemToNextPage]
                                              .color,
                                      onPressed: () {},
                                      child: Text(
                                        "Buy  Now".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Aristocratic Hand Bag',
//                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            products[widget.clickOnItemToNextPage].title,
//                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'price\n',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '\$${products[widget.clickOnItemToNextPage].price}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Image.asset(
                                  products[widget.clickOnItemToNextPage].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container buildContainerColors(Color myColor, bool isSelectedColor) {
//    Color myColor;
    return Container(
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border:
            Border.all(color: isSelectedColor ? myColor : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: myColor,
        ),
      ),
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
