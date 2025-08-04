import 'package:demo/main.dart';
import 'package:demo/navigation/route_names.dart';
import 'package:flutter/material.dart';

class GridviewDemoScreen extends StatefulWidget {
  const GridviewDemoScreen({super.key});

  @override
  State<GridviewDemoScreen> createState() => _GridviewDemoScreenState();
}

class _GridviewDemoScreenState extends State<GridviewDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Demo"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                themeManager.toggleTheme();
              });
            },
            icon: themeManager.isDarkTheme
                ? Icon(Icons.light_mode)
                : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category),
        ],
      ),
    );
  }
}

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, getScreenForCategory(category.id));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}

const availableCategories = [
  Category(id: 'c1', title: 'To app communication', color: Colors.purple),
  Category(id: 'c2', title: 'Snackbar', color: Colors.red),
  Category(id: 'c3', title: 'Toast', color: Colors.orange),
  Category(id: 'c4', title: 'Linear Pregress', color: Colors.amber),
  Category(id: 'c5', title: 'Stack', color: Colors.blue),
  Category(id: 'c6', title: 'List View', color: Colors.green),
  Category(id: 'c7', title: 'Single Child Scroll', color: Colors.lightBlue),
  Category(id: 'c8', title: 'Staggered Grid', color: Colors.lightGreen),
  Category(id: 'c9', title: 'Timer Object', color: Colors.pink),
  Category(id: 'c10', title: 'Date Operations', color: Colors.teal),
  Category(id: 'c11', title: 'Splash Screen', color: Colors.blueGrey),
  Category(id: 'c12', title: 'Calendar', color: Colors.indigo),
  Category(id: 'c13', title: 'Localization', color: Colors.deepOrange),
  Category(id: 'c14', title: 'Images', color: Colors.purpleAccent),
  Category(id: 'c15', title: 'Icons', color: Colors.blueAccent),
  Category(id: 'c16', title: 'File Demo', color: Colors.amberAccent),
  Category(id: 'c17', title: 'File Picker', color: Colors.redAccent),
  Category(id: 'c18', title: 'Network API', color: Colors.green),
  Category(id: 'c19', title: 'Hive Demo', color: Colors.deepPurpleAccent),
  Category(id: 'c20', title: 'Permission Handling', color: Colors.pinkAccent),
  Category(id: 'c21', title: 'Async Redux', color: Colors.amberAccent),
  Category(id: 'c22', title: 'Firebase', color: Colors.indigoAccent),
  Category(id: 'c23', title: 'Remote Config', color: Colors.indigoAccent),
  Category(id: 'c24', title: 'Push Notification', color: Colors.indigoAccent),
  Category(id: 'c25', title: 'Authentication', color: Colors.indigoAccent),
];

String getScreenForCategory(String id) {
  switch (id) {
    case 'c1':
      return RouteNames.toAppCommunicationScreen;
    case 'c2':
      return RouteNames.snackbarDemoScreen;
    case 'c3':
      return RouteNames.toastDemoScreen;
    case 'c4':
      return RouteNames.linearProgressDemoScreen;
    case 'c5':
      return RouteNames.stackDemoScreen;
    case 'c6':
      return RouteNames.listviewDemoScreen;
    case 'c7':
      return RouteNames.singlechildscrollDemoScreen;
    case 'c8':
      return RouteNames.staggeredGridViewDemoScreen;
    case 'c9':
      return RouteNames.timerScreen;
    case 'c10':
      return RouteNames.dateOperationsDemoScreen;
    case 'c11':
      return RouteNames.splashScreen;
    case 'c12':
      return RouteNames.calenderScreen;
    case 'c13':
      return RouteNames.localizationScreen;
    case 'c14':
      return RouteNames.imagesDemoScreen;
    case 'c15':
      return RouteNames.iconsDemoScreen;
    case 'c16':
      return RouteNames.fileDemoScreen;
    case 'c17':
      return RouteNames.filePickerScreen;
    case 'c18':
      return RouteNames.productListScreen;
    case 'c19':
      return RouteNames.hiveScreen;
    case 'c20':
      return RouteNames.permissionHandlerScreen;
    case 'c21':
      return RouteNames.arProductListScreen;
    case 'c22':
      return RouteNames.firebaseScreen;
    case 'c23':
      return RouteNames.remoteConfig;
    case 'c24':
      return RouteNames.pushNotification;
    case 'c25':
      return RouteNames.firebaseAuthScreen;
    // Add more cases for other categories
    default:
      return RouteNames.gridViewDemoScreen;
  }
}
