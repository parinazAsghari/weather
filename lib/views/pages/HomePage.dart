
//import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';

import 'package:emdad_khodro_saipa/views/pages/DevelopingPage.dart';
import 'package:emdad_khodro_saipa/views/pages/EmdadPage.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:emdad_khodro_saipa/models/MemberInfoModel.dart' as Member_Info;
import 'package:emdad_khodro_saipa/providers/HomeProvider.dart';
import 'package:emdad_khodro_saipa/providers/ThemeProvider.dart';
import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';
import 'package:emdad_khodro_saipa/utils/AppLocalizationModule.dart';
import 'package:emdad_khodro_saipa/utils/ThemeManagerModule.dart';
import 'package:emdad_khodro_saipa/views/pages/AccountManagmentPage.dart';
import 'package:emdad_khodro_saipa/views/pages/ChangePasswordPage.dart';
import 'package:emdad_khodro_saipa/views/pages/CommonQuestions.dart';
import 'package:emdad_khodro_saipa/views/pages/ContactUs.dart';
// import 'package:emdad_khodro_saipa/views/pages/CouponsListPage.dart';
// import 'package:emdad_khodro_saipa/views/pages/ExclusivePackagePage.dart';
// import 'package:emdad_khodro_saipa/views/pages/GeneralInfoPage.dart';
// import 'package:emdad_khodro_saipa/views/pages/IntroducedListPage.dart';
import 'package:emdad_khodro_saipa/views/pages/LoginPage.dart';
import 'package:emdad_khodro_saipa/views/pages/PreLoginPage.dart';
// import 'package:emdad_khodro_saipa/views/pages/LoyaltyProfilePage.dart';
// import 'package:emdad_khodro_saipa/views/pages/ProductsListPage.dart';
// import 'package:emdad_khodro_saipa/views/pages/PromotionsListPage.dart';
// import 'package:emdad_khodro_saipa/views/pages/TierRankPage.dart';
import 'package:emdad_khodro_saipa/views/pages/UserProfilePage.dart';
// import 'package:emdad_khodro_saipa/views/pages/UserScorePage.dart';
import 'package:emdad_khodro_saipa/views/widgets/BackgroundObjectsWidget.dart';
import 'package:emdad_khodro_saipa/views/widgets/HomePage_DropDownWidget.dart';
import 'package:provider/provider.dart';
import 'HomePageSlider.dart';
// import 'LoanMainPage.dart';
import 'SettingPage.dart';
import 'TermsAndConditions.dart';
// import 'TransactionPage.dart';
// import 'SpendScorePage.dart';
import 'package:dropdown_search/dropdown_search.dart';



class HomePage extends StatefulWidget {

