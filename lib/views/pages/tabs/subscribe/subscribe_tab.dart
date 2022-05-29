import 'package:emdad_khodro_saipa/views/pages/tabs/subscribe/components/renew.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'components/body_garanty.dart';
import 'components/purchase_emdad.dart';

class SubscribeTab extends StatefulWidget {
  const SubscribeTab({Key? key}) : super(key: key);

  @override
  _SubscribeTabState createState() => _SubscribeTabState();
}

class _SubscribeTabState extends State<SubscribeTab> with SingleTickerProviderStateMixin{
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight+20),
          child: Container(
            // color: secondary_dark_purple_color,
            height: 70.0,
            child: new TabBar(

              controller: tabController,
              // indicatorColor: primary_orange_color,
              // unselectedLabelColor: secondary_light_grey_color,
              // labelColor: primary_orange_color,
              tabs: [
                Tab(
                  text: "خرید امداد",
                  icon: Icon(Icons.payment),
                ),

                Tab(
                  text: "تمدید",
                  icon: Icon(Icons.update),
                ),

                Tab(
                  text: "گارانتی بدنه",
                  icon: Icon(Icons.verified_user),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            PurchaseEmdad(),

            Renew(),
            BodyGaranty(),


          ],
        ),
      ),
    );
  }
}
