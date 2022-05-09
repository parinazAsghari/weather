import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class ProductsModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  ProductsModel({this.responseDescription, this.responseCode, this.result});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    if (json['Result'] != null && json['Result'] !='[]') {
      // result = new List<Result>();

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(
        //     program: getSubStringBetween(element, 'Program:', ','),
        //     price: getSubStringBetween(element, 'Price:', ','),
        //     points: getSubStringBetween(element, 'Points:', ','),
        //     paymentType: getSubStringBetween(element, 'PaymentType:', ','),
        //     productId: getSubStringBetween(element, 'ProductId:', ','),
        //     transactionType: getSubStringBetween(element, 'TransactionType:', ','),
        //     productName: getSubStringBetween(element, 'ProductName:', ','),
        //     productDescription: getSubStringBetween(element, 'ProductDescription:', ','),
        //     partnerName: getSubStringBetween(element, 'PartnerName:', ','),
        //     imageUrl: getSubStringBetween(element, 'ImagePath:', ',')
        // ));
      });

//      json['Result'].forEach((v) {
//        result.add(new Result.fromJson(v));
//      });

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseCode'] = this.responseCode;
    if (this.result != null) {
      // data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? program;
  String? price;
  String? points;
  String? paymentType;
  String? productId;
  String? transactionType;
  String? productName;
  String? productDescription;
  String? partnerName;
  String? imageUrl;

  Result(
      {this.program,
        this.price,
        this.points,
        this.paymentType,
        this.productId,
        this.transactionType,
        this.productName,
        this.productDescription,
        this.partnerName,
        this.imageUrl
      });

  Result.fromJson(Map<String, dynamic> json) {
    program = json['Program'];
    price = json['Price'];
    points = json['Points'];
    paymentType = json['PaymentType'];
    productId = json['ProductId'];
    transactionType = json['TransactionType'];
    productName = json['ProductName'];
    productDescription = json['ProductDescription'];
    partnerName = json['PartnerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Program'] = this.program;
    data['Price'] = this.price;
    data['Points'] = this.points;
    data['PaymentType'] = this.paymentType;
    data['ProductId'] = this.productId;
    data['TransactionType'] = this.transactionType;
    data['ProductName'] = this.productName;
    data['ProductDescription'] = this.productDescription;
    data['PartnerName'] = this.partnerName;
    return data;
  }
}



// {
// "ResponseDescription": "OK",
// "ResponseCode": "0",
// "Result": "[
// {
// PointType:مجموع امتیازات قابل خرج,
// Points:20,
// Program:به توان تو,
// Price:,
// PaymentType:Points,
// ProductId:9SIA-COR6V,
// TransactionType:Redemption,
// ProductName:تخفیف 15 درصدی بیمه عمر,
// ProductDescription:,
// PartnerName:,
// ImagePath:/img/productimages/2.jpg},
//
// {PointType:مجموع امتیازات قابل خرج,
// Points:21,Program:به توان تو,Price:140000,PaymentType:Points + Pay,ProductId:9SIA-COR7H,
// TransactionType:Redemption,ProductName:تخفیف 20 درصدی بیمه خودرو,ProductDescription:,PartnerName:,
// ImagePath:/img/productimages/bimehkhodro.jpg},{PointType:مجموع امتیازات قابل خرج,Points:350,Program:به توان تو,Price:,PaymentType:Points,ProductId:9SIA-COR8N,TransactionType:Redemption,ProductName:مودم همراه,ProductDescription:,PartnerName:همراه اول,ImagePath:/img/productimages/3.jpg},{PointType:مجموع امتیازات قابل خرج,Points:35,Program:به توان تو,Price:350000,PaymentType:Points + Pay,ProductId:9SIA-COR98,TransactionType:Redemption,ProductName:بسته اینترنت 5 گیگ,ProductDescription:,PartnerName:همراه اول,ImagePath:/img/productimages/3.jpg},{PointType:مجموع امتیازات قابل خرج,Points:33,Program:به توان تو,Price:170000,PaymentType:Points + Pay,ProductId:9SIA-CORA3,TransactionType:Redemption,ProductName:تخفیف 10 درصدی بلیط داخلی,ProductDescription:,PartnerName:هواپیمایی ایران ایر,ImagePath:/img/productimages/5.jpg},{PointType:مجموع امتیازات قابل خرج,Points:30,Program:به توان تو,Price:,PaymentType:Points,ProductId:9SIA-CORAY,TransactionType:Redemption,ProductName:تخفیف 20 درصدی بر روی کالاهای سوپر مارکتی,ProductDescription:,PartnerName:دیجی کالا,ImagePath:/img/productimages/1.jpg},{PointType:مجموع امتیازات قابل خرج,Points:10,Program:به توان تو,Price:,PaymentType:Points,ProductId:9SIA-CORBI,TransactionType:Redemption,ProductName:بسته ارسال رایگان به مدت یک ماه,ProductDescription:,PartnerName:اسنپ,ImagePath:/img/productimages/snappfood.png},{PointType:مجموع امتیازات قابل خرج,Points:10,Program:به توان تو,Price:,PaymentType:Points,ProductId:9SIA-CORCM,TransactionType:Redemption,ProductName:کوپن 120 هزار ریالی بلیط سینما,ProductDescription:,PartnerName:سینما آزادی,ImagePath:/img/productimages/cinema.jpg},{PointType:مجموع امتیازات قابل خرج,Points:80,Program:به توان تو,Price:,PaymentType:Points,ProductId:9SIA-CORD6,TransactionType:Redemption,ProductName:تخفیف 1 میلیون ریالی عضویت یکساله,ProductDescription:,PartnerName:باشگاه انقلاب,ImagePath:/img/productimages/6.jpg},{PointType:,Points:,Program:به توان تو,Price:250000,PaymentType:Pay,ProductId:9SIA-COR82,TransactionType:Redemption,ProductName:تخفیف 20 درصدی خرید,ProductDescription:,PartnerName:هایپر استار,ImagePath:/img/productimages/1.jpg},{PointType:,Points:,Program:به توان تو,Price:1000000,PaymentType:Pay,ProductId:9SIA-COR9S,TransactionType:Redemption,ProductName:تخفیف 20 درصدی بلیط رفت و برگشت خارجی,ProductDescription:,PartnerName:هواپیمایی ایران ایر,ImagePath:/img/productimages/5.jpg},{PointType:,Points:,Program:به توان تو,Price:500000,PaymentType:Pay,ProductId:9SIA-CORBS,TransactionType:Redemption,ProductName:تخفیف 500 هزار ریالی اقامتگاه و هتل,ProductDescription:,PartnerName:علی بابا,ImagePath:/img/productimages/hotel.jpg},
// ]"
// }