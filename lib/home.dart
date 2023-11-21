import 'package:flutter/material.dart';
import 'router_utils.dart';

List<String> titles = <String>[
  'Сотрудники',
  'Задачи',
  'Профиль',
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(child: Text("Home Page")),
//       ),
//     );
//   }
// }

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text(APP_PAGE.home.routePageTitle),
          // This check specifies which nested Scrollable's scroll notification
          // should be listened to.
          //
          // When `ThemeData.useMaterial3` is true and scroll view has
          // scrolled underneath the app bar, this updates the app bar
          // background color and elevation.
          //
          // This sets `notification.depth == 1` to listen to the scroll
          // notification from the nested `ListView.builder`.
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.supervisor_account),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.task),
                text: titles[1],
              ),
              Tab(
                icon: const Icon(Icons.person),
                text: titles[2],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                index+=1;
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[0]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                index+=1;
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[1]} $index'),
                );
              },
            ),
            Column(
              children: [

                // name
                Padding(padding: EdgeInsets.only(top: 30),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ФИО', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 32))
                  ],
                ),

                // avatar
                Padding(padding: EdgeInsets.only(top:30),),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/nophoto.jpg'),
                  radius: 100,
                ),
                // email
                Padding(padding: EdgeInsets.only(top: 30),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail_outline, size:25),
                    Padding(padding: EdgeInsets.only(left: 20),),
                    Text('test@test.com', style: TextStyle(fontFamily: 'Roboto',))
                  ],
                ),

                // password
                Padding(padding: EdgeInsets.only(top: 10),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.key_outlined, size:25),
                    Padding(padding: EdgeInsets.only(left: 20),),
                    Text('**********', style: TextStyle(fontFamily: 'Roboto'))
                  ]
                ),

                // logout
                Padding(padding: EdgeInsets.only(top: 50),),
                ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: const Text('Выход'),
                    onTap: () {
                      print("Тут будет функционал выхода");
                    }),

              ],
            )
          ],
        ),
      ),
    );
  }
}
