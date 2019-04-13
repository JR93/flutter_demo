import 'package:flutter/material.dart';
import 'package:shopapp/main.dart';

class ProductDetails extends StatefulWidget {
  final String productDetailName;
  final num productDetailPrice;
  final num productDetailOldPrice;
  final String productDetailPicture;

  ProductDetails({
    this.productDetailName,
    this.productDetailPrice,
    this.productDetailOldPrice,
    this.productDetailPicture,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => new HomePage()
            ));
          },
          child: Text('Fashapp'),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: (){}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '\$${widget.productDetailOldPrice}',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$${widget.productDetailPrice}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Size'),
                          content: Text('Choose the size'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: Text('close'),
                            )
                          ],
                        );
                      }
                    );
                  },
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Colors'),
                          content: Text('Choose a color'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: Text('close'),
                            )
                          ],
                        );
                      }
                    );
                  },
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Quantity'),
                          content: Text('Choose the quantity'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: Text('close'),
                            )
                          ],
                        );
                      }
                    );
                  },
                  elevation: 0.2,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Qty'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text('Buy now'),
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_shopping_cart, color: Colors.red,),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.favorite_border, color: Colors.red,),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product details'),
            subtitle: Text('中华人民共和国，通称中国，是位于东亚的社会主义国家，首都位于北京。中国领土陆地面积约960万平方千米，是世界上纯陆地面积第二大、陆地面积第三大、总面积第三大或第四大的国家，其分为23个省份、5个自治区、4个直辖市和2个特别行政区。被视为亚洲地区重要地域大国，也被视为潜在超级大国。'),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product name',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.productDetailName),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product brand',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Brand X'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product condition',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('New'),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar products'),
          ),
          Container(
            height: 340.0,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }
}


class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => new _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index) {
        return SimilarSingleProduct(
          productName: productList[index]['name'],
          productPic: productList[index]['picture'],
          productOldPrice: productList[index]['oldPrice'],
          productPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final String productName;
  final String productPic;
  final num productOldPrice;
  final num productPrice;

  SimilarSingleProduct({
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