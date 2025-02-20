import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item["name"] ?? "Item Details", style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  item["image"] ?? "assets/images/placeholder.jpg",
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(item["name"] ?? "No name available", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(item["description"] ?? "No description available", style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              (item["price"] is num) 
                ? "\$${(item["price"] as num).toStringAsFixed(2)}" 
                : "Price not available",
              style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Details:", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(item["details"] ?? "No additional details", style: const TextStyle(fontSize: 14, color: Colors.black87)),
            const SizedBox(height: 12),
            if (item.containsKey("options"))
              Wrap(
                spacing: 8,
                children: item["options"]?.map<Widget>((option) => Chip(
                  label: Text(option, style: const TextStyle(fontSize: 14)),
                  backgroundColor: Colors.blue.shade50,
                )).toList() ?? [],
              ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                child: const Text("Add to Cart", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
