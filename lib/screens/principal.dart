import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/models/languages.dart';
import 'package:my_app/utils/default_widget.dart';

class PrincipalScreenWidget extends StatefulWidget {
  const PrincipalScreenWidget({super.key});

  @override
  State<PrincipalScreenWidget> createState() => _PrincipalScreenWidgetState();
}

class _PrincipalScreenWidgetState extends State<PrincipalScreenWidget> {
  List<Language> languages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Minhas liguagens'),
        actions: [IconButton(onPressed: _goToForm, icon: iconAdd)],
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
                    'assets/react.svg',
                    semanticsLabel: e.name,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(e.name),
                  subtitle: Text(e.description)),
            ))
        .toList();
  }

  void _goToForm() {
    Future future = Navigator.pushNamed(context, "/add");

    future.then((value) {
      setState(() {
        languages.add(value);
      });
    });
  }
}
