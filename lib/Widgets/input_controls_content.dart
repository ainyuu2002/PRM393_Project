import 'package:flutter/material.dart';

class InputControlsContent extends StatefulWidget {
  const InputControlsContent({super.key});

  @override
  State<InputControlsContent> createState() => _InputControlsContentState();
}

class _InputControlsContentState extends State<InputControlsContent> {
  double sliderValue = 50;
  bool switchValue = false;
  String? selectedGenre;
  DateTime? selectedDate;

  Future<void> selectDate() async {
    final DateTime? date = await showDatePicker(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Rating Slider
            const Text(
              'Rating (Slider)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            Text(
              'Current value: ${sliderValue.round()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Active Switch
            const Text(
              'Active (Switch)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Is movie active?',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Genre RadioListTile group
            const Text(
              'Genre (RadioListTile)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioGroup<String>(
              groupValue: selectedGenre,
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
              child: const Column(
                children: [
                  RadioListTile<String>(title: Text('Action'), value: 'Action'),
                  RadioListTile<String>(title: Text('Comedy'), value: 'Comedy'),
                ],
              ),
            ),
            Text(
              'Selected genre: ${selectedGenre ?? 'None'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // DatePicker Button
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: selectDate,
              icon: const Icon(Icons.calendar_month),
              label: const Text('Open Date Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
