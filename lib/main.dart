import 'package:flutter/material.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  MyMessage(message,context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Application"),
        backgroundColor: Colors.blue,
        // centerTitle: true,
        toolbarHeight: 65,
        toolbarOpacity: 1,
        actions: [
          IconButton(onPressed: (){MyMessage("This is search", context);}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){MyMessage("This is menu", context);}, icon: Icon(Icons.more_vert)),
          IconButton(onPressed: (){MyMessage("This is account", context);}, icon: Icon(Icons.account_circle_sharp))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          MyMessage("This is floating button", context);
          },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person")
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 12,

        onTap: (int index){
          if(index==0){
            MyMessage("This is home", context);
          }else if(index==1){
            MyMessage("This is favorite", context);
          }else if(index==2){
            MyMessage("This is settings", context);
          }
        }
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Kuldeep Kolage"),
              accountEmail: Text("kolagekuldeep09@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://webstockreview.net/images/images-png-10.png"),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              onDetailsPressed: (){
                MyMessage("Details of my account", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                MyMessage("This is home", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorite"),
              onTap: (){
                MyMessage("This is favorite", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Contact Us"),
              onTap: (){
                MyMessage("Contact Us", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){
                MyMessage("This is Settings", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: (){
                MyMessage("This is logout", context);
              },
            ),
          ],
        )
    ),


      body: const Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
