import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredGridTile> _cardTitle = [
  StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.red, id: 1),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    child: BackGroundTile(backgroundColor: Colors.orange, id: 2),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(backgroundColor: Colors.pink, id: 3),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: BackGroundTile(backgroundColor: Colors.green, id: 4),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.amber, id: 5),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.blue, id: 6),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.indigo, id: 7),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.lightGreen, id: 8),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    child: BackGroundTile(backgroundColor: Colors.blueGrey, id: 9),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 2,
    child: BackGroundTile(backgroundColor: Colors.teal, id: 10),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 2,
    mainAxisCellCount: 1,
    child: BackGroundTile(backgroundColor: Colors.lightBlue, id: 11),
  ),
];

class StaggeredGridViewDemoScreen extends StatelessWidget {
  const StaggeredGridViewDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered Grid View Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(7),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: _cardTitle,
        ),
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final Color? backgroundColor;
  final int id;

  const BackGroundTile({super.key, this.backgroundColor, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Center(
        child: Text(
          '$id',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
