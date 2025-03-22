import 'package:flutter/material.dart';

class ExplorePane extends StatelessWidget {
  const ExplorePane({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Sample Category Tags
    final categories = [
      "Popular",
      "All",
      "Finance",
      "Web3",
      "Social Media",
      "Business",
      "More",
    ];

    // Sample Template Data
    final templates = [
      {"name": "OpenAI", "description": "description"},
      {"name": "Stripe", "description": "description"},
      {"name": "Facebook", "description": "description"},
      {"name": "Facebook", "description": "description"},
      {"name": "Facebook", "description": "description"},
      {"name": "Facebook", "description": "description"},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "API Templates",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),

          Text(
            "A curated library of pre-configured API request templates for quick import and testing.",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implementing Search Logic
                },
                child: const Text("Search"),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Categorized Tags
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return FilterChip(
                  label: Text(categories[index]),
                  onSelected: (selected) {
                    // TODO: Implementing Filtering Logic
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Grid List
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: templates.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns per line
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 3 / 4, // Adjusting the card aspect ratio
            ),
            itemBuilder: (context, index) {
              final template = templates[index];
              return _TemplateCard(
                name: template["name"] ?? "",
                description: template["description"] ?? "",
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Example of a template card
class _TemplateCard extends StatelessWidget {
  final String name;
  final String description;

  const _TemplateCard({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder image
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.image_outlined,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Template name
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // Template description
            Text(
              description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
