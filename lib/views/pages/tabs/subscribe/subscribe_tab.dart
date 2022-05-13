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
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            height: 50.0,
            child: new TabBar(

              controller: tabController,
              indicatorColor: color_sharp_orange,
              unselectedLabelColor: Colors.grey,
              labelColor: color_sharp_orange,
              tabs: [
                Tab(
                  text: "خرید امداد",
                ),

                Tab(
                  text: "تمدید",
                ),

                Tab(
                  text: "گارانتی بدنه",
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
