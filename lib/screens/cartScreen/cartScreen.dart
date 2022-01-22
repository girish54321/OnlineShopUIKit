import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/modal/products.dart';
import 'package:onlineShopUIKit/screens/checkOutFlow/sumeryScreen/summearyScreen.dart';
import 'package:onlineShopUIKit/screens/productDetails/productDetails.dart';
import 'package:onlineShopUIKit/widget/floatingSerachButton.dart';
import 'package:onlineShopUIKit/widget/header.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/widget/statusBarBuilder.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin<CartScreen> {
  bool get wantKeepAlive => true;
  Products products;

  _products() async {
    var resBody = {
      "products": [
        {
          "id": 1,
          "category": "Jackets",
          "name": "Women Grey Solid Windcheater Biker Jacket",
          "rating": 5,
          "image":
              "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/11/22/00ab1fd3-5b02-40c3-9f76-7e0e087c26851574407044617-1.jpg",
          "description":
              "<p>Grey solid jacket, has a lapel collar, 2 pockets, button closure, long sleeves, straight hem, and cotton lining</p><p>Size &amp; Fit The model (height 5'8&quot;) is wearing a size S</p><p>Material &amp; Care Material: Cotton Machine Wash</p>",
          "available": true,
          "size": [],
          "images": [
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/11/22/00ab1fd3-5b02-40c3-9f76-7e0e087c26851574407044617-1.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/11/22/1898c107-8932-4f96-bde3-5f15709fbdb91574407044679-2.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/11/22/7a4ea339-89e8-455f-be41-118cb7b53a8a1574407044738-3.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/11/22/9a408353-74aa-40f0-9621-41a94d5a528c1574407044797-4.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/11/22/fc1cb199-b2ff-44ab-be58-f943d685f06d1574407044850-5.jpg"
          ],
          "color": "black",
          "price": 1099,
          "discount": 50,
          "mrp": 2199
        },
        {
          "id": 1,
          "category": "Shrug",
          "name": "Women Maroon Solid Open Front Shrug",
          "rating": 5,
          "image":
              "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/9/30/54dbfe28-6dd6-43e0-8fc2-f6ef075680c21569819989875-1.jpg",
          "description":
              "<p>Maroon solid open front regular shrug, has long sleeves, straight hem</p><p>Size &amp; Fit The model (height 5'8'') is wearing a size S</p><p>Material &amp; Care Polyester Hand-wash</p>",
          "available": true,
          "size": [],
          "images": [
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/9/30/54dbfe28-6dd6-43e0-8fc2-f6ef075680c21569819989875-1.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/9/30/008baf8e-5fd3-49b5-9140-eedfec1e24a11569819989918-2.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/9/30/0ac3bde3-03eb-4531-97e5-f5ce70c9d85e1569819989958-3.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/9/30/f0bb0dc9-3f45-4bbc-a722-90be00273ecb1569819989999-4.jpg",
            "https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/9/30/e5155a15-5b87-48a4-b28f-c0b6d3ba0ef71569819990039-5.jpg"
          ],
          "color": "black",
          "price": 1197,
          "discount": 40,
          "mrp": 1995
        }
      ]
    };
    setState(() {
      products = new Products.fromJson(resBody);
    });
  }

  @override
  void initState() {
    _products();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
      return Scaffold(
        body: StatusBarBuilder(
          dark: false,
          useProviderTheme: true,
          child: CustomScrollView(
            physics: Helper().getPhysicsForPlatForm(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: FadeAnimation(
                  0.5,
                  Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: AppHearder(
                            hideBackButton: false,
                            buttonText: "CART",
                            leftButtonColor: notifier.darkTheme
                                ? Colors.white
                                : Colors.black,
                            rightAction: [],
                            leftButton: true,
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 21,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  Product productItem = products.products[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 27),
                    child: FadeAnimation(
                      0.5,
                      CartItem(
                        size: size,
                        imageUrl: productItem.image,
                        price:
                            Helper().moneyFormat(productItem.price.toString()),
                        title: productItem.name,
                        function: () {
                          Helper().goToPage(
                              context, ProductDetails(product: productItem));
                        },
                      ),
                    ),
                  );
                }, childCount: products.products.length),
              ),
              SliverToBoxAdapter(
                  child: FadeAnimation(
                0.5,
                ListItemsWithDvider(
                  padding: EdgeInsets.symmetric(vertical: 11, horizontal: 18),
                  text: "Do you have a Promotional Code",
                  rightText: null,
                  rightIcon: null,
                ),
              )),
              SliverToBoxAdapter(
                  child: FadeAnimation(
                0.5,
                ListItemsWithDvider(
                  padding: EdgeInsets.symmetric(vertical: 11, horizontal: 18),
                  text: "Delivery",
                  rightText: "Standard - Free",
                  rightIcon: null,
                ),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 86,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FlothingSearchButton(
          buttonText: "BUY",
          function: () {
            Helper().goToPage(context, SummearyScreen());
          },
        ),
      );
    });
  }
}
