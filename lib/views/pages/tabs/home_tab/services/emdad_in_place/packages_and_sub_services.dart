import 'dart:convert';

import 'package:emdad_khodro_saipa/api_provider/provider.dart';
import 'package:emdad_khodro_saipa/models/response_model/get_packages_sub_services.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/choose_day_page.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/choose_relief_worker_page.dart';
import 'package:emdad_khodro_saipa/views/pages/tabs/home_tab/services/emdad_in_place/home_service_customer_form.dart';
import 'package:emdad_khodro_saipa/views/widgets/DialogWidgets.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_neomorphic_box.dart';
import 'package:emdad_khodro_saipa/views/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:expandable/expandable.dart';
import '../../../../../../constants.dart';
import 'package:emdad_khodro_saipa/globals.dart' as globals;

class PackagesAndSubServices extends StatefulWidget {
  const PackagesAndSubServices({Key? key}) : super(key: key);

  @override
  State<PackagesAndSubServices> createState() => _PackagesAndSubServicesState();
}

class _PackagesAndSubServicesState extends State<PackagesAndSubServices> {

  @override
  void initState() {
    super.initState();
    getPackagesAndSubServices();
  }


  bool loading = true;

  GetPackagesSubServices result = GetPackagesSubServices();


  //add comma in prices
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';


