import 'package:flutter/material.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Records')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _RecordTile(
            icon: Icons.medical_information_outlined,
            title: 'Medical history',
          ),
          SizedBox(height: 12),
          _RecordTile(icon: Icons.description_outlined, title: 'Documents'),
          SizedBox(height: 12),
          _RecordTile(icon: Icons.monitor_weight_outlined, title: 'Growth'),
          SizedBox(height: 12),
          _RecordTile(icon: Icons.receipt_long_outlined, title: 'Expenses'),
        ],
      ),
    );
  }
}

class _RecordTile extends StatelessWidget {
  const _RecordTile({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: CircleAvatar(child: Icon(icon)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: const Text('Ready for the next feature phase'),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
