import 'package:flutter/material.dart';
import 'package:shopapp/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'oldPrice': 120,
      'price': 85,
    },
    {
      'name': 'Red dress',
      'picture': 'images/products/dress1.jpeg',
      'oldPrice': 100,
      'price': 50,
    },
    {
      'name': 'Red dress',
      'picture': 'images/products/hills1.jpeg',
      'oldPrice': 100,
      'price': 50,
    },
    {
      'name': 'Red dress',
      'picture': 'images/products/skt1.jpeg',
      'oldPrice': 100,
      'price': 50,
    },
    {
      'name': 'Red dress',
      'picture': 'images/products/skt2.jpeg',
      'oldPrice': 100,
      'price': 50,
    },
    {
      'name': 'Red dress',
      'picture': 'images/products/dress2.jpeg',
      'oldPrice': 100,
      'price': 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          productName: productList[index]['name'],
          productPic: productList[index]['picture'],
          productOldPrice: productList[index]['oldPrice'],
          productPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String productName;
  final String productPic;
  final num productOldPrice;
  final num productPrice;

  SingleProduct({
    this.productName,
    this.productPic,
    this.productOldPrice,
    this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: Text('hero 1'),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    productDetailName: productName,
                    productDetailPrice: productPrice,
                    productDetailOldPrice: productOldPrice,
                    productDetailPicture: productPic,
                  )
                )
              ),
              child: GridTile(
                child: Image.asset(productPic, fit: BoxFit.cover,),
                footer: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          productName,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '\$$productPrice',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}