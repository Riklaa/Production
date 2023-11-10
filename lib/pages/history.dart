import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prodution/models/history_model.dart';
import 'package:prodution/pages/detailhistory.dart';

var url = Uri.parse('http://192.168.1.12/production/viewdata.php');

List<HistoryModel> historyModel = [];

void _getInitialInfo() async {
  historyModel = await HistoryModel.getHistory();
}

class history extends StatefulWidget {
  @override
  State<history> createState() => _History();
}

class _History extends State<history> {
  int index_color = 0;
  List<HistoryModel> filteredHistory = [];
  String _searchQuery = '';

  void _filterHistory() {
    if (index_color == 1) {
      filteredHistory = historyModel
          .where((element) =>
              element.status.toLowerCase() == 'finished' &&
              element.name.toLowerCase().contains(_searchQuery))
          .toList();
    } else if (index_color == 2) {
      filteredHistory = historyModel
          .where((element) =>
              element.status.toLowerCase() == 'ongoing' &&
              element.name.toLowerCase().contains(_searchQuery))
          .toList();
    } else if (index_color == 3) {
      filteredHistory = historyModel
          .where((element) =>
              element.status.toLowerCase() == 'canceled' &&
              element.name.toLowerCase().contains(_searchQuery))
          .toList();
    } else {
      // If no filter is selected, search across all items
      filteredHistory = historyModel
          .where((element) => element.name.toLowerCase().contains(_searchQuery))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    _filterHistory();

    return Scaffold(
      backgroundColor: Color(0xff092863),
      body: ListView(
        children: [
          _head(),
          SizedBox(height: 10),
          _body(filteredHistory),
        ],
      ),
    );
  }

  Widget _body(List<HistoryModel> history) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF0044C9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: TextField(
                        onChanged: (query) {
                          setState(() {
                            _searchQuery = query.toLowerCase();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Container(
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index_color == 1 ? Color(0xff0044C9) : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Finished',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          index_color == 1 ? Colors.white : Color(0xff0044C9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Container(
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index_color == 2 ? Color(0xff0044C9) : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Ongoing',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          index_color == 2 ? Colors.white : Color(0xff0044C9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Container(
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index_color == 3 ? Color(0xff0044C9) : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Canceled',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          index_color == 3 ? Colors.white : Color(0xff0044C9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: history.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => detailhistory(),
                  ));
                },
                child: Container(
                  height: 82,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 150.0, bottom: 5),
                            child: Text(
                              history[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color.fromARGB(255, 0, 34, 205),
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Text(
                            history[index].status,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/next.svg',
                        width: 20,
                        height: 20,
                        color: Color.fromARGB(255, 0, 34, 205),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: history[index].boxIsSelected
                        ? Colors.white
                        : const Color.fromARGB(0, 255, 7, 7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'History Progress',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
