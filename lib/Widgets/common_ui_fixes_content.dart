import 'package:flutter/material.dart';

class CommonUiFixesContent extends StatefulWidget {
  const CommonUiFixesContent({super.key});

  @override
  State<CommonUiFixesContent> createState() => _CommonUiFixesContentState();
}

class _CommonUiFixesContentState extends State<CommonUiFixesContent> {
  static const List<String> movieTitles = [
    'Movie A',
    'Movie B',
    'Movie C',
    'Movie D',
  ];

  int counter = 0;
  DateTime? selectedDate;

  String formattedDate() {
    final date = selectedDate;
    if (date == null) {
      return 'Not selected';
    }
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> openDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Correct ListView inside Column using Expanded'),
                Expanded(
                  child: ListView.builder(
                    itemCount: movieTitles.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.movie),
                      title: Text(movieTitles[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Expanded gives the ListView bounded height and prevents overflow.',
          ),
          Text('State value: $counter'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Text('Update state'),
          ),
          ElevatedButton(
            onPressed: openDatePicker,
            child: const Text('Open Date Picker'),
          ),
          Text('Selected date: ${formattedDate()}'),
        ],
      ),
    );
  }
}
