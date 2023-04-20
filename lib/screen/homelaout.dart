
import 'package:flutter/material.dart';
import 'package:storapp/Api_servecise/prodect_services.dart';
import 'package:storapp/models/ProductModel.dart';
import 'package:storapp/widgets/Prodect_Item.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName="HomeLayout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Trend',style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){} , icon: Icon(Icons.add_shopping_cart_sharp),color: Colors.black,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70,right: 10,left: 10),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices.getAllProduct(),
            builder:(context,snapshot){
            if(snapshot.hasData){
              List<ProductModel> products=snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100
                ), itemBuilder: (context,index)=>ProductItem(products[index]),
                itemCount: 20,
              );
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
            }
        ),
      ),
    );
  }
}
