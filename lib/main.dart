import 'package:flutter/material.dart';
import 'views/components/components_showcase.dart';

void main() {
  runApp(const ComponentsShowcaseApp());
}

class ComponentsShowcaseApp extends StatelessWidget {
  const ComponentsShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components Library Showcase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ComponentsShowcaseHome(),
    );
  }
}

class ComponentsShowcaseHome extends StatefulWidget {
  const ComponentsShowcaseHome({super.key});

  @override
  State<ComponentsShowcaseHome> createState() => _ComponentsShowcaseHomeState();
}

class _ComponentsShowcaseHomeState extends State<ComponentsShowcaseHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FBButtonShowcase(),
    const FBTextButtonShowcase(),
    const FBTextFieldShowcase(),
    const ShimmerShowcase(),
    const Placeholder(), // Para futuros widgets
  ];

  final List<String> _pageNames = [
    'FBButton',
    'FBTextButton',
    'FBTextField',
    'Shimmer',
    'Outros',
  ];

  final List<IconData> _pageIcons = [
    Icons.touch_app,
    Icons.text_fields,
    Icons.input,
    Icons.auto_awesome,
    Icons.widgets,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Components Library Showcase'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: List.generate(_pageNames.length, (index) {
              return NavigationRailDestination(
                icon: Icon(_pageIcons[index]),
                selectedIcon: Icon(_pageIcons[index]),
                label: Text(_pageNames[index]),
              );
            }),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
