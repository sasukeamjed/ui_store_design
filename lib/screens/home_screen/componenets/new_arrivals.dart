import 'package:flutter/material.dart';
import 'package:ui_store_design/models/product.dart';
import 'package:ui_store_design/size_config.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "New Arrivals",
                style: TextStyle(
                  fontFamily: "Avenir",
                  fontSize: getProportionateScreenWidth(24),
                ),
              ),
              Spacer(),
              Text(
                "Show all",
                style: TextStyle(
                    fontFamily: "Avenir-Book",
                    fontSize: getProportionateScreenWidth(15)),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          SizedBox(
            height: getProportionateScreenWidth(200),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index){
                return NewArrivalItem(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewArrivalItem extends StatefulWidget {
  const NewArrivalItem({
    Key? key, required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<NewArrivalItem> createState() => _NewArrivalItemState();
}

class _NewArrivalItemState extends State<NewArrivalItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                  widget.product.img),
              Positioned(
                right: 1,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      widget.product.isFavorited = !widget.product.isFavorited;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    child: widget.product.isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          Text(widget.product.title, style: TextStyle(fontFamily: "Avenir", fontSize: getProportionateScreenWidth(17)),),
          Text("\$${widget.product.price}", style: TextStyle(fontFamily: "Avenir-Book", fontSize: getProportionateScreenWidth(15), color: Colors.black.withOpacity(0.4)),),
        ],
      ),
    );
  }
}
