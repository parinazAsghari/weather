
//import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';

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


String? selectedProgramName,selectedMemberId,selectedProgramId;


class _HomePageState extends State<HomePage> {

  HomeProvider _homeProvider = HomeProvider();
  Future<Member_Info.MemberInfoModel>? _memberFuture;

  void showProgramListPop(BuildContext context,List<Member_Info.Result> programList){

    showDialog(
      context: context,
      builder: (BuildContext ctx){
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 30,top: 70,right: 30,bottom: 50),
            decoration: BoxDecoration(
                color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(width: 1,color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0,3)
                  )
                ]
            ),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: ListView.separated(
                itemCount: programList.length,shrinkWrap: true,
                padding: EdgeInsets.all(5),
                itemBuilder: (ctx,index){
                  return ListTile(
                    onTap: (){
                      // _homeProvider.setProgramName = programList[index].programName;
                      selectedMemberId = programList[index].memberId;
                      selectedProgramId = programList[index].programId;
                      selectedProgramName = programList[index].programName;
                      Navigator.pop(context);
                    },
                    trailing: Text(replaceFarsiNumber('${index+1}')),
                    title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 13),),
                  );
                },
                separatorBuilder: (ctx,index){
                  return Divider(color: context.read<ThemeProvider>().getThemeData.primaryColor,indent: 3,endIndent: 3,height: 1,thickness: 0.3,);
                }
              ),
            ),
          ),
        );
      },
      barrierDismissible: true
    );

  }


  @override
  void initState() {
    super.initState();
    // _memberFuture = _homeProvider.fetchMemberInfo(widget.userName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('this is home page...'),
      ),
    );
  }


  //old build methods
  /*
  @override
  Widget build(BuildContext context) {
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text('${AppLocalizations.of(context)!.getText('AppName_txt')}',style: TextStyle(fontFamily: 'Iranian',fontSize: 18,)),
            automaticallyImplyLeading: false,
            // bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
          ),
          endDrawer: DrawerWidget(context),
          body:  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/bg_NavyBlueTheme.png'),fit: BoxFit.fill,)
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
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
                image: DecorationImage(image: AssetImage('assets/images/bg_homepage.png'),fit: BoxFit.fill,)
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
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
                image: DecorationImage(image: AssetImage('assets/images/bg_homepage.png'),fit: BoxFit.fill,)
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

    else{
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text('${AppLocalizations.of(context)?.getText('AppName_txt')}',style: TextStyle(fontFamily: 'Iranian',fontSize: 18,)),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(child: Divider(height: 2,thickness: 0.3,color: context.watch<ThemeProvider>().getThemeData.primaryColor,), preferredSize: Size(MediaQuery.of(context).size.width,5)),
        ),
        endDrawer: DrawerWidget(context),
        body: ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'?
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill,colorFilter: ColorFilter.mode(context.watch<ThemeProvider>().getThemeData.backgroundColor, BlendMode.softLight))
          ),
          child: ChangeNotifierProvider<HomeProvider>(
            create: (ctx){
              //_homeProvider.fetchMemberInfo(userName);
              return _homeProvider;
            },
            child: BodyContent(context),
          ),
        )
            :
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill,colorFilter: ColorFilter.mode(context.watch<ThemeProvider>().getThemeData.backgroundColor, BlendMode.softLight))
          ),
          child: ChangeNotifierProvider<HomeProvider>(
            create: (ctx){
              //_homeProvider.fetchMemberInfo(userName);
              return _homeProvider;
            },
            child: BodyContent(context),
          ),
        ),
      );

    }
  }

  Widget BodyContent(BuildContext context){
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
      return BackdropFilter(filter: ImageFilter.blur(sigmaY: 12.0, sigmaX: 12.0),
      child: Container(
        color: Colors.white.withOpacity(0.2),
        child: BackgroundObjectsComplexWidget(
          widget: SafeArea(
            child: FutureBuilder(
              //future: _homeProvider.fetchMemberInfo(widget.userName),
              future: _memberFuture,
              builder: (BuildContext ctx,AsyncSnapshot<Member_Info.MemberInfoModel> snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data?.result!=null && snapshot.data!.result.length == 0){
                  return Center(child: Text('برنامه ای موجود نیست'));
                }
                else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data?.result!=null && snapshot.data!.result.length > 0){

                  if(_homeProvider.getProgramName=='---'){//data should not set in future builder in this case we should do this and we check if just program name is not set this code will excute just for one time to avoid problem
                    _homeProvider.setProgramName = snapshot.data!.result[0].programName;
                    selectedMemberId = snapshot.data!.result[0].memberId;
                    selectedProgramName = snapshot.data!.result[0].programName;
                    selectedProgramId = snapshot.data!.result[0].programId;
                  }

                  return Stack(

                    children: [


                      Column(
                        children: <Widget>[

                          // Container(
                          //   margin: EdgeInsets.only(left: 20,right: 20),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     color: Colors.yellow
                          //
                          //   ),
                          //   child: Directionality(
                          //     textDirection: TextDirection.rtl,
                          //     child:
                          //     DropdownSearch<String>(
                          //
                          //
                          //
                          //         mode: Mode.MENU,
                          //         showSelectedItem: true,
                          //         items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                          //         // label: "Menu mode",
                          //         // hint: "country in menu mode",
                          //         // popupItemDisabled: (String s) => s.startsWith('I'),
                          //         onChanged: print,
                          //         selectedItem: "Brazil",
                          //         popupShape: RoundedRectangleBorder(
                          //
                          //           borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                          //         ),
                          //         dropdownBuilder: _dropdown,
                          //         dropDownButton: _drpdwnWodget(),
                          //         popupItemBuilder: _dropdownItem,
                          //
                          //       dropdownSearchDecoration: InputDecoration(
                          //           contentPadding: EdgeInsets.zero,
                          //           border: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //               width: 2,
                          //               color: Colors.white
                          //             ),
                          //             borderRadius: BorderRadius.circular(20),
                          //
                          //           ),
                          //           enabledBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //                 width: 2,
                          //                 color: Colors.white
                          //             ),
                          //             borderRadius: BorderRadius.circular(20),
                          //
                          //           ),
                          //
                          //
                          //         ),
                          //         // dropdownSearchDecoration: InputDecoration(
                          //         //   labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                          //         //
                          //         // ),
                          //
                          //
                          //
                          //         popupBackgroundColor: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                          //     ),
                          //   ),
                          // ),



                          SizedBox(height: 80,),

                          // Container(
                          //   height: 50,
                          //   margin: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
                          //   decoration: BoxDecoration(
                          //       color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                          //       borderRadius: BorderRadius.all(Radius.circular(16)),
                          //       border: Border.all(width: 1,color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor),
                          //       boxShadow: [
                          //         BoxShadow(
                          //             color: Colors.grey.withOpacity(0.4),
                          //             blurRadius: 10,
                          //             spreadRadius: 1,
                          //             offset: Offset(0,3)
                          //         )
                          //       ]
                          //   ),
                          //   child: Material(
                          //     color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                          //     borderRadius: BorderRadius.all(Radius.circular(16)),
                          //     child: InkWell(
                          //       borderRadius: BorderRadius.all(Radius.circular(16)),
                          //       onTap: (){
                          //         showProgramListPop(context,snapshot.data.result);
                          //       },
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: <Widget>[
                          //           Padding(padding:EdgeInsets.only(left: 10),child: Icon(Icons.keyboard_arrow_down,color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,size: 24,)),
                          //           Consumer<HomeProvider>(
                          //             builder: (_,data,__){
                          //               return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                          //             },
                          //           ),
                          //           SizedBox(width: 40,)
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // )
                          // ,
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
                                        // if(data.getProgramName=='کمپین همراهی')GridTileWidget(context,'ic_exclusive.png','${AppLocalizations.of(context)!.getText('Exclusive_package')}',()=>Navigator.push(context, FadeRoute(page:ExclusivePackagePage(memberId: selectedMemberId,)))),
                                        // GridTileWidget(context,'ic_diamond.png','${AppLocalizations.of(context)!.getText('UseScores_txt')}',()=>Navigator.push(context, FadeRoute(page: SpendScorePage()))),
                                        // GridTileWidget(context,'ic_promotion.png','${AppLocalizations.of(context)!.getText('PromotionList_txt')}',()=>Navigator.push(context, FadeRoute(page: PromotionsListPage(programId: selectedProgramId,)))),
                                        // GridTileWidget(context,'ic_product.png','${AppLocalizations.of(context)!.getText('ProductsList_txt')}',()=>Navigator.push(context, FadeRoute(page: ProductsListPage(programId: selectedProgramId,)))),
                                        // GridTileWidget(context,'ic_loan.png','${AppLocalizations.of(context)!.getText('LoanList_txt')}',()=>Navigator.push(context, FadeRoute(page: LoanMainPage()))),
                                        // GridTileWidget(context,'ic_bookmark.png','${AppLocalizations.of(context)!.getText('CouponsList_txt')}',()=>Navigator.push(context, FadeRoute(page: CouponsListPage(memberId: selectedMemberId,)))),
                                        // GridTileWidget(context,'ic_transaction.png','${AppLocalizations.of(context)!.getText('Transaction_txt')}',()=>Navigator.push(context, FadeRoute(page: TransactionPage(memberId: selectedMemberId,)))),
                                        // GridTileWidget(context,'ic_user.png','${AppLocalizations.of(context)!.getText('AccountManagement_txt')}',()=>Navigator.push(context, FadeRoute(page: AccountManagementPage()))),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      // HomePageDropDownWidget(programList: snapshot.data.result,),
                      _homePageDropDown(snapshot.data!.result,),


                    ],
                  );
                }
                else {
                  return Center(child: Text('خطا در بارگذاری'));
                }
              },
            ),
          ),
        ),
      )

      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return SafeArea(
        child: FutureBuilder(
          //future: _homeProvider.fetchMemberInfo(widget.userName),
          future: _memberFuture,
          builder: (BuildContext ctx,AsyncSnapshot<Member_Info.MemberInfoModel> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length == 0){
              return Center(child: Text('برنامه ای موجود نیست'));
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length > 0){

              if(_homeProvider.getProgramName=='---'){//data should not set in future builder in this case we should do this and we check if just program name is not set this code will excute just for one time to avoid problem
                _homeProvider.setProgramName = snapshot.data!.result[0].programName;
                selectedMemberId = snapshot.data!.result[0].memberId;
                selectedProgramName = snapshot.data!.result[0].programName;
                selectedProgramId = snapshot.data!.result[0].programId;
              }

              return Stack(

                children: [


                  Column(
                    children: <Widget>[

                      // Container(
                      //   margin: EdgeInsets.only(left: 20,right: 20),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     color: Colors.yellow
                      //
                      //   ),
                      //   child: Directionality(
                      //     textDirection: TextDirection.rtl,
                      //     child:
                      //     DropdownSearch<String>(
                      //
                      //
                      //
                      //         mode: Mode.MENU,
                      //         showSelectedItem: true,
                      //         items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                      //         // label: "Menu mode",
                      //         // hint: "country in menu mode",
                      //         // popupItemDisabled: (String s) => s.startsWith('I'),
                      //         onChanged: print,
                      //         selectedItem: "Brazil",
                      //         popupShape: RoundedRectangleBorder(
                      //
                      //           borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                      //         ),
                      //         dropdownBuilder: _dropdown,
                      //         dropDownButton: _drpdwnWodget(),
                      //         popupItemBuilder: _dropdownItem,
                      //
                      //       dropdownSearchDecoration: InputDecoration(
                      //           contentPadding: EdgeInsets.zero,
                      //           border: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //               width: 2,
                      //               color: Colors.white
                      //             ),
                      //             borderRadius: BorderRadius.circular(20),
                      //
                      //           ),
                      //           enabledBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //                 width: 2,
                      //                 color: Colors.white
                      //             ),
                      //             borderRadius: BorderRadius.circular(20),
                      //
                      //           ),
                      //
                      //
                      //         ),
                      //         // dropdownSearchDecoration: InputDecoration(
                      //         //   labelStyle: TextStyle(color: Colors.white,fontSize: 16),
                      //         //
                      //         // ),
                      //
                      //
                      //
                      //         popupBackgroundColor: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                      //     ),
                      //   ),
                      // ),



                      SizedBox(height: 80,),

                      // Container(
                      //   height: 50,
                      //   margin: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
                      //   decoration: BoxDecoration(
                      //       color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                      //       borderRadius: BorderRadius.all(Radius.circular(16)),
                      //       border: Border.all(width: 1,color: ctx.watch<ThemeProvider>().getThemeData.indicatorColor),
                      //       boxShadow: [
                      //         BoxShadow(
                      //             color: Colors.grey.withOpacity(0.4),
                      //             blurRadius: 10,
                      //             spreadRadius: 1,
                      //             offset: Offset(0,3)
                      //         )
                      //       ]
                      //   ),
                      //   child: Material(
                      //     color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                      //     borderRadius: BorderRadius.all(Radius.circular(16)),
                      //     child: InkWell(
                      //       borderRadius: BorderRadius.all(Radius.circular(16)),
                      //       onTap: (){
                      //         showProgramListPop(context,snapshot.data.result);
                      //       },
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: <Widget>[
                      //           Padding(padding:EdgeInsets.only(left: 10),child: Icon(Icons.keyboard_arrow_down,color: ctx.watch<ThemeProvider>().getThemeData.primaryColorDark,size: 24,)),
                      //           Consumer<HomeProvider>(
                      //             builder: (_,data,__){
                      //               return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                      //             },
                      //           ),
                      //           SizedBox(width: 40,)
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                      // ,
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
                            builder: (_,data, __){
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
                                    // if(data.getProgramName=='کمپین همراهی')GridTileWidget(context,'ic_exclusive.png','${AppLocalizations.of(context).getText('Exclusive_package')}',()=>Navigator.push(context, FadeRoute(page:ExclusivePackagePage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_diamond.png','${AppLocalizations.of(context).getText('UseScores_txt')}',()=>Navigator.push(context, FadeRoute(page: SpendScorePage()))),
                                    // GridTileWidget(context,'ic_promotion.png','${AppLocalizations.of(context).getText('PromotionList_txt')}',()=>Navigator.push(context, FadeRoute(page: PromotionsListPage(programId: selectedProgramId,)))),
                                    // GridTileWidget(context,'ic_product.png','${AppLocalizations.of(context).getText('ProductsList_txt')}',()=>Navigator.push(context, FadeRoute(page: ProductsListPage(programId: selectedProgramId,)))),
                                    // GridTileWidget(context,'ic_loan.png','${AppLocalizations.of(context).getText('LoanList_txt')}',()=>Navigator.push(context, FadeRoute(page: LoanMainPage()))),
                                    // GridTileWidget(context,'ic_bookmark.png','${AppLocalizations.of(context).getText('CouponsList_txt')}',()=>Navigator.push(context, FadeRoute(page: CouponsListPage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_transaction.png','${AppLocalizations.of(context).getText('Transaction_txt')}',()=>Navigator.push(context, FadeRoute(page: TransactionPage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_user.png','${AppLocalizations.of(context).getText('AccountManagement_txt')}',()=>Navigator.push(context, FadeRoute(page: AccountManagementPage()))),

                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // HomePageDropDownWidget(programList: snapshot.data.result,),
                  _homePageDropDown(snapshot.data!.result,),


                ],
              );
            }
            else {
              return Center(child: Text('خطا در بارگذاری'));
            }
          },
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return SafeArea(
        child: FutureBuilder(
          //future: _homeProvider.fetchMemberInfo(widget.userName),
          future: _memberFuture,
          builder: (BuildContext ctx,AsyncSnapshot<Member_Info.MemberInfoModel> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length == 0){
              return Center(child: Text('برنامه ای موجود نیست'));
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length > 0){

              if(_homeProvider.getProgramName=='---'){//data should not set in future builder in this case we should do this and we check if just program name is not set this code will excute just for one time to avoid problem
                _homeProvider.setProgramName = snapshot.data!.result[0].programName;
                selectedMemberId = snapshot.data!.result[0].memberId;
                selectedProgramName = snapshot.data!.result[0].programName;
                selectedProgramId = snapshot.data!.result[0].programId;
              }

              return Stack(
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(height: 80,),
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
                            builder: (_,data,__){
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
                                    // GridTileWidget(context, 'ic_exclusive.png', '${AppLocalizations.of(context).getText('Exclusive_package')}', ()=>Navigator.push(context, FadeRoute(page:ExclusivePackagePage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_diamond_blue.png','${AppLocalizations.of(context).getText('UseScores_txt')}',()=>Navigator.push(context, FadeRoute(page: SpendScorePage()))),
                                    // GridTileWidget(context,'ic_promotion_yellow.png','${AppLocalizations.of(context).getText('PromotionList_txt')}',()=>Navigator.push(context, FadeRoute(page: PromotionsListPage(programId: selectedProgramId,)))),
                                    // GridTileWidget(context,'ic_shopping_bag_plus.png','${AppLocalizations.of(context).getText('ProductsList_txt')}',()=>Navigator.push(context, FadeRoute(page: ProductsListPage(programId: selectedProgramId,)))),
                                    // GridTileWidget(context,'ic_loan_blue.png','${AppLocalizations.of(context).getText('LoanList_txt')}',()=>Navigator.push(context, FadeRoute(page: LoanMainPage()))),
                                    // GridTileWidget(context,'ic_bookmark.png','${AppLocalizations.of(context).getText('CouponsList_txt')}',()=>Navigator.push(context, FadeRoute(page: CouponsListPage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_transaction.png','${AppLocalizations.of(context).getText('Transaction_txt')}',()=>Navigator.push(context, FadeRoute(page: TransactionPage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_coin_blue.png','${AppLocalizations.of(context).getText('AccountManagement_txt')}',()=>Navigator.push(context, FadeRoute(page: AccountManagementPage()))),

                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // HomePageDropDownWidget(programList: snapshot.data.result,),
                  _homePageDropDown(snapshot.data!.result,),


                ],
              );
            }
            else {
              return Center(child: Text('خطا در بارگذاری'));
            }
          },
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return SafeArea(
        child: FutureBuilder(
          //future: _homeProvider.fetchMemberInfo(widget.userName),
          future: _memberFuture,
          builder: (BuildContext ctx,AsyncSnapshot<Member_Info.MemberInfoModel> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length == 0){
              return Center(child: Text('برنامه ای موجود نیست'));
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length > 0){

              if(_homeProvider.getProgramName=='---'){//data should not set in future builder in this case we should do this and we check if just program name is not set this code will excute just for one time to avoid problem
                _homeProvider.setProgramName = snapshot.data!.result[0].programName;
                selectedMemberId = snapshot.data!.result[0].memberId;
                selectedProgramName = snapshot.data!.result[0].programName;
                selectedProgramId = snapshot.data!.result[0].programId;
              }

              return Stack(
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(height: 80,),
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
                            builder: (_,data,__){
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
                                    // GridTileWidget(context, 'ic_exclusive.png', '${AppLocalizations.of(context)!.getText('Exclusive_package')}', ()=>Navigator.push(context, FadeRoute(page:ExclusivePackagePage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_diamond_blue.png','${AppLocalizations.of(context)!.getText('UseScores_txt')}',()=>Navigator.push(context, FadeRoute(page: SpendScorePage()))),
                                    // GridTileWidget(context,'ic_promotion_yellow.png','${AppLocalizations.of(context)!.getText('PromotionList_txt')}',()=>Navigator.push(context, FadeRoute(page: PromotionsListPage(programId: selectedProgramId,)))),
                                    // GridTileWidget(context,'ic_shopping_bag_plus.png','${AppLocalizations.of(context)!.getText('ProductsList_txt')}',()=>Navigator.push(context, FadeRoute(page: ProductsListPage(programId: selectedProgramId,)))),
                                    // GridTileWidget(context,'ic_loan_blue.png','${AppLocalizations.of(context)!.getText('LoanList_txt')}',()=>Navigator.push(context, FadeRoute(page: LoanMainPage()))),
                                    // GridTileWidget(context,'ic_bookmark.png','${AppLocalizations.of(context)!.getText('CouponsList_txt')}',()=>Navigator.push(context, FadeRoute(page: CouponsListPage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_transaction.png','${AppLocalizations.of(context)!.getText('Transaction_txt')}',()=>Navigator.push(context, FadeRoute(page: TransactionPage(memberId: selectedMemberId,)))),
                                    // GridTileWidget(context,'ic_coin_blue.png','${AppLocalizations.of(context)!.getText('AccountManagement_txt')}',()=>Navigator.push(context, FadeRoute(page: AccountManagementPage()))),

                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // HomePageDropDownWidget(programList: snapshot.data.result,),
                  _homePageDropDown(snapshot.data!.result,),


                ],
              );
            }
            else {
              return Center(child: Text('خطا در بارگذاری'));
            }
          },
        ),
      );

    }

    else{
      return SafeArea(
        child: FutureBuilder(
          //future: _homeProvider.fetchMemberInfo(widget.userName),
          future: _memberFuture,
          builder: (BuildContext ctx,AsyncSnapshot<Member_Info.MemberInfoModel> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length == 0){
              return Center(child: Text('برنامه ای موجود نیست'));
            }
            else if(snapshot.connectionState == ConnectionState.done && snapshot.data!=null && snapshot.data!.result!=null && snapshot.data!.result.length > 0){

              if(_homeProvider.getProgramName=='---'){//data should not set in future builder in this case we should do this and we check if just program name is not set this code will excute just for one time to avoid problem
                _homeProvider.setProgramName = snapshot.data!.result[0].programName;
                selectedMemberId = snapshot.data!.result[0].memberId;
                selectedProgramName = snapshot.data!.result[0].programName;
                selectedProgramId = snapshot.data!.result[0].programId;
              }

              return Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
                    decoration: BoxDecoration(
                        color: ctx.watch<ThemeProvider>().getThemeData.cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1,color: ctx.watch<ThemeProvider>().getThemeData.accentColor),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0,3)
                          )
                        ]
                    ),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        onTap: (){
                          showProgramListPop(context,snapshot.data!.result);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding:EdgeInsets.only(left: 10),child: Icon(Icons.keyboard_arrow_down,color: ctx.watch<ThemeProvider>().getThemeData.accentColor,size: 24,)),
                            Consumer<HomeProvider>(
                              builder: (_,data,__){
                                return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: ctx.read<ThemeProvider>().getThemeData.primaryColor),maxLines: 1,);
                              },
                            ),
                            SizedBox(width: 40,)
                          ],
                        ),
                      ),
                    ),
                  )
                  ,
                  Expanded(
                    child: NestedScrollView(
                      headerSliverBuilder: (BuildContext ctx,bool innerScroll){//assets/images/banner_1.png
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: 230,backgroundColor: Colors.transparent,
                            floating: false,pinned: false,elevation: 0,automaticallyImplyLeading: false,actions: <Widget>[Container()],
                            flexibleSpace: FlexibleSpaceBar(
                              background: SafeArea(
                                child: Container(
                                  // padding: EdgeInsets.only(left: 10, right: 10),
                                    // height: 200,
                                    child: HomePageSlider()
                                ),
                              ),
                            ),
                          )
                        ];
                      },
                      body: Consumer<HomeProvider>(
                        builder: (_, data, __){
                          return Container(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1.1,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 35,
                              padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                // data.getProgramName!= 'کمپین همراهی'? GridTileWidget(context, 'ic_exclusive.png', '${AppLocalizations.of(context).getText('Exclusive_package')}', ()=>Navigator.push(context, FadeRoute(page:ExclusivePackagePage(memberId: selectedMemberId,)))):null,
                                // GridTileWidget(context,'ic_diamond.png','${AppLocalizations.of(context).getText('UseScores_txt')}',()=>Navigator.push(context, FadeRoute(page: SpendScorePage()))),
                                // GridTileWidget(context,'ic_promotion_2.png','${AppLocalizations.of(context).getText('PromotionList_txt')}',()=>Navigator.push(context, FadeRoute(page: PromotionsListPage(programId: selectedProgramId,)))),
                                // GridTileWidget(context,'ic_product.png','${AppLocalizations.of(context).getText('ProductsList_txt')}',()=>Navigator.push(context, FadeRoute(page: ProductsListPage(programId: selectedProgramId,)))),
                                // GridTileWidget(context,'ic_loan.png','${AppLocalizations.of(context).getText('LoanList_txt')}',()=>Navigator.push(context, FadeRoute(page: LoanMainPage()))),
                                // GridTileWidget(context,'ic_bookmark.png','${AppLocalizations.of(context).getText('CouponsList_txt')}',()=>Navigator.push(context, FadeRoute(page: CouponsListPage(memberId: selectedMemberId,)))),
                                // GridTileWidget(context,'ic_transaction.png','${AppLocalizations.of(context).getText('Transaction_txt')}',()=>Navigator.push(context, FadeRoute(page: TransactionPage(memberId: selectedMemberId,)))),
                                // GridTileWidget(context,'ic_user.png','${AppLocalizations.of(context).getText('AccountManagement_txt')}',()=>Navigator.push(context, FadeRoute(page: AccountManagementPage()))),

                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            else {
              return Center(child: Text('خطا در بارگذاری'));
            }
          },
        ),
      );

    }
  }

  Widget GridTileWidget(BuildContext ctx,String icName,String title,Function onClick){

    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
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

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,bottom: 50.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: ctx.read<ThemeProvider>().getThemeData.accentColor
                      color: Colors.transparent
                  ),
                  child: Image.asset('assets/images/$icName',fit: BoxFit.fill,color: ctx.read<ThemeProvider>().getThemeData.indicatorColor,colorBlendMode: BlendMode.modulate,)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 12,right: 12,bottom: 10),padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: ctx.read<ThemeProvider>().getThemeData.indicatorColor),
                    color: ctx.read<ThemeProvider>().getThemeData.indicatorColor,
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return Container(
        // width: 150,height: 150,
        decoration: BoxDecoration(
          // color: ctx.read<ThemeProvider>().getThemeData.cardColor,
           // color: Colors.white.withOpacity(0.4),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Color(0xffF3C568),
                Color(0xffB38142),

                //Color(0xffE8C394),
                //Color(0xffDDAD5B),
                // Color(0xffC9984F),

              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
           // border: Border.all(width: 5,color: ctx.read<ThemeProvider>().getThemeData.primaryColorDark,),
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

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0,bottom: 30.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: ctx.read<ThemeProvider>().getThemeData.accentColor
                      color: Colors.transparent
                  ),
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                      child: Image.asset('assets/images/$icName',fit: BoxFit.fill,color: ctx.read<ThemeProvider>().getThemeData.primaryColorDark,colorBlendMode: BlendMode.modulate,))),
              //
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 12,right: 12,bottom: 10),padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    //border: Border.all(width: 1, color: ctx.read<ThemeProvider>().getThemeData.indicatorColor),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    /*boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(0,3)
                      )
                    ]*/
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('$title',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: ctx.read<ThemeProvider>().getThemeData.cardColor,fontWeight: FontWeight.bold),),
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return Container(
        // width: 150,height: 150,
        decoration: BoxDecoration(
          // color: ctx.read<ThemeProvider>().getThemeData.cardColor,
           // color: Colors.white.withOpacity(0.4),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Color(0xffF3C568),
                Color(0xffB38142),

                //Color(0xffE8C394),
                //Color(0xffDDAD5B),
                // Color(0xffC9984F),

              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
           // border: Border.all(width: 5,color: ctx.read<ThemeProvider>().getThemeData.primaryColorDark,),
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

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0,bottom: 30.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: ctx.read<ThemeProvider>().getThemeData.accentColor
                      color: Colors.transparent
                  ),
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                      child: Image.asset('assets/images/$icName',fit: BoxFit.fill,color: ctx.read<ThemeProvider>().getThemeData.primaryColorDark,/*colorBlendMode: BlendMode.modulate,*/))),
              //
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 12,right: 12,bottom: 10),padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    //border: Border.all(width: 1, color: ctx.read<ThemeProvider>().getThemeData.indicatorColor),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    /*boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(0,3)
                      )
                    ]*/
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('$title',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: ctx.read<ThemeProvider>().getThemeData.cardColor,fontWeight: FontWeight.bold),),
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
    else{
      return Container(
        width: 100,height: 100,
        decoration: BoxDecoration(
            color: ctx.read<ThemeProvider>().getThemeData.cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1,color: ctx.read<ThemeProvider>().getThemeData.accentColor),
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
            Positioned(
              top: -20,left: 0,right: 0,bottom: 0,
              child: Center(child: Container(child: Image.asset('assets/images/$icName',height: 59,width: 49,fit: BoxFit.scaleDown,color: ctx.read<ThemeProvider>().getThemeData.primaryColor,colorBlendMode: BlendMode.modulate,))),
            )
            ,
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 12,right: 12,bottom: 10),padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: ctx.read<ThemeProvider>().getThemeData.cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset(0,3)
                      )
                    ]
                ),
                child: Text('$title',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: ctx.read<ThemeProvider>().getThemeData.primaryColor,fontWeight: FontWeight.w100),),
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
  }

  Widget DrawerWidget (BuildContext context){
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
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
                        Image.asset('assets/images/behsa.png',height: 80,width: 80,)
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
                        Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
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
                                child: Icon(Icons.account_circle,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                              )
                            ),
                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: LoyaltyProfilePage(memberId: selectedMemberId,)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('LoyaltyProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
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
                                  Icon(Icons.score,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                )
                            ),

                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: ScorePage(memberId: selectedMemberId,)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('MyScore_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                          ),
                        )
                        ,
                        SizedBox(height: 3,)
                        ,
                        Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
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
                                  Icon(Icons.equalizer,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                )
                            ),



                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: TierRankPage(memberId: selectedMemberId,)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('TierRank_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
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
                                  Icon(Icons.people,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                )
                            ),



                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: IntroducedListPage(selectedMemberId)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('IntroducedList_txt')}',textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)),
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
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
                        Image.asset('assets/images/logo_bpj_login.png',height: 80,width: 80,)
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
                        Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
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
                                  child: Icon(Icons.account_circle,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                )
                            ),
                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: LoyaltyProfilePage(memberId: selectedMemberId,)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('LoyaltyProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
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
                                  Icon(Icons.score,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                )
                            ),

                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: ScorePage(memberId: selectedMemberId,)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('MyScore_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                          ),
                        )
                        ,
                        SizedBox(height: 3,)
                        ,
                        Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
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
                                  Icon(Icons.equalizer,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                )
                            ),



                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: TierRankPage(memberId: selectedMemberId,)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('TierRank_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
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
                                  Icon(Icons.people,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                )
                            ),



                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, FadeRoute(page: IntroducedListPage(selectedMemberId)));
                            },
                            trailing: Text('${AppLocalizations.of(context)!.getText('IntroducedList_txt')}',textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)),
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
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
              width: 240,
              height: 500,
              decoration: BoxDecoration(

                  color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark.withOpacity(0.9),
                 // border: Border.all(width: 3,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0))

              ),
              // color: Colors.transparent,
              // decoration: BoxDecoration(
              //     image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
              // ),
              child: Drawer(
                  elevation: 0,
                  child: Stack(
                    children: [
                      Directionality(
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
                            Image.asset('assets/images/logo_bpj_login.png',height: 80,width: 80,)
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
                            Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
                            ,
                            SizedBox(height: 3,)
                            ,
                            Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,),
                            Padding(
                              padding: EdgeInsets.only(left: 15,right: 15),
                              child: ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                       // border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Image.asset('assets/images/ic_person.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)
                                      //Icon(Icons.account_circle,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                    )
                                ),
                                onTap: (){
                                  Navigator.pop(context);
                                  // Navigator.push(context, FadeRoute(page: LoyaltyProfilePage(memberId: selectedMemberId,)));
                                },
                                trailing: Text('${AppLocalizations.of(context)!.getText('LoyaltyProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
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
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Image.asset('assets/images/ic_person_diamond_blue.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)

                                      //Icon(Icons.person,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
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
                            Padding(
                              padding: EdgeInsets.only(left: 15,right: 15),
                              child: ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Image.asset('assets/images/ic_diamond_yellow.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)
                                      //Icon(Icons.score,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                    )
                                ),

                                onTap: (){
                                  Navigator.pop(context);
                                  // Navigator.push(context, FadeRoute(page: ScorePage(memberId: selectedMemberId,)));
                                },
                                trailing: Text('${AppLocalizations.of(context)!.getText('MyScore_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
                              ),
                            )
                            ,
                            SizedBox(height: 3,)
                            ,
                            Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,
                            Padding(
                              padding: EdgeInsets.only(left: 15,right: 15),
                              child: ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Image.asset('assets/images/ic_calender_yellow.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)
                                      //Icon(Icons.equalizer,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                    )
                                ),



                                onTap: (){
                                  Navigator.pop(context);
                                  // Navigator.push(context, FadeRoute(page: TierRankPage(memberId: selectedMemberId,)));
                                },
                                trailing: Text('${AppLocalizations.of(context)!.getText('TierRank_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.indicatorColor),),
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
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Icon(Icons.people,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
                                    )
                                ),



                                onTap: (){
                                  Navigator.pop(context);
                                  // Navigator.push(context, FadeRoute(page: IntroducedListPage(selectedMemberId)));
                                },
                                trailing: Text('${AppLocalizations.of(context)!.getText('IntroducedList_txt')}',textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: context.watch<ThemeProvider>().getThemeData.indicatorColor)),
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
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Icon(Icons.settings,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
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
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Icon(Icons.lock,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
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
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Icon(Icons.info,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
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
                                        //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child:
                                      Icon(Icons.exit_to_app,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
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
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor),
                          ),
                        ],
                      ),
                    ],

                  )
              )
          ),
        ),
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
              width: 280,
              height: 520,
              decoration: BoxDecoration(

                  //color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark.withOpacity(0.9),
                  color: Colors.white.withOpacity(0.3),
                 // border: Border.all(width: 3,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0))

              ),
              // color: Colors.transparent,
              // decoration: BoxDecoration(
              //     image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
              // ),
              child: Drawer(
                  elevation: 0,
                  child: Stack(
                    children: [
                      Directionality(
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
                            Image.asset('assets/images/logo.png',height: 80,width: 80,)
                            ,
                            SizedBox(height: 20,)
                            ,
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('${AppLocalizations.of(context)!.getText('UserName_txt')}'+' : '+'${widget.userName}',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),)
                              ,

                            )
                            ,
                            SizedBox(height: 20,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 3,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,),*/
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                         // border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Image.asset('assets/images/ic_person.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)
                                        //Icon(Icons.account_circle,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                      )
                                  ),
                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: LoyaltyProfilePage(memberId: selectedMemberId,)));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('LoyaltyProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Image.asset('assets/images/ic_person_diamond_blue.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)

                                        //Icon(Icons.person,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                      )
                                  ),
                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: UserProfilePage(memberId: selectedMemberId,userName: widget.userName,)));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('UserProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Image.asset('assets/images/ic_diamond_yellow.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)
                                        //Icon(Icons.score,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                      )
                                  ),

                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: ScorePage(memberId: selectedMemberId,)));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('MyScore_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Image.asset('assets/images/ic_calender_yellow.png',height: 30,width: 30, color: context.watch<ThemeProvider>().getThemeData.accentColor)
                                        //Icon(Icons.equalizer,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,),
                                      )
                                  ),



                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: TierRankPage(memberId: selectedMemberId,)));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('TierRank_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Icon(Icons.people,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
                                      )
                                  ),



                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: IntroducedListPage(selectedMemberId)));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('IntroducedList_txt')}',textAlign: TextAlign.end,style: TextStyle(fontSize: 12,color: context.watch<ThemeProvider>().getThemeData.primaryColorDark)),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Icon(Icons.settings,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
                                      )
                                  ),



                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: SettingPage()));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('Setting_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Icon(Icons.lock,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
                                      )
                                  ),



                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: ChangePasswordPage(widget.userName)));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('ChangePassword_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Icon(Icons.info,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
                                      )
                                  ),


                                  onTap: (){
                                    Navigator.pop(context);
                                    // Navigator.push(context, FadeRoute(page: GeneralInfoPage()));
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('GeneralInfoPage_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark)),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 5,)
                            ,
                            /*Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.indicatorColor,indent: 20,endIndent: 20,)
                            ,*/
                            SizedBox(height: 5,)
                            ,
                            Container(
                              margin: EdgeInsets.only(left: 40.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                                  color: Colors.white.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: ListTile(
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          //border: Border.all(width: 1, color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child:
                                        Icon(Icons.exit_to_app,color: context.watch<ThemeProvider>().getThemeData.accentColor,size: 30,),
                                      )
                                  ),



                                  onTap: (){
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(context, FadeRoute(page: LoginPage('customer')), (Route<dynamic >route) => false);
                                  },
                                  trailing: Text('${AppLocalizations.of(context)!.getText('Exit_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark)),
                                ),
                              ),
                            )
                            ,
                            SizedBox(height: 20,)
                            ,
                            Text('${AppLocalizations.of(context)!.getText('Version_txt')}'+'  '+'${AppLocalizations.of(context)!.getText('CodeVersion_txt')}',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColorDark),)
                            ,
                            SizedBox(height: 10,)

                          ],
                        ),
                      ),
                      /*Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor),
                          ),
                        ],
                      ),*/
                    ],

                  )
              )
          ),
        ),
      );

    }
    else{
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/bg_common.png'),fit: BoxFit.fill)
        ),
        child: Material(
          color: Colors.transparent,
          child: ListView(
            padding: EdgeInsets.all(5.0),
            children: <Widget>[
              SizedBox(height: 25,)
              ,
              Container(
                margin: EdgeInsets.only(top: 15,left: 15),
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                ),
              )
              ,
              SizedBox(height: 15,)
              ,
              Image.asset('assets/images/logo.png',width: 228,height: 131,)
              ,
              SizedBox(height: 20,)
              ,
              Text('${AppLocalizations.of(context)!.getText('UserName_txt')}'+' : '+'${widget.userName}',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
              ,
              SizedBox(height: 20,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.account_circle,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: LoyaltyProfilePage(memberId: selectedMemberId,)));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('LoyaltyProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.person,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: UserProfilePage(memberId: selectedMemberId,userName: widget.userName,)));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('UserProfile_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.score,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: ScorePage(memberId: selectedMemberId,)));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('MyScore_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.equalizer,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: TierRankPage(memberId: selectedMemberId,)));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('TierRank_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.people,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: IntroducedListPage(selectedMemberId)));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('IntroducedList_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.settings,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: SettingPage()));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('Setting_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.lock,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: ChangePasswordPage(widget.userName)));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('ChangePassword_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 3,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.info,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    // Navigator.push(context, FadeRoute(page: GeneralInfoPage()));
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('GeneralInfoPage_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
                ),
              )
              ,
              SizedBox(height: 3,)
              ,
              Divider(height: 5,thickness: 0.25,color: context.watch<ThemeProvider>().getThemeData.primaryColor,indent: 20,endIndent: 20,)
              ,
              SizedBox(height: 3,)
              ,
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ListTile(
                  leading: Icon(Icons.exit_to_app,color: context.watch<ThemeProvider>().getThemeData.primaryColor,),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(context, FadeRoute(page: LoginPage('customer')), (Route<dynamic >route) => false);
                  },
                  trailing: Text('${AppLocalizations.of(context)!.getText('Exit_txt')}',textAlign: TextAlign.end,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor)),
                ),
              )
              ,
              SizedBox(height: 20,)
              ,
              Text('${AppLocalizations.of(context)!.getText('Version_txt')}'+'  '+'${AppLocalizations.of(context)!.getText('CodeVersion_txt')}',textAlign: TextAlign.center,style: TextStyle(color: context.watch<ThemeProvider>().getThemeData.primaryColor),)
              ,
              SizedBox(height: 10,)

            ],
          ),
        ),
      );

    }
  }

  // Widget _dropdown(BuildContext context,String x, String y){
  //   return Container(
  //     color: Colors.white,
  //     // margin: EdgeInsets.all(40),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Consumer<HomeProvider>(
  //           builder: (_,data,__){
  //             return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //
  // }

  // Widget _drpdwnWodget(){
  //   return Container(
  //     child: Icon(Icons.keyboard_arrow_down_rounded,),
  //   );
  // }
  // Widget _dropdownItem(BuildContext context, String i, bool j){
  //   return Center(
  //     child: Container(
  //       child: Text('hello',style: TextStyle(color: Colors.white,fontSize: 20),)
  //     ),
  //   );
  // }


  Widget _homePageDropDown(List<Member_Info.Result> programList){
    if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme SkyBlue'){
      return Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: ExpandableNotifier(

              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ScrollOnExpand(

                  child: Container(
                    // padding: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor
                    ),

                    child: Column(
                      children: [
                        Expandable(
                          collapsed:Column(
                            // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:  EdgeInsets.zero,
                                child: Builder(
                                  builder: (context){
                                    var controller = ExpandableController.of(context);
                                    return Padding(
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                        onTap: (){
                                          controller!.toggle();
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(width: 2, color: Colors.white)
                                          ),
                                          child: Stack(

                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Consumer<HomeProvider>(
                                                        builder: (_,data,__){
                                                          return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                                                        },
                                                      ),
                                                      // Text('${programList[0].programName}',style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [

                                                      Icon(Icons.keyboard_arrow_down_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
                                                      SizedBox(width: 20,),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                                ),
                              )

                            ],
                          ),
                          expanded: Container(
                            decoration: BoxDecoration(
                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                                borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(width: 2, color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Consumer<HomeProvider>(
                                                  builder: (_,data,__){
                                                    return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                                                  },
                                                ),
                                                // Icon(Icons.account_balance)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),


                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Material(

                                            color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                                            borderRadius: BorderRadius.all(Radius.circular(16)),
                                            child: ListView.separated(
                                                itemCount: programList.length,shrinkWrap: true,
                                                padding: EdgeInsets.all(5),
                                                itemBuilder: (ctx,index){

                                                  return ListTile(
                                                    onTap: (){
                                                      controller!.toggle();
                                                      _homeProvider.setProgramName = programList[index].programName;
                                                      selectedMemberId = programList[index].memberId;
                                                      selectedProgramId = programList[index].programId;
                                                      selectedProgramName = programList[index].programName;



                                                    },
                                                    // trailing: Text(replaceFarsiNumber('${index+1}')),
                                                    title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 12,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor),),
                                                  );
                                                },
                                                separatorBuilder: (ctx,index){
                                                  return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,indent: 10,endIndent: 10,height: 1,thickness: 0.5  ,);
                                                }
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),

                                // Material(
                                //   borderRadius: BorderRadius.all(Radius.circular(16)),
                                //   child: ListView.separated(
                                //       itemCount: programList.length,shrinkWrap: true,
                                //       padding: EdgeInsets.all(5),
                                //       itemBuilder: (ctx,index){
                                //
                                //         return ListTile(
                                //           onTap: (){
                                //             _homeProvider.setProgramName = programList[index].programName;
                                //             selectedMemberId = programList[index].memberId;
                                //             selectedProgramId = programList[index].programId;
                                //             selectedProgramName = programList[index].programName;
                                //
                                //
                                //
                                //           },
                                //           trailing: Text(replaceFarsiNumber('${index+1}')),
                                //           title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 13),),
                                //         );
                                //       },
                                //       separatorBuilder: (ctx,index){
                                //         return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,indent: 3,endIndent: 3,height: 1,thickness: 0.3,);
                                //       }
                                //   ),
                                // ),




                                // SizedBox(height: 8,),
                                // Align(
                                //   alignment: Alignment.bottomCenter,
                                //   child: Builder(
                                //     builder: (context){
                                //       var controller = ExpandableController.of(context);
                                //       return Padding(
                                //         padding: EdgeInsets.zero,
                                //         child: InkWell(
                                //           onTap: (){
                                //             controller.toggle();
                                //           },
                                //           child: Icon(Icons.menu_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
                                //         ),
                                //       );
                                //       // IconButton(
                                //       //   onPressed: (){
                                //       //     controller.toggle();
                                //       //   },
                                //       //   icon: Icon(Icons.menu_rounded),
                                //       // )
                                //     },
                                //
                                //   ),
                                // ),
                                //
                                //



                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    ,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme NavyBlue'){
      return Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: ExpandableNotifier(

              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ScrollOnExpand(

                  child: Container(
                    // padding: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor
                    ),

                    child: Column(
                      children: [
                        Expandable(
                          collapsed:Column(
                            // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:  EdgeInsets.zero,
                                child: Builder(
                                  builder: (context){
                                    var controller = ExpandableController.of(context);
                                    return Padding(
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                        onTap: (){
                                          controller!.toggle();
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(width: 2, color: Colors.white)
                                          ),
                                          child: Stack(

                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Consumer<HomeProvider>(
                                                        builder: (_,data,__){
                                                          return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.indicatorColor),maxLines: 1,);
                                                        },
                                                      ),
                                                      // Text('${programList[0].programName}',style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [

                                                      Icon(Icons.keyboard_arrow_down_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,),
                                                      SizedBox(width: 20,),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                                ),
                              )

                            ],
                          ),
                          expanded: Container(
                            decoration: BoxDecoration(
                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                                borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(width: 2, color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Consumer<HomeProvider>(
                                                  builder: (_,data,__){
                                                    return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                                                  },
                                                ),
                                                // Icon(Icons.account_balance)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),


                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Material(

                                            color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                                            borderRadius: BorderRadius.all(Radius.circular(16)),
                                            child: ListView.separated(
                                                itemCount: programList.length,shrinkWrap: true,
                                                padding: EdgeInsets.all(5),
                                                itemBuilder: (ctx,index){

                                                  return ListTile(
                                                    onTap: (){
                                                      controller!.toggle();
                                                      _homeProvider.setProgramName = programList[index].programName;
                                                      selectedMemberId = programList[index].memberId;
                                                      selectedProgramId = programList[index].programId;
                                                      selectedProgramName = programList[index].programName;



                                                    },
                                                    // trailing: Text(replaceFarsiNumber('${index+1}')),
                                                    title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 12,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor),),
                                                  );
                                                },
                                                separatorBuilder: (ctx,index){
                                                  return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,indent: 10,endIndent: 10,height: 1,thickness: 0.5  ,);
                                                }
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),

                                // Material(
                                //   borderRadius: BorderRadius.all(Radius.circular(16)),
                                //   child: ListView.separated(
                                //       itemCount: programList.length,shrinkWrap: true,
                                //       padding: EdgeInsets.all(5),
                                //       itemBuilder: (ctx,index){
                                //
                                //         return ListTile(
                                //           onTap: (){
                                //             _homeProvider.setProgramName = programList[index].programName;
                                //             selectedMemberId = programList[index].memberId;
                                //             selectedProgramId = programList[index].programId;
                                //             selectedProgramName = programList[index].programName;
                                //
                                //
                                //
                                //           },
                                //           trailing: Text(replaceFarsiNumber('${index+1}')),
                                //           title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 13),),
                                //         );
                                //       },
                                //       separatorBuilder: (ctx,index){
                                //         return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,indent: 3,endIndent: 3,height: 1,thickness: 0.3,);
                                //       }
                                //   ),
                                // ),




                                // SizedBox(height: 8,),
                                // Align(
                                //   alignment: Alignment.bottomCenter,
                                //   child: Builder(
                                //     builder: (context){
                                //       var controller = ExpandableController.of(context);
                                //       return Padding(
                                //         padding: EdgeInsets.zero,
                                //         child: InkWell(
                                //           onTap: (){
                                //             controller.toggle();
                                //           },
                                //           child: Icon(Icons.menu_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
                                //         ),
                                //       );
                                //       // IconButton(
                                //       //   onPressed: (){
                                //       //     controller.toggle();
                                //       //   },
                                //       //   icon: Icon(Icons.menu_rounded),
                                //       // )
                                //     },
                                //
                                //   ),
                                // ),
                                //
                                //



                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    ,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme GoldBlue'){
      return Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: ExpandableNotifier(

              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ScrollOnExpand(

                  child: Container(
                    // padding: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor
                    ),

                    child: Column(
                      children: [
                        Expandable(
                          collapsed:Column(
                            // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:  EdgeInsets.zero,
                                child: Builder(
                                  builder: (context){
                                    var controller = ExpandableController.of(context);
                                    return Padding(
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                        onTap: (){
                                          controller!.toggle();
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(width: 2, color: Colors.white),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.4),
                                                    blurRadius: 5,
                                                    spreadRadius: 0,
                                                    offset: Offset(0,3)
                                                )
                                              ]
                                          ),
                                          child: Stack(

                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Consumer<HomeProvider>(
                                                        builder: (_,data,__){
                                                          return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColor),maxLines: 1,);
                                                        },
                                                      ),
                                                      // Text('${programList[0].programName}',style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [

                                                      Icon(Icons.keyboard_arrow_down_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,),
                                                      SizedBox(width: 20,),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                                ),
                              )

                            ],
                          ),
                          expanded: Container(
                            decoration: BoxDecoration(
                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: Offset(0,3)
                                  )
                                ]

                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Container(
                                            height: 50,
                                            margin: EdgeInsets.only(bottom: 1.0),
                                            decoration: BoxDecoration(
                                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(width: 2, color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey.withOpacity(0.4),
                                                      blurRadius: 5,
                                                      spreadRadius: 0,
                                                      offset: Offset(0,3)
                                                  )
                                                ]
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Consumer<HomeProvider>(
                                                  builder: (_,data,__){
                                                    return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                                                  },
                                                ),
                                                // Icon(Icons.account_balance)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),


                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Material(

                                            color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor,
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),bottomLeft: Radius.circular(16)),
                                            child: ListView.separated(
                                                itemCount: programList.length,shrinkWrap: true,
                                                padding: EdgeInsets.all(5),
                                                itemBuilder: (ctx,index){

                                                  return ListTile(
                                                    onTap: (){
                                                      controller!.toggle();
                                                      _homeProvider.setProgramName = programList[index].programName;
                                                      selectedMemberId = programList[index].memberId;
                                                      selectedProgramId = programList[index].programId;
                                                      selectedProgramName = programList[index].programName;



                                                    },
                                                    // trailing: Text(replaceFarsiNumber('${index+1}')),
                                                    title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 14,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor),),
                                                  );
                                                },
                                                separatorBuilder: (ctx,index){
                                                  return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,indent: 10,endIndent: 10,height: 1,thickness: 0.5  ,);
                                                }
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),

                                // Material(
                                //   borderRadius: BorderRadius.all(Radius.circular(16)),
                                //   child: ListView.separated(
                                //       itemCount: programList.length,shrinkWrap: true,
                                //       padding: EdgeInsets.all(5),
                                //       itemBuilder: (ctx,index){
                                //
                                //         return ListTile(
                                //           onTap: (){
                                //             _homeProvider.setProgramName = programList[index].programName;
                                //             selectedMemberId = programList[index].memberId;
                                //             selectedProgramId = programList[index].programId;
                                //             selectedProgramName = programList[index].programName;
                                //
                                //
                                //
                                //           },
                                //           trailing: Text(replaceFarsiNumber('${index+1}')),
                                //           title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 13),),
                                //         );
                                //       },
                                //       separatorBuilder: (ctx,index){
                                //         return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,indent: 3,endIndent: 3,height: 1,thickness: 0.3,);
                                //       }
                                //   ),
                                // ),




                                // SizedBox(height: 8,),
                                // Align(
                                //   alignment: Alignment.bottomCenter,
                                //   child: Builder(
                                //     builder: (context){
                                //       var controller = ExpandableController.of(context);
                                //       return Padding(
                                //         padding: EdgeInsets.zero,
                                //         child: InkWell(
                                //           onTap: (){
                                //             controller.toggle();
                                //           },
                                //           child: Icon(Icons.menu_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
                                //         ),
                                //       );
                                //       // IconButton(
                                //       //   onPressed: (){
                                //       //     controller.toggle();
                                //       //   },
                                //       //   icon: Icon(Icons.menu_rounded),
                                //       // )
                                //     },
                                //
                                //   ),
                                // ),
                                //
                                //



                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    ,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

    }
    else if(ThemeManagerModule.themeManagerModule.getThemeName() == 'theme WhiteBlue'){
      return Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: ExpandableNotifier(

              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ScrollOnExpand(

                  child: Container(
                    // padding: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor
                    ),

                    child: Column(
                      children: [
                        Expandable(
                          collapsed:Column(
                            // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:  EdgeInsets.zero,
                                child: Builder(
                                  builder: (context){
                                    var controller = ExpandableController.of(context);
                                    return Padding(
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                        onTap: (){
                                          controller!.toggle();
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorLight,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(width: 2, color: Colors.white),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.4),
                                                    blurRadius: 5,
                                                    spreadRadius: 0,
                                                    offset: Offset(0,3)
                                                )
                                              ]
                                          ),
                                          child: Stack(

                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Consumer<HomeProvider>(
                                                        builder: (_,data,__){
                                                          return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                                                        },
                                                      ),
                                                      // Text('${programList[0].programName}',style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [

                                                      Icon(Icons.keyboard_arrow_down_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,),
                                                      SizedBox(width: 20,),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                                ),
                              )

                            ],
                          ),
                          expanded: Container(
                            decoration: BoxDecoration(
                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: Offset(0,3)
                                  )
                                ]

                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Container(
                                            height: 50,
                                            margin: EdgeInsets.only(bottom: 1.0),
                                            decoration: BoxDecoration(
                                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(width: 2, color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey.withOpacity(0.4),
                                                      blurRadius: 5,
                                                      spreadRadius: 0,
                                                      offset: Offset(0,3)
                                                  )
                                                ]
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Consumer<HomeProvider>(
                                                  builder: (_,data,__){
                                                    return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                                                  },
                                                ),
                                                // Icon(Icons.account_balance)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),


                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Material(

                                            color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor,
                                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),bottomLeft: Radius.circular(16)),
                                            child: ListView.separated(
                                                itemCount: programList.length,shrinkWrap: true,
                                                padding: EdgeInsets.all(5),
                                                itemBuilder: (ctx,index){

                                                  return ListTile(
                                                    onTap: (){
                                                      controller!.toggle();
                                                      _homeProvider.setProgramName = programList[index].programName;
                                                      selectedMemberId = programList[index].memberId;
                                                      selectedProgramId = programList[index].programId;
                                                      selectedProgramName = programList[index].programName;



                                                    },
                                                    // trailing: Text(replaceFarsiNumber('${index+1}')),
                                                    title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 14,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor),),
                                                  );
                                                },
                                                separatorBuilder: (ctx,index){
                                                  return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,indent: 10,endIndent: 10,height: 1,thickness: 0.5  ,);
                                                }
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),

                                // Material(
                                //   borderRadius: BorderRadius.all(Radius.circular(16)),
                                //   child: ListView.separated(
                                //       itemCount: programList.length,shrinkWrap: true,
                                //       padding: EdgeInsets.all(5),
                                //       itemBuilder: (ctx,index){
                                //
                                //         return ListTile(
                                //           onTap: (){
                                //             _homeProvider.setProgramName = programList[index].programName;
                                //             selectedMemberId = programList[index].memberId;
                                //             selectedProgramId = programList[index].programId;
                                //             selectedProgramName = programList[index].programName;
                                //
                                //
                                //
                                //           },
                                //           trailing: Text(replaceFarsiNumber('${index+1}')),
                                //           title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 13),),
                                //         );
                                //       },
                                //       separatorBuilder: (ctx,index){
                                //         return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,indent: 3,endIndent: 3,height: 1,thickness: 0.3,);
                                //       }
                                //   ),
                                // ),




                                // SizedBox(height: 8,),
                                // Align(
                                //   alignment: Alignment.bottomCenter,
                                //   child: Builder(
                                //     builder: (context){
                                //       var controller = ExpandableController.of(context);
                                //       return Padding(
                                //         padding: EdgeInsets.zero,
                                //         child: InkWell(
                                //           onTap: (){
                                //             controller.toggle();
                                //           },
                                //           child: Icon(Icons.menu_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
                                //         ),
                                //       );
                                //       // IconButton(
                                //       //   onPressed: (){
                                //       //     controller.toggle();
                                //       //   },
                                //       //   icon: Icon(Icons.menu_rounded),
                                //       // )
                                //     },
                                //
                                //   ),
                                // ),
                                //
                                //



                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    ,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

    }
    else{
      return Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: ExpandableNotifier(

              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ScrollOnExpand(

                  child: Container(
                    // padding: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor
                    ),

                    child: Column(
                      children: [
                        Expandable(
                          collapsed:Column(
                            // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding:  EdgeInsets.zero,
                                child: Builder(
                                  builder: (context){
                                    var controller = ExpandableController.of(context);
                                    return Padding(
                                      padding: EdgeInsets.zero,
                                      child: InkWell(
                                        onTap: (){
                                          controller!.toggle();
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(width: 2, color: Colors.white)
                                          ),
                                          child: Stack(

                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Consumer<HomeProvider>(
                                                        builder: (_,data,__){
                                                          return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(color: context.read<ThemeProvider>().getThemeData.backgroundColor),maxLines: 1,);
                                                        },
                                                      ),
                                                      // Text('${programList[0].programName}',style: TextStyle(fontSize: 14),),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [

                                                      Icon(Icons.keyboard_arrow_down_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
                                                      SizedBox(width: 20,),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                                ),
                              )

                            ],
                          ),
                          expanded: Container(
                            decoration: BoxDecoration(
                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.cardColor,
                                borderRadius: BorderRadius.circular(20)

                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: ThemeManagerModule.themeManagerModule.getInUseTheme.accentColor,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(width: 2, color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Consumer<HomeProvider>(
                                                  builder: (_,data,__){
                                                    return Text('${data.getProgramName}',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: context.read<ThemeProvider>().getThemeData.primaryColorDark),maxLines: 1,);
                                                  },
                                                ),
                                                // Icon(Icons.account_balance)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),


                                Padding(
                                  padding:  EdgeInsets.zero,
                                  child: Builder(
                                    builder: (context){
                                      var controller = ExpandableController.of(context);
                                      return Padding(
                                        padding: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: (){
                                            controller!.toggle();
                                          },
                                          child: Material(

                                            color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,
                                            borderRadius: BorderRadius.all(Radius.circular(16)),
                                            child: ListView.separated(
                                                itemCount: programList.length,shrinkWrap: true,
                                                padding: EdgeInsets.all(5),
                                                itemBuilder: (ctx,index){

                                                  return ListTile(
                                                    onTap: (){
                                                      controller!.toggle();
                                                      _homeProvider.setProgramName = programList[index].programName;
                                                      selectedMemberId = programList[index].memberId;
                                                      selectedProgramId = programList[index].programId;
                                                      selectedProgramName = programList[index].programName;



                                                    },
                                                    // trailing: Text(replaceFarsiNumber('${index+1}')),
                                                    title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 12,color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor),),
                                                  );
                                                },
                                                separatorBuilder: (ctx,index){
                                                  return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.indicatorColor,indent: 10,endIndent: 10,height: 1,thickness: 0.5  ,);
                                                }
                                            ),
                                          ),
                                        ),
                                      );
                                    },

                                  ),
                                ),

                                // Material(
                                //   borderRadius: BorderRadius.all(Radius.circular(16)),
                                //   child: ListView.separated(
                                //       itemCount: programList.length,shrinkWrap: true,
                                //       padding: EdgeInsets.all(5),
                                //       itemBuilder: (ctx,index){
                                //
                                //         return ListTile(
                                //           onTap: (){
                                //             _homeProvider.setProgramName = programList[index].programName;
                                //             selectedMemberId = programList[index].memberId;
                                //             selectedProgramId = programList[index].programId;
                                //             selectedProgramName = programList[index].programName;
                                //
                                //
                                //
                                //           },
                                //           trailing: Text(replaceFarsiNumber('${index+1}')),
                                //           title: Text('${programList[index].programName}',textDirection: TextDirection.rtl,textAlign: TextAlign.center,maxLines: 1,style: TextStyle(fontSize: 13),),
                                //         );
                                //       },
                                //       separatorBuilder: (ctx,index){
                                //         return Divider(color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColor,indent: 3,endIndent: 3,height: 1,thickness: 0.3,);
                                //       }
                                //   ),
                                // ),




                                // SizedBox(height: 8,),
                                // Align(
                                //   alignment: Alignment.bottomCenter,
                                //   child: Builder(
                                //     builder: (context){
                                //       var controller = ExpandableController.of(context);
                                //       return Padding(
                                //         padding: EdgeInsets.zero,
                                //         child: InkWell(
                                //           onTap: (){
                                //             controller.toggle();
                                //           },
                                //           child: Icon(Icons.menu_rounded,color: ThemeManagerModule.themeManagerModule.getInUseTheme.primaryColorDark,),
                                //         ),
                                //       );
                                //       // IconButton(
                                //       //   onPressed: (){
                                //       //     controller.toggle();
                                //       //   },
                                //       //   icon: Icon(Icons.menu_rounded),
                                //       // )
                                //     },
                                //
                                //   ),
                                // ),
                                //
                                //



                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    ,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

    }

  }



   */

}

