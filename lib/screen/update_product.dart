import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storapp/Api_servecise/prodect_services.dart';
import 'package:storapp/models/ProductModel.dart';
import 'package:storapp/widgets/custmTextfformfi;de.dart';

class UpdateProduct extends StatefulWidget {
  static const String routeName = 'UpdateProduct';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName, Descrition, imgae;

  dynamic price;

  bool isLoding=false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall:isLoding ,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'UpdateProdect',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextFormFiled(
                  hintText: 'ProductName',
                  onchange: (data) {
                    productName = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  textInputType: TextInputType.number,
                  hintText: 'Price',
                  onchange: (data) {},
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  hintText: 'Description',
                  onchange: (data) {
                    Descrition = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormFiled(
                  hintText: 'Image',
                  onchange: (data) {
                    imgae = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        isLoding=true;
                        setState(() {

                        });

                        try{
                          UpdateProdect(productModel);
                          print("sucss");


                        }catch(e){
                          print(e.toString());

                        }


                        isLoding =false;
                        setState(() {

                        });
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void UpdateProdect(ProductModel productModel) {
      AllProductServices.updateProductService(
       Id: productModel.id,
        name: productName == null? productModel.title!: productName!,
        price: price == null? productModel.price.toString(): price!,
        description: Descrition == null? productModel.description!: Descrition!,
        image: imgae == null? productModel.image!: imgae!,
        category: productModel.category!);
  }
}
