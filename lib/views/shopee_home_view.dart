import 'package:flutter/material.dart';

class HomeShopeeView extends StatefulWidget {
  const HomeShopeeView({Key? key}) : super(key: key);

  @override
  State<HomeShopeeView> createState() => _HomeShopeeViewState();
}

class _HomeShopeeViewState extends State<HomeShopeeView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(),
            _optionCoin(),
            _optionMore(),
            _promotionCard(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    List<int> list = [1, 2, 3, 4, 5];
    final List<String> imgList = [
     // 'https://img.freepik.com/free-vector/application-smartphone-mobile-computer-payments-online-transaction-shopping-online-process-smartphone-vecter-cartoon-illustration-isometric-design_1150-59317.jpg'
      'https://www.shutterstock.com/image-vector/creates-custom-design-mobile-application-260nw-1977398858.jpg',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Stack(
        children: [
          Container(
            child: Image.network(imgList[0], fit: BoxFit.cover, width: 1000),
          ),
          // CarouselSlider(
          //   options: CarouselOptions(
          //     disableCenter: true,
          //   ),
          //   items: imgList
          //       .map((item) => Container(
          //             child:  Image.network(item, fit: BoxFit.cover, width: 1000),
          //           ))
          //       .toList(),
          // ),
          // ListView.builder(
          //     scrollDirection : Axis.horizontal,
          //     itemCount: 4,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return SizedBox(
          //         // width: double.maxFinite,
          //         child: Image.network(
          //             'https://www.shutterstock.com/image-vector/creates-custom-design-mobile-application-260nw-1977398858.jpg'),
          //       );
          //     },
          //   ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: const TextStyle(),
                    decoration: InputDecoration(
                      hintText: "........",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.black12)),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.notification_add,
                  color: Colors.white,
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(Icons.chat, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // choose muli options
  Widget _optionCoin(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),

      child: Row(
        children:  [
          const Expanded(
              flex: 2,
              child: Icon(Icons.qr_code_2, color: Colors.orange,)),
           const VerticalDivider(
            color: Colors.black,
            thickness: 2,
            width: 5,
          ),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.production_quantity_limits, color: Colors.orange,),
                  Text('Scan by QR'),
                ],
              )),
          const VerticalDivider(
            color: Colors.black,
            thickness: 2,
            width: 5,
          ),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.qr_code_2, color: Colors.orange,),
                  Text('Number coin'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _optionMore(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _optionMoreIcon(color:  const Color(0xFFFFE57F).withOpacity(0.3), iconData: Icons.shopify_sharp, valueIcon: 'shoeee')),
        Expanded(child: _optionMoreIcon(color:  const Color(0xFFFF9E80).withOpacity(0.3), iconData: Icons.settings_applications_sharp, valueIcon: 'promotion')),
        Expanded(child: _optionMoreIcon(color:  const Color(0xFFFFF9C4).withOpacity(0.3), iconData: Icons.local_mall, valueIcon: 'product')),
        Expanded(child: _optionMoreIcon(color:  const Color(0xFFF4511E).withOpacity(0.1), iconData: Icons.shop, valueIcon: 'aer mall ')),
        Expanded(child: _optionMoreIcon(color:  const Color(0xFFFFE57F).withOpacity(0.3), iconData: Icons.propane_tank_outlined, valueIcon: 'aree')),
        Expanded(child: _optionMoreIcon(color:  const Color(0xFFBF360C).withOpacity(0.1), iconData: Icons.countertops, valueIcon: 'shopee mall')),
      ],
    );
  }
  Column _optionMoreIcon({required Color color, required IconData iconData , required String valueIcon}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.only(left: 16, top: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(iconData),
          ),
        ),
        Text(valueIcon),
      ],
    );
  }

  // promotion
  Widget _promotionCard(){
    return Container(
      child: Image.network('https://www.shutterstock.com/image-vector/creates-custom-design-mobile-application-260nw-1977398858.jpg'),
    );
  }

}
