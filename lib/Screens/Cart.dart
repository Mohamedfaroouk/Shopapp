// ignore: file_names
import 'package:flutter/material.dart';
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
          ? const CircularProgressIndicator()
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => cartitem(
                          context,
                          value.cartsmodel!,
                          index,
                          value,
                          value.cartsmodel!.data!.cartproducts),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: value.cartsmodel!.data!.cartproducts.length),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(fontSize: 30),
                        textScaleFactor: 1,
                      ),
                      const Spacer(),
                      Text(
                        "${value.thetotal} EGP",
                        style: const TextStyle(fontSize: 30),
                        textScaleFactor: 1,
                      )
                    ],
                  ),
                )
              ],
            );
    });
  }
}

//modeldata[index]
Widget cartitem(context, model, index, MainProvider value, modeldata) {
  return Card(
    child: Row(children: [
      FadeInImage(
        width: MediaQuery.of(context).size.width * 0.2,
        // ignore: non_constant_identifier_names
        imageErrorBuilder: (Context, Object _, StackTrace? __) {
          return Image.asset('assets/images/Fidget-spinner.gif');
        },
        image: NetworkImage(
          modeldata[index].image!,
        ),
        fit: BoxFit.cover,
        placeholder: const AssetImage('assets/images/Fidget-spinner.gif'),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                modeldata[index].name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "${modeldata[index].price!} EGP",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      IconButton(
          onPressed: () {
            value.deletcart(modeldata[index], index);
          },
          icon: const Icon(Icons.remove_shopping_cart))
    ]),
  );
}
