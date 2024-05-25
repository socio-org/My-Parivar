import 'package:flutter/material.dart';
import 'package:mera_pariwar/components/interactive_elements/custom_button.dart';
import 'package:mera_pariwar/components/interactive_elements/text_input.dart';
import 'package:mera_pariwar/themes/themes.dart';

class FilterModal extends StatefulWidget {
  final VoidCallback onClose;

  const FilterModal({super.key, required this.onClose});

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  String selectedOption = 'Main';
  String familyName = '';
  String area = '';
  String subArea = '';
  final TextEditingController _controller = TextEditingController();

  void _setOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void _updateFilter(String key, String value) {
    setState(() {
      if (key == 'Family Name') {
        familyName = value;
      } else if (key == 'Area') {
        area = value;
      } else if (key == 'Sub Area') {
        subArea = value;
      }
      selectedOption = 'Main';
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (selectedOption == 'Main') ...[
                    Container(
                      margin: const EdgeInsets.only(top: 15, left: 17),
                      width: double.infinity,
                      child: const Text(
                        "Filter",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      title: const Text('Family',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      subtitle: Text(
                          familyName.isEmpty
                              ? 'Select Family Name'
                              : familyName,
                          style: TextStyle(
                              fontSize: 12,
                              color: familyName.isEmpty
                                  ? Colors.grey
                                  : AppTheme.blueText)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                      onTap: () => _setOption('Family Name'),
                    ),
                    ListTile(
                      title: const Text('Area',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      subtitle: Text(area.isEmpty ? 'Select Area' : area,
                          style: TextStyle(
                              fontSize: 12,
                              color: area.isEmpty
                                  ? Colors.grey
                                  : AppTheme.blueText)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                      onTap: () => _setOption('Area'),
                    ),
                    ListTile(
                      title: const Text('Sub Area',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      subtitle: Text(
                          subArea.isEmpty ? 'Select Sub Area' : subArea,
                          style: TextStyle(
                              fontSize: 12,
                              color: subArea.isEmpty
                                  ? Colors.grey
                                  : AppTheme.blueText)),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                      onTap: () => _setOption('Sub Area'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              text: 'Reset',
                              onClick: () {
                                setState(() {
                                  familyName = '';
                                  area = '';
                                  subArea = '';
                                });
                              },
                              fillColor: Colors.white,
                              textColor: AppTheme.navColor,
                              border: true,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: MyButton(
                              text: 'Apply Filter',
                              onClick: () {
                                widget.onClose();
                                Navigator.of(context).pop();
                              },
                              fillColor: AppTheme.navColor,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ] else ...[
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Filter",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Column(
                        children: [
                          MyTextInput(
                            controller: _controller,
                            placeholder: "Search",
                            onChanged: (value) {},
                            icon: Icons.search_outlined,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Search for '$selectedOption'",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: MyButton(
                                  text: 'Cancel',
                                  onClick: () => _setOption('Main'),
                                  fillColor: Colors.white,
                                  textColor: AppTheme.navColor,
                                  border: true,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: MyButton(
                                  text: 'Continue',
                                  onClick: () {
                                    print(_controller.text);
                                    _updateFilter(
                                        selectedOption, _controller.text);
                                    _setOption("Main");
                                  },
                                  fillColor: AppTheme.navColor,
                                  textColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
