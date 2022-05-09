import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class CouponsModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  CouponsModel({this.responseDescription, this.responseCode, this.result});

  CouponsModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    if (json['Result'] != null && json['Result'] !='[]'){
      // result = new List<Result>();

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(
        //     voucherNumber: getSubStringBetween(element, 'VoucherNumber:', ','),
        //     productName: getSubStringBetween(element, 'ProductName:', ','),
        //     quantity: getSubStringBetween(element, 'Quantity:', ','),
        //     expirationDate: getSubStringBetween(element, 'ExpirationDate:', ','),
        //     status: getSubStringBetween(element, 'Status:', ','),
        //     description: getSubStringBetween(element, 'Description:', ','),
        //
        // ));
      });

    }
    // result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseCode'] = this.responseCode;
    if (this.result != null) {
      // data['Result'] = this.result.map((v) => v.toJson()).toList();
    }    return data;
  }
}
class Result {
  String? voucherNumber;
  String? productName;
  String? quantity;
  String? expirationDate;
  String? status;
  String? description;


  Result(
      {this.voucherNumber,
        this.productName,
        this.quantity,
        this.expirationDate,
        this.status,
        this.description
      });

  Result.fromJson(Map<String, dynamic> json) {
    voucherNumber = json['VoucherNumber'];
    productName = json['ProductName'];
    quantity = json['Quantity'];
    expirationDate = json['ExpirationDate'];
    status = json['Status'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VoucherNumber'] = this.voucherNumber;
    data['ProductName'] = this.productName;
    data['Quantity'] = this.quantity;
    data['ExpirationDate'] = this.expirationDate;
    data['Status'] = this.status;
    data['Description'] = this.description;
    return data;
  }
}

// {
// "ResponseDescription": "OK",
// "ResponseCode": "0",
// "Result": "[
// {
// VoucherNumber:456850-24935337,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,
// ExpirationDate:1399/5/20 23:24:59,
// Status:Expired,
// Description:بسته اینترنت یک گیگابایت روزانه
// },
// {
// VoucherNumber:456850-24935347,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,
// ExpirationDate:1399/5/20 23:34:52,
// Status:Expired,
// Description:بسته اینترنت یک گیگابایت روزانه},
// {VoucherNumber:456850-24935357,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,
// ExpirationDate:1399/5/20 23:42:31,
// Status:Expired,
// Description:بسته اینترنت یک گیگابایت روزانه},
// {VoucherNumber:456850-24935367,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,
// ExpirationDate:1399/5/21 2:1:42,
// Status:Expired,Description:بسته اینترنت یک گیگابایت روزانه},
// {VoucherNumber:456850-24935377,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,ExpirationDate:1399/5/21 2:57:26,
// Status:Expired,Description:بسته اینترنت یک گیگابایت روزانه},
// {VoucherNumber:456850-24935385,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,
// ExpirationDate:1399/5/21 2:58:0,
// Status:Expired,
// Description:بسته اینترنت یک گیگابایت روزانه},{
// VoucherNumber:456850-24935427,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,
// ExpirationDate:1399/5/21 8:12:37,
// Status:Expired,Description:بسته اینترنت یک گیگابایت روزانه},
// {VoucherNumber:456850-24935487,
// ProductName:بسته اینترنت یک گیگابایت روزانه,
// Quantity:1,
// ExpirationDate:1399/5/22 1:17:24,
// Status:Expired,Description:بسته اینترنت یک گیگابایت روزانه},{VoucherNumber:456850-24935497,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 1:38:40,Status:Expired,Description:},{VoucherNumber:456850-24935537,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 1:50:50,Status:Expired,Description:},{VoucherNumber:456850-24935547,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:0:12,Status:Expired,Description:},{VoucherNumber:456850-24935557,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:8:34,Status:Expired,Description:},{VoucherNumber:456850-24935597,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:21:50,Status:Expired,Description:},{VoucherNumber:456850-24935617,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:30:12,Status:Expired,Description:},{VoucherNumber:456850-24935625,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:31:53,Status:Expired,Description:},{VoucherNumber:456850-24935633,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:33:21,Status:Expired,Description:},{VoucherNumber:456850-24935647,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:38:47,Status:Expired,Description:},{VoucherNumber:456850-24935657,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:43:27,Status:Expired,Description:},{VoucherNumber:456850-24935667,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 2:50:22,Status:Expired,Description:},{VoucherNumber:456850-24935677,ProductName:بسته اینترنت یک گیگابایت روزانه,Quantity:1,ExpirationDate:1399/5/22 2:52:17,Status:Expired,Description:بسته اینترنت یک گیگابایت روزانه},{VoucherNumber:456850-24935687,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 3:1:10,Status:Expired,Description:},{VoucherNumber:456850-24935695,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 3:1:50,Status:Expired,Description:},{VoucherNumber:456850-24935738,ProductName:تست,Quantity:1,ExpirationDate:1399/5/22 4:16:7,Status:Expired,Description:},{VoucherNumber:456850-24935747,ProductName:بسته اینترنت یک گیگابایت روزانه,Quantity:1,ExpirationDate:1399/5/22 4:33:31,Status:Expired,Description:بسته اینترنت یک گیگابایت روزانه},{VoucherNumber:456850-24977607,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/5/26 1:47:56,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-24977615,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/5/26 1:49:31,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-24977627,ProductName:بسته اینترنت یک روزه 1 گیگابایت,Quantity:1,ExpirationDate:1399/5/26 3:3:32,Status:Expired,Description:بسته اینترنت یک روزه 1 گیگابایت},{VoucherNumber:456850-24977637,ProductName:بسته اینترنت یک روزه 1 گیگابایت,Quantity:1,ExpirationDate:1399/5/26 7:57:2,Status:Expired,Description:بسته اینترنت یک روزه 1 گیگابایت},{VoucherNumber:456850-24977648,ProductName:تست,Quantity:1,ExpirationDate:1399/5/27 7:36:19,Status:Expired,Description:},{VoucherNumber:456850-24977656,ProductName:تست,Quantity:1,ExpirationDate:1399/5/27 7:36:45,Status:Expired,Description:},{VoucherNumber:456850-24978602,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/5/26 1:47:57,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-25044108,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/6/1 23:38:57,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-25044117,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/6/1 23:42:35,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-25044125,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/6/1 23:44:13,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-25044168,ProductName:بسته اینترنت یک روزه 1 گیگابایت,Quantity:1,ExpirationDate:1399/6/2 7:36:59,Status:Expired,Description:بسته اینترنت یک روزه 1 گیگابایت},{VoucherNumber:456850-25044179,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/6/2 7:43:58,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-25044188,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/6/2 7:45:5,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-25044196,ProductName:بسته اینترنت یک روزه  500 مگابایت,Quantity:1,ExpirationDate:1399/6/2 7:46:18,Status:Expired,Description:بسته اینترنت یک روزه 500 مگابایت},{VoucherNumber:456850-25044207,ProductName:بسته اینترنت یک روزه 1 گیگابایت,Quantity:1,ExpirationDate:1399/6/2 7:49:14,Status:Expired,Description:بسته اینترنت یک روزه 1 گیگابایت},{VoucherNumber:456850-25044217,ProductName:بسته اینترنت یک روزه 2 گیگابایت,Quantity:1,ExpirationDate:1399/6/2 8:1:39,Status:Expired,Description:بسته اینترنت یک روزه 2 گیگابایت},{VoucherNumber:456850-25044225,ProductName:بسته اینترنت هفت روزه 500 مگابایت,Quantity:1,ExpirationDate:1399/6/2 8:2:32,Status:Expired,Description:بسته اینترنت هفت روزه 500 مگابایت
//
//
// },]"
// }