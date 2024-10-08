import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/note_fab.dart';
import 'package:note_app/note_grid.dart';
import 'package:note_app/note_list.dart';
import 'package:note_app/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> dropdownOptions = ["a-z", "Ngày tháng "];
  late String dropdownValue = dropdownOptions.first;
  bool isDescending = true;
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "NOTE APP",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 180, 30, 30),
          actions: [
            IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.rightFromBracket)),
          ],
        ),
        floatingActionButton: NoteFab(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchField(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isDescending = !isDescending;
                        });
                      },
                      icon: FaIcon(isDescending
                          ? FontAwesomeIcons.arrowDown
                          : FontAwesomeIcons.arrowUp),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      constraints: BoxConstraints(),
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      iconSize: 18,
                      color: gray700,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    DropdownButton(
                        value: dropdownValue,
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: FaIcon(
                            FontAwesomeIcons.arrowDownWideShort,
                            size: 18,
                            color: gray700,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(16),
                        underline: SizedBox.shrink(),
                        isDense: true,
                        items: dropdownOptions
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Text(e),
                                    if (e == dropdownValue) ...[
                                      SizedBox(width: 8),
                                      Icon(Icons.check),
                                    ],
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        selectedItemBuilder: (context) =>
                            dropdownOptions.map((e) => Text(e)).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isGrid = !isGrid;
                        });
                      },
                      icon: FaIcon(isGrid
                          ? FontAwesomeIcons.tableCellsLarge
                          : FontAwesomeIcons.bars),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      constraints: BoxConstraints(),
                      style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      iconSize: 18,
                      color: gray700,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isGrid ? NotesGrid() : NotesList(),
              )
            ],
          ),
        ));
  }
}
