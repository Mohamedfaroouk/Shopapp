import 'package:flutter/material.dart';
import 'package:myshop/models/cartmodel.dart';
import 'package:myshop/models/homemodel.dart';
import 'package:myshop/providers/main_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<MainProvider>(builder: (context, value, child) {
      return value.cartsmodel == null
          ? CircularProgressIndicator()
          : ListView.separated(
              itemBuilder: (context, index) => cartitem(
                  context,
                  value.cartsmodel!,
                  index,
                  value,
                  value.cartsmodel!.data!.cartproducts),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: value.cartsmodel!.data!.cartproducts.length);
    });
  }
}

//modeldata[index]
Widget cartitem(context, model, index, MainProvider value, modeldata) {
  return Card(
    child: Row(children: [
      FadeInImage(
        width: MediaQuery.of(context).size.width * 0.2,
        imageErrorBuilder: (Context, Object _, StackTrace? __) {
          return Image.asset('assets/images/Fidget-spinner.gif');
        },
        image: NetworkImage(
          modeldata[index].image!,
        ),
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/images/Fidget-spinner.gif'),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              modeldata[index].name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "${modeldata[index].price!} EGP",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      IconButton(
          onPressed: () {
            value.deletcart(modeldata[index].id!, index);
          },
          icon: Icon(Icons.remove_shopping_cart))
    ]),
  );
}
