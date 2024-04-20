// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:baby_hub/models/product_model.dart';
import 'package:baby_hub/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baby_hub/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class fleshSaleWidget extends StatelessWidget {
  const fleshSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('products')
          .where('isSale', isEqualTo: true)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: Get.height / 5,
            child: Center(child: CupertinoActivityIndicator()),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No Products Found"),
          );
        }
        if (snapshot.data != null) {
          return Container(
            height: Get.height / 5.0,
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final productData = snapshot.data!.docs[index];
                  ProductModel productModel = ProductModel(
                    productId: productData['productId'],
                    categoryId: productData['categoryId'],
                    productName: productData['productName'],
                    categoryName: productData['categoryName'],
                    salePrice: productData['salePrice'],
                    fullPrice: productData['fullPrice'],
                    productImages: productData['productImages'],
                    deliveryTime: productData['deliveryTime'],
                    isSale: productData['isSale'],
                    productDescription: productData['productDescription'],
                    createdAt: productData['createdAt'],
                    updatedAt: productData['updatedAt'],
                  );
                  // CategoriesModel categoriesModel = CategoriesModel(
                  //     categoryId: snapshot.data!.docs[index]['categoryId'],
                  //     categoryImage: snapshot.data!.docs[index]
                  //         ['categoryImage'],
                  //     categoryName: snapshot.data!.docs[index]['categoryName'],
                  //     createdAt: snapshot.data!.docs[index]['createdAt'],
                  //     updatedAt: snapshot.data!.docs[index]['updatedAt']);
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width / 3.5,
                              heightImage: Get.height / 15,
                              imageProvider: CachedNetworkImageProvider(
                                  productModel.productImages[0]),
                              title: Center(
                                child: Text(
                                  productModel.productName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              footer: Row(
                                children: [
                                  Text(
                                    "Rs:${productModel.salePrice}",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                  Text(
                                    ":${productModel.fullPrice}",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        decoration: TextDecoration.lineThrough,
                                        color: appConstant.appMainColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          );
        }
        return Container();
      },
    );
  }
}
