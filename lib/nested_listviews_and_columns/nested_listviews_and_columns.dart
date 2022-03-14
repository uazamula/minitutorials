import 'package:flutter/material.dart';

class NestedListViewsAndColumns extends StatefulWidget {
  const NestedListViewsAndColumns({Key? key}) : super(key: key);

  @override
  _NestedListViewsAndColumnsState createState() =>
      _NestedListViewsAndColumnsState();
}

class _NestedListViewsAndColumnsState extends State<NestedListViewsAndColumns> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NestedListViewsAndColumns)'),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => controller.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
              ),
              icon: Icon(Icons.arrow_right)),
        ],),
      body: PageView(
        controller: controller,
        children: [

          Column(
          children: [
            Container(
              height: 150,
              color: Colors.red,
              child: Center(
                child: Text('Page1'),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item${index + 1}'),
              ),
            ),
          ],
        ),

          Column(
            children: [
              Container(
                height: 150,
                color: Colors.red,
                child: Center(
                  child: Text('Page2. Rendering overflowed'),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item${index + 1}'),
                ),
              ),
            ],
          ),

          Column(
            children: [
              Container(
                height: 150,
                color: Colors.red,
                child: Center(
                  child: Text('Page3. Flexible widget'),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item${index + 1}'),
                  ),
                ),
              ),
            ],
          ),

          Column(
            children: [
              Container(
                height: 150,
                color: Colors.red,
                child: Center(
                  child: Text('Page4. Expanded'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item${index + 1}'),
                  ),
                ),
              ),
            ],
          ),

          Column(
            children: [
              Container(
                height: 150,
                color: Colors.red,
                child: Center(
                  child: Text('Page5. SizedBox h=250.'),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item${index + 1}'),
                  ),
                ),
              ),
            ],
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  color: Colors.red,
                  child: Center(
                    child: Text('Page6. The whole page is scrollable'),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 30,
                  primary: false,//disable scrolling (ignored for Chrome)
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item${index + 1}'),
                  ),
                ),
              ],
            ),
          ),

          ListView(
            children: [
              Container(
                height: 150,
                color: Colors.red,
                child: Center(
                  child: Text('Page7. Inside ListView'),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,//disable scrolling (ignored for Chrome)
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  title: Text('Item${index + 1}'),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
