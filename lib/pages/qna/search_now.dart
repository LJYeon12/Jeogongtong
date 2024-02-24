import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jeogongtong_front/constants/api.dart';

class SearchNowPage extends StatefulWidget {
  final String searchQuery;
  const SearchNowPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchNowPage> createState() => _SearchNowPageState();
}

class _SearchNowPageState extends State<SearchNowPage> {
  Color _buttonColor = const Color(0xff131214);
  final TextEditingController _controller = TextEditingController();
  List<dynamic> searchResults = [];
  Map<String, dynamic>? selectedStudy;
  @override
  void initState() {
    super.initState();
    _controller.text = widget.searchQuery;
    _fetchData(widget.searchQuery);
  }

  Future<void> _fetchData(String keyword) async {
    final Uri uri = Uri(
      scheme: 'http',
      port: apiPort,
      host: apiHost,
      path: '/questions/search/${widget.searchQuery}',
    );
    final response = await http.post(
      uri,
      body: {'keyword': keyword},
      encoding: Encoding.getByName('utf-8'),
    );
    if (response.statusCode == 200) {
      setState(() {
        searchResults = jsonDecode(utf8.decode(response.bodyBytes));
        print(searchResults);
      });
    } else {
      Center(child: Text("찾으시는 질문이 없습니다"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            leadingWidth: 30,
            leading: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _buttonColor = const Color(0xffFC9AB8);
                });
              },
              onTapUp: (_) {
                setState(() {
                  _buttonColor = const Color(0xff131214);
                });
              },
              child: Transform.translate(
                offset: const Offset(7, 0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: SvgPicture.asset(
                    "assets/images/chevron-left.svg",
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      _buttonColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            title: Container(
              width: double.infinity,
              height: 36,
              decoration: BoxDecoration(
                  color: const Color(0xffF2F4F5),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                //텍스트 필드
                child: TextField(
                  controller: _controller,
                  onSubmitted: (text) async {
                    if (text.isNotEmpty) {
                      await _fetchData(text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchNowPage(searchQuery: text),
                        ),
                      );
                    }
                  },
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 12.0, 10.0),
                      child: SvgPicture.asset(
                        "assets/images/search.svg",
                        width: 16,
                        height: 16,
                      ),
                    ),
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: SvgPicture.asset(
                        "assets/images/x.svg",
                        width: 16,
                        height: 16,
                      ),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 13),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final result = searchResults[index];
                  final name = result.containsKey('name')
                      ? result['name']
                      : 'Name not available';

                  return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      title: Text(
                        name,
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedStudyInfo(
                              selectedStudy: result,
                            ),
                          ),
                        );
                        */
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