  String? userName;
  HomePage({this.userName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeProvider _homeProvider = HomeProvider();

  @override
  void initState() {
    super.initState();
    // _memberFuture = _homeProvider.fetchMemberInfo(widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('${AppLocalizations.of(context)?.getText('AppName_txt')}',style: TextStyle(fontFamily: 'Iranian',fontSize: 18,)),
          automaticallyImplyLeading: false,
          // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
        ),
        endDrawer: DrawerWidget(context),
        body:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg_skyblueTheme.png'),fit: BoxFit.cover,colorFilter: ColorFilter.mode(context.watch<ThemeProvider>().getThemeData.backgroundColor, BlendMode.softLight))
          ),
          child: ChangeNotifierProvider<HomeProvider>(
            create: (ctx){
              //_homeProvider.fetchMemberInfo(userName);
              return _homeProvider;
            },
            child: BodyContent(context),
          ),
        )
    );
  }

  Widget BodyContent(BuildContext context){
    return BackdropFilter(filter: ImageFilter.blur(sigmaY: 12.0, sigmaX: 12.0),
        child: Container(
          color: Colors.white.withOpacity(0.2),
          child: BackgroundObjectsComplexWidget(
            widget: Stack(

          children: [

            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext ctx,bool innerScroll){//assets/images/banner_1.png
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 255,backgroundColor: Colors.transparent,
                      floating: false,pinned: false,elevation: 0,automaticallyImplyLeading: false,actions: <Widget>[Container()],
                      flexibleSpace: FlexibleSpaceBar(
                        background: SafeArea(
                          child: Container(
                              child: HomePageSlider()
                          ),
                        ),
                      ),
                    )
                  ];
                },
                body: Consumer<HomeProvider>(
                  builder: (_, data,__){
                    return Container(
                      margin: EdgeInsets.only(left: 40,right: 40,bottom: 8),
                      child: GridView.count(
                        crossAxisCount: 2,
                        // childAspectRatio: ,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 40,

                        // padding: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 20),
                        shrinkWrap: true,
                        children: <Widget>[
                          GridTileWidget(context,'ic_diamond.png','امداد',()=>Navigator.push(context, FadeRoute(page: EmdadPage()))),
                          GridTileWidget(context,'ic_promotion.png','خریداشتراک',()=>Navigator.push(context, FadeRoute(page: DevelopingPage()))),
                          GridTileWidget(context,'ic_product.png','محصولات',()=>Navigator.push(context, FadeRoute(page: DevelopingPage()))),
                          GridTileWidget(context,'ic_loan.png','پشتیبانی',()=>Navigator.push(context, FadeRoute(page: DevelopingPage()))),
                          GridTileWidget(context,'ic_bookmark.png','نظرات و پیشنهادات',()=>Navigator.push(context, FadeRoute(page: DevelopingPage()))),
                          GridTileWidget(context,'ic_transaction.png','پیام ها',()=>Navigator.push(context, FadeRoute(page: DevelopingPage()))),
                          GridTileWidget(context,'ic_user.png','تنظیمات',()=>Navigator.push(context, FadeRoute(page: DevelopingPage()))),

                        ],
                      ),
                    );
                  },
                ),
              ),
            ),


            ]
          ),
        )

        )
    );

  }

  Widget GridTileWidget(BuildContext ctx,String icName,String title,Function onClick){
    return Container(
      // width: 150,height: 150,
      decoration: BoxDecoration(
        // color: ctx.read<ThemeProvider>().getThemeData.cardColor,
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // border: Border.all(width: 10,color: ctx.read<ThemeProvider>().getThemeData.accentColor),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0,3)
            )
          ]
      ),
      child: Stack(
        children: <Widget>[
          Container()
          ,
          // Positioned(
          //   top: 0,left: 0,right: 0,bottom: -20.0,
          //   child: Center(
          //       child: Container(
          //           padding: EdgeInsets.only(top: 20.0,left: 30.0,right: 30.0,bottom: 40.0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: ctx.read<ThemeProvider>().getThemeData.accentColor
          //           ),
          //           child: Image.asset('assets/images/$icName',width: 50,height: 50,fit: BoxFit.fill,color: ctx.read<ThemeProvider>().getThemeData.indicatorColor,colorBlendMode: BlendMode.modulate,))),
          // )
          // ,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,bottom: 50.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ctx.read<ThemeProvider>().getThemeData.accentColor
                ),
                child: Image.asset('assets/images/$icName',fit: BoxFit.contain,color: ctx.read<ThemeProvider>().getThemeData.indicatorColor,colorBlendMode: BlendMode.modulate,)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 12,right: 12,bottom: 10),padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: ctx.read<ThemeProvider>().getThemeData.indicatorColor),
                  color: ctx.read<ThemeProvider>().getThemeData.primaryColorLight,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: Offset(0,3)
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('$title',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: ctx.read<ThemeProvider>().getThemeData.primaryColor,fontWeight: FontWeight.w100),),
              ),
            ),
          )
          ,
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    onClick();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget DrawerWidget (BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
            width: 240,
            decoration: BoxDecoration(

                color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark.withOpacity(0.9),
                border: Border.all(width: 3,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0))

            ),
            // color: Colors.transparent,
            // decoration: BoxDecoration(
            //     image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
            // ),
            child: Drawer(
                elevation: 0,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(shrinkWrap: true,
                    children: <Widget>[
                      // SizedBox(height: 25,)
                      // ,
                      // Container(
                      //   margin: EdgeInsets.only(top: 15,left: 15),
                      //   alignment: Alignment.centerLeft,
                      //   child: IconButton(
                      //     onPressed: (){
                      //       Navigator.pop(context);
                      //     },
                      //     icon: Icon(Icons.close,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                      //   ),
                      // )
                      // ,
                      SizedBox(height: 15,)
                      ,
                      Image.asset('assets/images/emdad_khodro_logo_single.png',height: 80,width: 80,)
                      ,
                      SizedBox(height: 20,)
                      ,
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('${AppLocalizations.of(context)!.getText('UserName_txt')}'+' : '+'${widget.userName}',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),)
                        ,

                      )
                      ,
                      SizedBox(height: 20,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.person,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                              )
                          ),
                          onTap: (){
                            Navigator.pop(context);
                            // Navigator.push(context, FadeRoute(page: UserProfilePage(memberId: selectedMemberId,userName: widget.userName,)));
                          },
                          trailing: Text('${AppLocalizations.of(context)!.getText('UserProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                        ),
                      )
                      ,
                      SizedBox(height: 3,)
                      ,
                      Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,

                      SizedBox(height: 3,)
                      ,

                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.settings,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                              )
                          ),



                          onTap: (){
                            Navigator.pop(context);
                            // Navigator.push(context, FadeRoute(page: SettingPage()));
                          },
                          trailing: Text('${AppLocalizations.of(context)!.getText('Setting_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                        ),
                      )
                      ,
                      SizedBox(height: 3,)
                      ,
                      Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.lock,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                              )
                          ),



                          onTap: (){
                            Navigator.pop(context);
                            // Navigator.push(context, FadeRoute(page: ChangePasswordPage(widget.userName)));
                          },
                          trailing: Text('${AppLocalizations.of(context)!.getText('ChangePassword_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                        ),
                      )
                      ,
                      SizedBox(height: 3,)
                      ,
                      Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.info,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                              )
                          ),


                          onTap: (){
                            Navigator.pop(context);
                            // Navigator.push(context, FadeRoute(page: GeneralInfoPage()));
                          },
                          trailing: Text('${AppLocalizations.of(context)!.getText('GeneralInfoPage_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor)),
                        ),
                      )
                      ,
                      SizedBox(height: 3,)
                      ,
                      Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                      ,
                      SizedBox(height: 3,)
                      ,
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child:
                                Icon(Icons.exit_to_app,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                              )
                          ),



                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(context, FadeRoute(page: LoginPage('customer')), (Route<dynamic >route) => false);
                          },
                          trailing: Text('${AppLocalizations.of(context)!.getText('Exit_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor)),
                        ),
                      )
                      ,
                      SizedBox(height: 20,)
                      ,
                      Text('${AppLocalizations.of(context)!.getText('Version_txt')}'+'  '+'${AppLocalizations.of(context)!.getText('CodeVersion_txt')}',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),)
                      ,
                      SizedBox(height: 10,)

                    ],
                  ),
                )
            )
        ),
      ),
    );

  }

}