import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Filter{
  String label;
  bool isSelected;

  Filter(this.label, this.isSelected);
}

class ParkingsFilterView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _sliderValue = useState(0.0);
    final _minPrice = useState(0);
    final _maxPrice = useState(10);
    final selectedFilters = useState([]);
    final _city = useState('Sofia');
    final _isBusy = useState(false);

    final filters = ['CCTV', 'Car wash', 'Snacks & Food', 'Free transfer', 'EV Chargers', 'English speaking'];

    return Scaffold(
        appBar: AppBar(
          title: Text('Filter parkings'),
        ),
        body: !_isBusy.value ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('City', style: TextStyle(fontSize: 25)),
              InputDecorator(decoration: InputDecoration(border: OutlineInputBorder()),
              child: DropdownButton<String>(isExpanded:true,
                isDense: true,
                value: _city.value,
                items: [
                  DropdownMenuItem<String>(child: Text('Sofia'), value: 'Sofia',),
                  DropdownMenuItem<String>(child: Text('Moscow'), value: 'Moscow'),
                  DropdownMenuItem<String>(child: Text('Vienna'), value: 'Viewna'),
                  DropdownMenuItem<String>(child: Text('London'), value: 'London'),
                  DropdownMenuItem<String>(child: Text('New York'), value: 'New York'),
                ], onChanged: (Object? value) { _city.value = value.toString(); },

              )),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Min price', style: TextStyle(fontSize: 18),),
                        DropdownMenu(
                          initialSelection: _minPrice.value,
                          textStyle: TextStyle(fontSize: 20),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<int>(
                                value: 0,
                                label: '0 €',
                              ),
                              DropdownMenuEntry<int>(
                                value: 5,
                                label: '5 €',
                              ),
                              DropdownMenuEntry<int>(
                                value: 10,
                                label: '10 €',
                              ),
                              DropdownMenuEntry<int>(
                                value: 15,
                                label: '15 €',
                              ),
                            ],
                            onSelected: (value) {
                              _minPrice.value = value as int;
                            })
                      ],
                    ),
                    Column(
                      children: [
                        Text('Max price', style: TextStyle(fontSize: 18),),
                        DropdownMenu(
                            initialSelection: _maxPrice.value,
                            textStyle: TextStyle(fontSize: 20),
                            dropdownMenuEntries: [
                              DropdownMenuEntry<int>(
                                value: 10,
                                label: '10 €',
                              ),
                              DropdownMenuEntry<int>(
                                value: 15,
                                label: '15 €',
                              ),
                              DropdownMenuEntry<int>(
                                value: 20,
                                label: '20 €',
                              ),
                              DropdownMenuEntry<int>(
                                value: 25,
                                label: '25 €',
                              ),
                            ],
                            onSelected: (value) {
                              _maxPrice.value = value as int;
                            })
                      ],
                    )
                  ],
                ),
              ),
              // Wrap(
              //   spacing: 8,
              //   children:
              //     filters.map((filter) {
              //       return FilterChip(
              //         selected: selectedFilters.value.contains(filter),
              //         label: Text(filter), onSelected: (bool value) {
              //           value ? selectedFilters.value.add(filter) : selectedFilters.value.remove(filter);
              //       },
              //       );
              //     }).toList()
              //
              // )
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Facilities', style: TextStyle(fontSize: 25),),
              ),
              Wrap(
                spacing: 5.0,
                alignment: WrapAlignment.start,
                children: filters.map((String filter) {
                  return FilterChip(
                    label: Text(filter),
                    selected: selectedFilters.value.contains(filter),
                    onSelected: (bool selected) {
                      if(selected){
                        selectedFilters.value = [...selectedFilters.value..add(filter)];
                      }else{
                        selectedFilters.value = [...selectedFilters.value..remove(filter)];
                      }
                      // final newFilter = Filter(foundFilter!.label, selected);
                      // filters.value.remove(foundFilter);
                      // filters.value.add(newFilter);
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    _isBusy.value = true;
                    await Future.delayed(Duration(seconds:1));
                    _isBusy.value = false;
                    context.pop();
                  },
                  child: const Text('Filter'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
            ],
          ),
        ) : Center(child: CircularProgressIndicator()));
  }
}
