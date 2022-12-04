import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/models/languages.dart';

class PrincipalScreenWidget extends StatefulWidget {
  const PrincipalScreenWidget({super.key});

  @override
  State<PrincipalScreenWidget> createState() => _PrincipalScreenWidgetState();
}

class _PrincipalScreenWidgetState extends State<PrincipalScreenWidget> {
  List<Language> languages = [
    Language("React", "Meta framework", 'assets/react.svg'),
    Language("Ios", "Apple native lang", 'assets/apple.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Minhas liguagens'),
      ),
      body: Column(children: [
        Center(
            child: Wrap(
          spacing: 10,
          children: _buildChips(),
        )),
        Expanded(
            child: ListView(
          children: _buildlistItem(),
        ))
      ]),
    );
  }

  List<ChoiceChip> _buildChips() {
    return languages
        .map((lang) => ChoiceChip(
              label: Text(lang.name),
              selected: lang.selected,
              onSelected: (value) {
                setState(() {
                  lang.selected = value;
                });
              },
            ))
        .toList();
  }

  List<Widget> _buildlistItem() {
    return languages
        .where((element) => element.selected)
        .map((e) => Card(
              child: ListTile(
                  leading: SvgPicture.asset(
                    e.asset,
                    semanticsLabel: e.name,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(e.name),
                  subtitle: Text(e.description)),
            ))
        .toList();
  }
}
