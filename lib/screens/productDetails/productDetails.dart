import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onlineShopUIKit/animasions/FadeAnimation.dart';
import 'package:onlineShopUIKit/animasions/rightToLeft.dart';
import 'package:onlineShopUIKit/helper/theme.dart';
import 'package:onlineShopUIKit/modal/products.dart';
import 'package:onlineShopUIKit/provider/productsProvider.dart';
import 'package:onlineShopUIKit/screens/productDetails/widget/orderPlacedDialog.dart';
import 'package:onlineShopUIKit/widget/appText.dart';
import 'package:onlineShopUIKit/widget/buttons.dart';
import 'package:onlineShopUIKit/helper/helper.dart';
import 'package:onlineShopUIKit/widget/listItems.dart';
import 'package:onlineShopUIKit/screens/filterScreen/filterScreen.dart';
import 'package:onlineShopUIKit/screens/filterScreen/filtters.dart';
import 'package:onlineShopUIKit/screens/productDetails/productImage.dart';
import 'package:onlineShopUIKit/screens/productDetails/productViewImages.dart';
import 'package:onlineShopUIKit/widget/seeAllTitle.dart';
import 'package:onlineShopUIKit/widget/userProfilePic.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;

  List<ColorsCalss> colorsList = [
    new ColorsCalss(0, Colors.red, "Red"),
    new ColorsCalss(1, Colors.pink, "pink"),
    new ColorsCalss(2, Colors.brown, "brown"),
    new ColorsCalss(3, Colors.blue, "blue"),
    new ColorsCalss(4, Colors.green, "green"),
    new ColorsCalss(5, Colors.orange, "orange"),
    new ColorsCalss(6, Colors.white, "white"),
  ];
  List<SizeModale> sizeList = [
    new SizeModale(0, "s"),
    new SizeModale(1, "m"),
    new SizeModale(2, "l"),
    new SizeModale(3, "xl"),
    new SizeModale(4, "xxl"),
  ];

  List<int> selectedcolorIds = [];
  List<int> selectedSizeList = [];

  void selecteSize(SizeModale sizeModale) {
    setState(() {
      selectedSizeList.clear();
      selectedSizeList.add(sizeModale.sizeId);
    });
  }

  void selecteColorId(ColorsCalss colorsCalss) {
    setState(() {
      selectedcolorIds.clear();
      selectedcolorIds.add(colorsCalss.colorId);
    });
  }

  goToImageView2(List<String> images) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: ProductImageView(
              images: images,
            )));
  }

  changeSelectedSize(index) {
    setState(() {
      selectedSize = index;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return OrderPlacedDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<ProductsProvider>(
      builder: (context, loginStateProvider, child) {
        return Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return Scaffold(
            body: CustomScrollView(
              physics: Helper().getPhysicsForPlatForm(),
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: size.height * 0.5,
                  floating: false,
                  pinned: true,
                  title: Text(widget.product.name.toUpperCase()),
                  leading: IconButton(
                    icon: Icon(
                      EvaIcons.arrowIosBack,
                      // color: notifier.darkTheme ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      background: ProductImage(
                    images: widget.product.images,
                    goToImageView: goToImageView2,
                  )),
                ),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                  0.5,
                  Container(
                    margin: EdgeInsets.only(
                      top: 26,
                      left: 16,
                      right: 16,
                    ),
                    child: CategoryText(
                      text:
                          Helper().moneyFormat(widget.product.price.toString()),
                    ),
                  ),
                )),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                  0.5,
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 1),
                    child: Text(
                      widget.product.name.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                    ),
                  ),
                )),
                SliverToBoxAdapter(
                  child: FadeAnimation(
                      0.5,
                      ColorsFiltter(
                        title: null,
                        selectedcolorIds: selectedcolorIds,
                        colorsList: colorsList,
                        selecteColorId: selecteColorId,
                        smallView: true,
                      )),
                ),
                SliverToBoxAdapter(
                  child: FadeAnimation(
                    0.5,
                    SizeFlitter(
                      selectedSizeList: selectedSizeList,
                      selecteSize: selecteSize,
                      sizeList: sizeList,
                      title: null,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                        0.5,
                        Container(
                          margin: EdgeInsets.only(top: 22, left: 16, right: 16),
                          child: AppTextP1(
                            text: "Description",
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                        0.5,
                        Container(
                          margin: EdgeInsets.all(
                            16,
                          ),
                          child: HtmlText(text: widget.product.description),
                        ))),
                SliverToBoxAdapter(
                  child: FadeAnimation(
                    1,
                    Container(
                      margin: EdgeInsets.only(top: 18, left: 16, right: 16),
                      child: BlackButton(
                        function: () {
                          _showMyDialog();
                        },
                        buttonText: "ADD TO CART",
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 22,
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeAnimation(
                    1,
                    Container(
                      margin: EdgeInsets.only(
                          top: 8, left: 16, right: 16, bottom: 18),
                      child: AppButton(
                          color: Colors.white,
                          function: () {},
                          child: Center(
                            child: Text(
                              "ADD TO WISHLIST",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                  0.5,
                  Divider(),
                )),
                SliverToBoxAdapter(
                    child: FadeAnimation(
                  0.5,
                  SeeAppTitle(
                    title: "You might all so like",
                    function: null,
                  ),
                )),
                SliverToBoxAdapter(
                  child: Consumer<ProductsProvider>(
                    builder: (context, productsProvider, child) {
                      return Container(
                        height: 256,
                        child: ListView.builder(
                          physics: Helper().getPhysicsForPlatForm(),
                          scrollDirection: Axis.horizontal,
                          itemCount: productsProvider.products.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            Product product =
                                productsProvider.products.products[index];
                            return RightToLeft(
                                child: ProductItem(
                              function: () {
                                Helper().goToPage(
                                    context,
                                    ProductDetails(
                                      product: product,
                                    ));
                              },
                              imageUrl: product.image,
                              name: product.name,
                              price: Helper()
                                  .moneyFormat(product.price.toString()),
                            ));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
