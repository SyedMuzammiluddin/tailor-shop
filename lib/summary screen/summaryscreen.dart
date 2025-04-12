import 'package:flutter/material.dart';
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryCard(
              'Today\'s Summary',
              [
                _buildSummaryItem('Orders', '12', Colors.blue),
                _buildSummaryItem('Completed', '8', Colors.green),
                _buildSummaryItem('Pending', '4', Colors.orange),
              ],
            ),
            const SizedBox(height: 24),
            _buildSummaryCard(
              'This Week',
              [
                _buildSummaryItem('Total Orders', '45', Colors.blue),
                _buildSummaryItem('Revenue', 'AED 12,500', Colors.green),
                _buildSummaryItem('New Customers', '8', Colors.purple),
              ],
            ),
            const SizedBox(height: 24),
            _buildSummaryCard(
              'This Month',
              [
                _buildSummaryItem('Total Orders', '180', Colors.blue),
                _buildSummaryItem('Revenue', 'AED 50,000', Colors.green),
                _buildSummaryItem('New Customers', '32', Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, List<Widget> items) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}