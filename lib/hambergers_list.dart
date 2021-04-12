import 'package:flutter/material.dart';
import 'package:flutter_app_hamberger/burger_page.dart';

import 'burger_page.dart';

class HambergersList extends StatefulWidget {
  final int row;
  HambergersList({this.row});

  @override
  _HambergersListState createState() => _HambergersListState();
}

class _HambergersListState extends State<HambergersList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;
    Widget baconImage = Container(
      height: 160,
      child: Image.asset('assets/images/cheeseburger-bacon-hamburger.png'),
    );

    Widget chickenImage = Container(
      height: 110,
      child: Image.asset('assets/images/PngItem.png'),
    );

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 240,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) {
            bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
            return Stack(
              children: [
                Container(
                  height: 240,
                  width: 200,
                  margin: EdgeInsets.only(
                      left: 20, right: items == index + 1 ? 20 : 0),
                  child: GestureDetector(
                    onTap: () {
                      //TODO NAVIGATOR
                      Navigator.of(context).pushNamed(BurgerPage.tag,
                          arguments:
                              reverse ? 'Chicken Burger' : 'Bacon Burger');
                    },
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              reverse ? 'Chicken Burger' : 'Bacon Burger',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  '15.95 AU\$',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                    ),
                  ),
                ),
                Positioned(
                  top: reverse ? 75 : 50,
                  child: GestureDetector(
                    onTap: () {
                      //TODO NAVIGATOR
                      Navigator.of(context).pushNamed(BurgerPage.tag,
                          arguments:
                              reverse ? 'Chicken Burger' : 'Bacon Burger');
                    },
                    child: reverse ? chickenImage : baconImage,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