  getPackagesAndSubServices()async{
     result  = await ApiProvider.getPackagesSubServices();

    if(result.resultCode ==0){
      if(mounted){
        setState(() {

          loading = false;

        });
      }
    }
    else{
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'ورود اطلاعات',
              body: 'خطا در ارتباط با سرور، لطفا دوباره سعی کنید',
              positiveTxt: 'باشه',
            );
          });

      return;
    }

  }

  List<String> showDescList = [];

  @override
  Widget build(BuildContext context) {

    if(loading){
      return Center(child: CircularProgressIndicator(),);
    }


    return StatefulBuilder(builder: (_, setS) {
      List<ListTile> packageFiveList = [];
      List<ListTile> packageSevenList = [];
      List<ListTile> packageEightList = [];
      List<ListTile> packageNineList = [];




      List<String> finalSubService = [];

      result.data!.forEach((element) {

        String finalImage = element.imageBase64!.substring(element.imageBase64!.indexOf(',')+1, element.imageBase64!.length);
        String finalPrice = element.totalPrice!.toString().replaceAllMapped(reg, mathFunc);



        if(element.packageId == 5){
          packageFiveList.add(
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                title: Text(element.name!, style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      finalSubService.add(element.id!);

                      globals.finalSubServices.contains(element.id)?
                      globals.finalSubServices.remove(element.id)
                          :
                      globals.finalSubServices.add(element.id!);

                      globals.finalSubServices.forEach((element) {print(element);});
                    });
                    setS((){});
                  },
                  value:  globals.finalSubServices.contains(element.id!)? true:false,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(finalPrice + ' ریال'),
                    ),
                    if(showDescList.contains(element.id))Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(element.fullDescription!),
                    ),
                    if(!showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.add(element.id!);
                          setS((){});

                          setState((){});

                          print('id added to list');


                        },
                        child: Text('مشاهده جزئیات')),
                    if(showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.remove(element.id!);
                          setS((){});

                          setState((){});

                          print('id removed from list');



                        },
                        child: Text('جزئیات کمتر'))
                  ],
                ),
                trailing: Image.memory(base64Decode(finalImage)),
              ),
          );
        }
        if(element.packageId == 7){
          packageSevenList.add(
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                title: Text(element.name!, style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      finalSubService.add(element.id!);

                      globals.finalSubServices.contains(element.id)?
                      globals.finalSubServices.remove(element.id)
                          :
                      globals.finalSubServices.add(element.id!);

                      globals.finalSubServices.forEach((element) {print(element);});
                    });
                    setS((){});
                  },
                  value:  globals.finalSubServices.contains(element.id!)? true:false,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(finalPrice.toString() + ' ریال'),
                    ),
                    if(showDescList.contains(element.id))Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(element.fullDescription!),
                    ),
                    if(!showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.add(element.id!);
                          setS((){});

                          setState((){});

                          print('id added to list');


                        },
                        child: Text('مشاهده جزئیات')),
                    if(showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.remove(element.id!);
                          setS((){});

                          setState((){});

                          print('id removed from list');



                        },
                        child: Text('جزئیات کمتر'))


                  ],
                ),



                trailing: Image.memory(base64Decode(finalImage)),
              )
          );
        }
        if(element.packageId == 8){
          packageEightList.add(
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                title: Text(element.name!, style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      finalSubService.add(element.id!);

                      globals.finalSubServices.contains(element.id)?
                      globals.finalSubServices.remove(element.id)
                          :
                      globals.finalSubServices.add(element.id!);

                      globals.finalSubServices.forEach((element) {print(element);});
                    });
                    setS((){});
                  },
                  value:  globals.finalSubServices.contains(element.id!)? true:false,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(finalPrice.toString() + ' ریال'),
                    ),
                    if(showDescList.contains(element.id))Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(element.fullDescription!),
                    ),
                    if(!showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.add(element.id!);
                          setS((){});

                          setState((){});

                          print('id added to list');


                        },
                        child: Text('مشاهده جزئیات')),
                    if(showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.remove(element.id!);
                          setS((){});

                          setState((){});

                          print('id removed from list');



                        },
                        child: Text('جزئیات کمتر'))

                  ],
                ),



                trailing: Image.memory(base64Decode(finalImage)),
              )
          );
        }
        if(element.packageId == 9){
          packageNineList.add(
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),

                title: Text(element.name!, style: TextStyle(fontWeight: FontWeight.bold),),
                leading: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      finalSubService.add(element.id!);

                      globals.finalSubServices.contains(element.id)?
                      globals.finalSubServices.remove(element.id)
                          :
                      globals.finalSubServices.add(element.id!);

                      globals.finalSubServices.forEach((element) {print(element);});
                    });
                    setS((){});
                  },
                  value:  globals.finalSubServices.contains(element.id!)? true:false,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(finalPrice.toString() + ' ریال'),
                    ),
                    if(showDescList.contains(element.id))Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(element.fullDescription!),
                    ),
                    if(!showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.add(element.id!);
                          setS((){});

                          setState((){});

                          print('id added to list');


                        },
                        child: Text('مشاهده جزئیات')),
                    if(showDescList.contains(element.id)) TextButton(
                        onPressed: (){
                          showDescList.remove(element.id!);
                          setS((){});

                          setState((){});

                          print('id removed from list');



                        },
                        child: Text('جزئیات کمتر'))


                  ],
                ),



                trailing: Image.memory(base64Decode(finalImage)),
              )
          );
        }

      });
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            'assets/images/emdad_khodro_logo.png',
            // height: 30,
            width: MediaQuery.of(context).size.width * 0.45,
            fit: BoxFit.contain,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: defaultPadding, bottom: defaultPadding / 2),
                alignment: Alignment.center,
                child: const Text(
                  'خدمات در محل',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),


              ExpandableNotifier(
                  child: Expandable(
                    collapsed: Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);

                        return InkWell(
                          onTap: (){
                            controller?.toggle();

                          },
                          child: CustomNeomorphicBox(
                            title: '',
                            index: 0,
                            selectedIndex: 1,
                            isFull: true,
                            onTap: () {
                              controller?.toggle();

                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                            },
                            height: 75 / 640,
                            marginTop: 8,
                            marginRight: 28,
                            marginLeft: 0,
                            marginBottom: 0,
                            isChildText: false,
                            widget: _subItemBox(title: 'سرویس‌ خودرو', imagePath: 'assets/images/bazdid_fani.png'),
                          ),
                        );
                      },
                    ),
                    expanded: Container(
                      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Builder(
                              builder: (context) {
                                var controller = ExpandableController.of(context);
                                return Padding(
                                  padding: EdgeInsets.zero,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          controller?.toggle();

                                        },
                                        child: CustomNeomorphicBox(
                                          title: '',
                                          index: 0,
                                          selectedIndex: 1,
                                          isFull: true,
                                          onTap: () {
                                            controller?.toggle();

                                            // bool _chooseWorker = globals.chooseRelifSelected;
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (BuildContext context) => _chooseWorker ? const ChooseReliefWorkerPage() : const ChooseDayPage(),
                                            //   ),
                                            // );
                                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                                          },
                                          height: 75 / 640,
                                          marginTop: 8,
                                          marginRight: 28,
                                          marginLeft: 0,
                                          marginBottom: 0,
                                          isChildText: false,
                                          widget: _subItemBox(title: 'سرویس‌ خودرو', imagePath: 'assets/images/bazdid_fani.png'),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                          // color: Theme.of(context).cardColor,
                                        ),
                                        child: SizedBox(
                                          child: ListView(shrinkWrap: true, children: packageFiveList),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),


              ExpandableNotifier(
                  child: Expandable(
                    collapsed: Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);

                        return InkWell(
                          onTap: (){
                            controller?.toggle();

                          },
                          child: CustomNeomorphicBox(
                            title: '',
                            index: 0,
                            selectedIndex: 1,
                            isFull: true,
                            onTap: () {
                              controller?.toggle();

                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                            },
                            height: 75 / 640,
                            marginTop: 8,
                            marginRight: 28,
                            marginLeft: 0,
                            marginBottom: 0,
                            isChildText: false,
                            widget: _subItemBox(title: 'آپشن و لوازم جانبی', imagePath: 'assets/images/accessory.png'),
                          ),
                        );
                      },
                    ),
                    expanded: Container(
                      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Builder(
                              builder: (context) {
                                var controller = ExpandableController.of(context);
                                return Padding(
                                  padding: EdgeInsets.zero,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          controller?.toggle();

                                        },
                                        child: CustomNeomorphicBox(
                                          title: '',
                                          index: 0,
                                          selectedIndex: 1,
                                          isFull: true,
                                          onTap: () {
                                            controller?.toggle();

                                            // bool _chooseWorker = globals.chooseRelifSelected;
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (BuildContext context) => _chooseWorker ? const ChooseReliefWorkerPage() : const ChooseDayPage(),
                                            //   ),
                                            // );
                                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                                          },
                                          height: 75 / 640,
                                          marginTop: 8,
                                          marginRight: 28,
                                          marginLeft: 0,
                                          marginBottom: 0,
                                          isChildText: false,
                                          widget: _subItemBox(title: 'آپشن و لوازم جانبی', imagePath: 'assets/images/accessory.png'),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                          // color: Theme.of(context).cardColor,
                                        ),
                                        child: SizedBox(
                                          child: ListView(shrinkWrap: true, children: packageSevenList),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),


              ExpandableNotifier(
                  child: Expandable(
                    collapsed: Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);

                        return InkWell(
                          onTap: (){
                            controller?.toggle();

                          },
                          child: CustomNeomorphicBox(
                            title: '',
                            index: 0,
                            selectedIndex: 1,
                            isFull: true,
                            onTap: () {
                              controller?.toggle();

                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                            },
                            height: 75 / 640,
                            marginTop: 8,
                            marginRight: 28,
                            marginLeft: 0,
                            marginBottom: 0,
                            isChildText: false,
                            widget: _subItemBox(title: 'بازدید فنی و پیش از سفر', imagePath: 'assets/images/accessory.png'),
                          ),
                        );
                      },
                    ),
                    expanded: Container(
                      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Builder(
                              builder: (context) {
                                var controller = ExpandableController.of(context);
                                return Padding(
                                  padding: EdgeInsets.zero,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          controller?.toggle();

                                        },
                                        child: CustomNeomorphicBox(
                                          title: '',
                                          index: 0,
                                          selectedIndex: 1,
                                          isFull: true,
                                          onTap: () {
                                            controller?.toggle();

                                            // bool _chooseWorker = globals.chooseRelifSelected;
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (BuildContext context) => _chooseWorker ? const ChooseReliefWorkerPage() : const ChooseDayPage(),
                                            //   ),
                                            // );
                                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                                          },
                                          height: 75 / 640,
                                          marginTop: 8,
                                          marginRight: 28,
                                          marginLeft: 0,
                                          marginBottom: 0,
                                          isChildText: false,
                                          widget: _subItemBox(title: 'بازدید فنی و پیش از سفر', imagePath: 'assets/images/accessory.png'),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                          // color: Theme.of(context).cardColor,
                                        ),
                                        child: SizedBox(
                                          child: ListView(shrinkWrap: true, children: packageEightList),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),


              ExpandableNotifier(
                  child: Expandable(
                    collapsed: Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);

                        return InkWell(
                          onTap: (){
                            controller?.toggle();

                          },
                          child: CustomNeomorphicBox(
                            title: '',
                            index: 0,
                            selectedIndex: 1,
                            isFull: true,
                            onTap: () {
                              controller?.toggle();

                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                            },
                            height: 75 / 640,
                            marginTop: 8,
                            marginRight: 28,
                            marginLeft: 0,
                            marginBottom: 0,
                            isChildText: false,
                            widget: _subItemBox(title: 'تعمیرات غیر فوریتی', imagePath: 'assets/images/firs_service.png'),
                          ),
                        );
                      },
                    ),
                    expanded: Container(
                      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Builder(
                              builder: (context) {
                                var controller = ExpandableController.of(context);
                                return Padding(
                                  padding: EdgeInsets.zero,
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          controller?.toggle();

                                        },
                                        child: CustomNeomorphicBox(
                                          title: '',
                                          index: 0,
                                          selectedIndex: 1,
                                          isFull: true,
                                          onTap: () {
                                            controller?.toggle();

                                            // bool _chooseWorker = globals.chooseRelifSelected;
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (BuildContext context) => _chooseWorker ? const ChooseReliefWorkerPage() : const ChooseDayPage(),
                                            //   ),
                                            // );
                                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
                                          },
                                          height: 75 / 640,
                                          marginTop: 8,
                                          marginRight: 28,
                                          marginLeft: 0,
                                          marginBottom: 0,
                                          isChildText: false,
                                          widget: _subItemBox(title: 'تعمیرات غیر فوریتی', imagePath: 'assets/images/firs_service.png'),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                          // color: Theme.of(context).cardColor,
                                        ),
                                        child: SizedBox(
                                          child: ListView(shrinkWrap: true, children: packageNineList),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),

              SizedBox(height: 16,),

              CustomSubmitButton(
                onTap: onSubmitTap,
                text: 'تائید و ادامه',
                marginBottom: 0,
                marginTop: 0,
              ),


              SizedBox(height: 16,),

            ],
          ),
        ),
      );
    });
  }

  // Widget _body() {
  //   if(loading){
  //     return Center(child: CircularProgressIndicator(),);
  //   }
  //   result.data!.forEach((element) {
  //     if(element.packageId == 5){
  //       packageFiveList.add(
  //           ListTile(
  //             title: Text(element.name!),
  //             leading: Checkbox(
  //               onChanged: (value) {
  //                 finalSubService.add(int.parse(element.id!));
  //                 setState(() {
  //                   print('added to final list ${element.name}');
  //                 });
  //               },
  //               value: finalSubService.contains(int.parse(element.id!))? true:false,
  //             ),
  //           )
  //       );
  //     }
  //     if(element.packageId == 7){
  //       packageSevenList.add(
  //           ListTile(
  //             title: Text(element.name!),
  //             leading: Checkbox(
  //               onChanged: (value) {
  //                 finalSubService.add(int.parse(element.id!));
  //               },
  //               value: finalSubService.contains(int.parse(element.id!))? true:false,
  //             ),
  //           )
  //       );
  //     }
  //     if(element.packageId == 8){
  //       packageEightList.add(
  //           ListTile(
  //             title: Text(element.name!),
  //             leading: Checkbox(
  //               onChanged: (value) {
  //                 finalSubService.add(int.parse(element.id!));
  //               },
  //               value: finalSubService.contains(int.parse(element.id!))? true:false,
  //             ),
  //           )
  //       );
  //     }
  //     if(element.packageId == 9){
  //       packageNineList.add(
  //           ListTile(
  //             title: Text(element.name!),
  //             leading: Checkbox(
  //               onChanged: (value) {
  //                 if(value!)finalSubService.add(int.parse(element.id!));
  //               },
  //               value: finalSubService.contains(int.parse(element.id!))? true:false,
  //             ),
  //           )
  //       );
  //     }
  //
  //   });
  //
  //   if(mounted){
  //     setState(() {
  //
  //       loading = false;
  //
  //     });
  //   }
  //
  //
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(top: defaultPadding, bottom: defaultPadding / 2),
  //           alignment: Alignment.center,
  //           child: const Text(
  //             'خدمات در محل',
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //           ),
  //         ),
  //
  //
  //         ExpandableNotifier(
  //             child: Expandable(
  //               collapsed: Builder(
  //                 builder: (context) {
  //                   var controller = ExpandableController.of(context);
  //
  //                   return InkWell(
  //                     onTap: (){
  //                       controller?.toggle();
  //
  //                     },
  //                     child: CustomNeomorphicBox(
  //                       title: '',
  //                       index: 0,
  //                       selectedIndex: 1,
  //                       isFull: true,
  //                       onTap: () {
  //                         controller?.toggle();
  //
  //                         // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
  //                       },
  //                       height: 75 / 640,
  //                       marginTop: 8,
  //                       marginRight: 28,
  //                       marginLeft: 0,
  //                       marginBottom: 0,
  //                       isChildText: false,
  //                       widget: _subItemBox(title: 'سرویس‌های اولیه و دوره ای', imagePath: 'assets/images/bazdid_fani.png'),
  //                     ),
  //                   );
  //                 },
  //               ),
  //               expanded: Container(
  //                 decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
  //                 child: Column(
  //                   children: <Widget>[
  //                     Padding(
  //                       padding: EdgeInsets.zero,
  //                       child: Builder(
  //                         builder: (context) {
  //                           var controller = ExpandableController.of(context);
  //                           return Padding(
  //                             padding: EdgeInsets.zero,
  //                             child: InkWell(
  //                               onTap: () {
  //                                 controller?.toggle();
  //                               },
  //                               child: Column(
  //                                 children: [
  //                                   CustomNeomorphicBox(
  //                                     title: '',
  //                                     index: 0,
  //                                     selectedIndex: 1,
  //                                     isFull: true,
  //                                     onTap: () {
  //                                       controller?.toggle();
  //
  //                                       // bool _chooseWorker = globals.chooseRelifSelected;
  //                                       // Navigator.push(
  //                                       //   context,
  //                                       //   MaterialPageRoute(
  //                                       //     builder: (BuildContext context) => _chooseWorker ? const ChooseReliefWorkerPage() : const ChooseDayPage(),
  //                                       //   ),
  //                                       // );
  //                                       // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
  //                                     },
  //                                     height: 75 / 640,
  //                                     marginTop: 8,
  //                                     marginRight: 28,
  //                                     marginLeft: 0,
  //                                     marginBottom: 0,
  //                                     isChildText: false,
  //                                     widget: _subItemBox(title: 'سرویس‌های اولیه و دوره ای', imagePath: 'assets/images/bazdid_fani.png'),
  //                                   ),
  //                                   Container(
  //                                     decoration: const BoxDecoration(
  //                                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
  //                                       // color: Theme.of(context).cardColor,
  //                                     ),
  //                                     child: SizedBox(
  //                                       child: ListView(shrinkWrap: true, children: packageFiveList),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             )
  //         ),
  //
  //
  //
  //         CustomNeomorphicBox(
  //           title: '',
  //           index: 0,
  //           selectedIndex: 1,
  //           isFull: true,
  //           onTap: () {
  //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
  //           },
  //           height: 75 / 640,
  //           marginTop: 8,
  //           marginRight: 28,
  //           marginLeft: 0,
  //           marginBottom: 0,
  //           isChildText: false,
  //           widget: _subItemBox(title: 'سرویس‌های اولیه و دوره ای', imagePath: 'assets/images/bazdid_fani.png'),
  //         ),
  //         CustomNeomorphicBox(
  //           title: '',
  //           index: 0,
  //           selectedIndex: 1,
  //           isFull: true,
  //           onTap: () {
  //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
  //           },
  //           height: 75 / 640,
  //           marginTop: 8,
  //           marginRight: 28,
  //           marginLeft: 0,
  //           marginBottom: 0,
  //           isChildText: false,
  //           widget: _subItemBox(title: 'تعمیرات غیرفوریتی', imagePath: 'assets/images/accessory.png'),
  //         ),
  //         CustomNeomorphicBox(
  //           title: '',
  //           index: 0,
  //           selectedIndex: 1,
  //           isFull: true,
  //           onTap: () {
  //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
  //           },
  //           height: 75 / 640,
  //           marginTop: 8,
  //           marginRight: 28,
  //           marginBottom: 0,
  //           isChildText: false,
  //           widget: _subItemBox(title: 'آپشن و لوازم جانبی', imagePath: 'assets/images/accessory.png'),
  //         ),
  //         CustomNeomorphicBox(
  //           title: '',
  //           index: 0,
  //           selectedIndex: 1,
  //           isFull: true,
  //           onTap: () {
  //             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeServiceCustomerForm()));
  //           },
  //           height: 75 / 640,
  //           marginTop: 8,
  //           marginRight: 28,
  //           marginBottom: 0,
  //           isChildText: false,
  //           widget: _subItemBox(title: 'بازدید فنی پیش از سفر', imagePath: 'assets/images/firs_service.png'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _subItemBox({required String title, required String imagePath}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 12,
        ),
        Container(
          alignment: Alignment.center,
          // height: 60,
          // width: 60,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            // height: 4,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title, style: const TextStyle(fontFamily: 'Vazir', fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  onSubmitTap() {

    // globals.finalSubServices.forEach((element) {
    //   globals.submitHomeServiceRequest.packageSubServiceIds!.add(int.parse(element));
    // });

    if(globals.finalSubServices.isEmpty){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return MessageDialogWidget(
              dismissable: true,
              title: 'رمز عبور اشتباه است',
              body: 'لطفا یک سرویس را انتخاب نمائید',
              positiveTxt: 'باشه',
            );
          });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ChooseReliefWorkerPage(),
      ),
    );




    //clear textFields
    // _idCtrl.clear();
    // _nameCtrl.clear();

    // await Future.delayed(const Duration(milliseconds: 4000));
    //
    // Navigator.of(context).pop();

    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return MessageDialogWidget(
    //         dismissable: false,
    //         hasTextBody: false,
    //         widget: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Text('مشتری گرامی اطلاعات شما با شماره پیگیری 98995 در سامانه ثبت گردید.',textAlign: TextAlign.center),
    //               Text('همکاران ما بزودی با شما تماس خواهند گرفت.',textAlign: TextAlign.center),
    //               Text('شماره همراه ثبت شده: $phone',textAlign: TextAlign.center,),
    //             ],
    //           ),
    //         ),
    //         positiveTxt: 'تایید',
    //         positiveFunc: () async {
    //
    //           //save to user data
    //           SharedPreferences preferences = await SharedPreferences.getInstance();
    //           preferences.setString('user_full_name', _carModelCtrl.text);
    //           preferences.setString('user_national_code', _chassingNumberCtrl.text);
    //
    //
    //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    //         },
    //       );
    //     });
  }

}
