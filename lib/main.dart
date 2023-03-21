import 'package:flutter/material.dart';
import 'string.dart' as strings;
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  const GHFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: strings.appTitle,
      home: GHFlutter(),
    );
  }
}

class GHFlutter extends StatefulWidget {
  const GHFlutter({super.key});

  @override
  State<GHFlutter> createState() => _GHFlutterState();
}

class _GHFlutterState extends State<GHFlutter> {
  final _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(_members[i].login, style: _biggerFont,),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[i].avatar_url),
        ),
        ),
      );
  }

  Future <void> _loadData() async {
    const dataUrl = 'https://api.github.com/orgs/kodecocodes/members';
    final response = await http.get(Uri.parse(dataUrl));
    setState(() {
      final dataList = json.decode(response.body) as List;
      for (final item in dataList) {
        final login = item['login'] as String? ?? '';
        final avatar = item['avatar_url'] as String? ?? '';
        final member = Member(login, avatar);
        _members.add(member);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.appTitle),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int position) {
          return _buildRow(position);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        }, 
        itemCount: _members.length
        )
    );
  }
}

class Member {
  Member(this.login, this.avatar_url);
  final String login;
  final String avatar_url
}