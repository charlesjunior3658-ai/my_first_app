import 'package:material_ui/material_ui.dart';

void main() => runApp(const CardApp());

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const CourseList(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.phone,
  });

  final String name;
  final String role;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(radius: 32, child: Icon(Icons.person, size: 32)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textTheme.titleLarge),
                  Text(role),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16),
                      const SizedBox(width: 4),
                      Text(phone),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Course {
  const Course(this.name, this.detail);

  final String name;
  final String detail;
}

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    const courses = [
      Course('Database Management', 'Level 3'),
      Course('CCNA 1', 'Networking'),
      Course('Cybersecurity', 'Layers 1 and 2'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('My courses')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final c = courses[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.school)),
              title: Text(c.name),
              subtitle: Text(c.detail),
            ),
          );
        },
      ),
    );
  }
}