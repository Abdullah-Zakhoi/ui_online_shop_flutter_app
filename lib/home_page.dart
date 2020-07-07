import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/Product.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Row in top
  List<String> categories = ['Hand bag', 'Jewellery', 'Footwear', 'Dresses'];
  int selected = 0;

  int clickOnItemToNextPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FlatButton(
          onPressed: null,
          child: Icon(
            Icons.keyboard_backspace,
            size: 40,
            color: kTextLightColor,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: null,
            child: Icon(
              Icons.search,
              size: 40,
              color: kTextLightColor,
            ),
          ),
          FlatButton(
            onPressed: null,
            child: Icon(
              Icons.shopping_cart,
              size: 40,
              color: kTextLightColor,
            ),
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Women',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontWeight: selected == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          margin: EdgeInsets.only(top: 5),
                          color: selected == index
                              ? Colors.black
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        clickOnItemToNextPage = index;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                                clickOnItemToNextPage: clickOnItemToNextPage),
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: products[index].color,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Image.asset(
                              products[index].image,
//                            fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(products[index].title),
                        ),
                        Text(products[index].price.toString()),
                      ],
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }
}
