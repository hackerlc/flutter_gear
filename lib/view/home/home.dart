import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_app/widget/IconTextTab.dart';
import 'package:flutter_demo_app/view/financial/financial_fragment.dart';
import 'package:flutter_demo_app/view/my/my_fragment.dart';
import 'home_fragment.dart';


const double _kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_MY = 2;
Color _kPrimaryColor = new Color.fromARGB(255, 0, 215, 198);


class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeView> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;
  @override
  void initState() {
    super.initState();
    _controller =
    new TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[
          HomeFragment(),
          FinancialFragment(),
          MyFragment()
        ],
        controller: _controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: new TextStyle(fontSize: _kTabTextSize),
          tabs: <IconTextTab>[
            IconTextTab(
                icon: _currentIndex == INDEX_JOB
                    ? "assets/images/ic_main_tab_company_pre.png"
                    : "assets/images/ic_main_tab_company_nor.png",
                text: "职位",
                color: _currentIndex == INDEX_JOB ? _kPrimaryColor : Colors.grey[900]
            ),
            IconTextTab(
                icon: _currentIndex == INDEX_COMPANY
                    ? "assets/images/ic_main_tab_contacts_pre.png"
                    : "assets/images/ic_main_tab_contacts_nor.png",
                text: "公司",
                color: _currentIndex == INDEX_COMPANY ? _kPrimaryColor : Colors.grey[900]
            ),
            IconTextTab(
                icon: _currentIndex == INDEX_MY
                    ? "assets/images/ic_main_tab_find_pre.png"
                    : "assets/images/ic_main_tab_find_nor.png",
                text: "我的",
                color: _currentIndex == INDEX_MY ? _kPrimaryColor : Colors.grey[900]
            ),
          ],
        ),
      ),
    );
  }

}