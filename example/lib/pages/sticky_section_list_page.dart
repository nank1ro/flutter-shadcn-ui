import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Sample product data for the sticky section list demo.
class Product {
  const Product({
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
  });

  final String name;
  final String price;
  final String category;
  final String imageUrl;
  final String description;
}

const demoProducts = [
  Product(
    name: 'Wireless Headphones',
    price: '\$79.99',
    category: 'Audio',
    imageUrl: 'https://picsum.photos/seed/audio1/400/300',
    description: 'Premium sound quality with noise cancellation',
  ),
  Product(
    name: 'Bluetooth Speaker',
    price: '\$49.99',
    category: 'Audio',
    imageUrl: 'https://picsum.photos/seed/audio2/400/300',
    description: 'Portable speaker with 12-hour battery life',
  ),
  Product(
    name: 'Noise-Cancelling Buds',
    price: '\$129.99',
    category: 'Audio',
    imageUrl: 'https://picsum.photos/seed/audio3/400/300',
    description: 'Active noise cancellation for immersive sound',
  ),
  Product(
    name: 'Studio Monitor',
    price: '\$199.99',
    category: 'Audio',
    imageUrl: 'https://picsum.photos/seed/audio4/400/300',
    description: 'Professional-grade sound monitoring',
  ),
  Product(
    name: 'USB-C Cable 2m',
    price: '\$12.99',
    category: 'Accessories',
    imageUrl: 'https://picsum.photos/seed/acc1/400/300',
    description: 'Fast charging and data transfer',
  ),
  Product(
    name: 'Phone Case',
    price: '\$24.99',
    category: 'Accessories',
    imageUrl: 'https://picsum.photos/seed/acc2/400/300',
    description: 'Drop protection with sleek design',
  ),
  Product(
    name: 'Screen Protector',
    price: '\$9.99',
    category: 'Accessories',
    imageUrl: 'https://picsum.photos/seed/acc3/400/300',
    description: 'Tempered glass for ultimate protection',
  ),
  Product(
    name: 'Wireless Charger',
    price: '\$34.99',
    category: 'Accessories',
    imageUrl: 'https://picsum.photos/seed/acc4/400/300',
    description: '15W fast wireless charging pad',
  ),
  Product(
    name: 'Car Mount',
    price: '\$19.99',
    category: 'Accessories',
    imageUrl: 'https://picsum.photos/seed/acc5/400/300',
    description: 'Magnetic phone holder for your car',
  ),
  Product(
    name: 'Mechanical Keyboard',
    price: '\$149.99',
    category: 'Peripherals',
    imageUrl: 'https://picsum.photos/seed/per1/400/300',
    description: 'RGB backlit with Cherry MX switches',
  ),
  Product(
    name: 'Gaming Mouse',
    price: '\$69.99',
    category: 'Peripherals',
    imageUrl: 'https://picsum.photos/seed/per2/400/300',
    description: '16000 DPI sensor with programmable buttons',
  ),
  Product(
    name: 'Webcam HD',
    price: '\$59.99',
    category: 'Peripherals',
    imageUrl: 'https://picsum.photos/seed/per3/400/300',
    description: '1080p video with auto-focus',
  ),
  Product(
    name: 'USB Hub',
    price: '\$29.99',
    category: 'Peripherals',
    imageUrl: 'https://picsum.photos/seed/per4/400/300',
    description: '7-port USB 3.0 hub with power adapter',
  ),
  Product(
    name: 'Monitor Stand',
    price: '\$89.99',
    category: 'Desk',
    imageUrl: 'https://picsum.photos/seed/desk1/400/300',
    description: 'Adjustable height and angle',
  ),
  Product(
    name: 'Desk Lamp',
    price: '\$44.99',
    category: 'Desk',
    imageUrl: 'https://picsum.photos/seed/desk2/400/300',
    description: 'LED lamp with touch controls',
  ),
  Product(
    name: 'Cable Organizer',
    price: '\$14.99',
    category: 'Desk',
    imageUrl: 'https://picsum.photos/seed/desk3/400/300',
    description: 'Keep your workspace tidy',
  ),
  Product(
    name: 'Laptop Stand',
    price: '\$54.99',
    category: 'Desk',
    imageUrl: 'https://picsum.photos/seed/desk4/400/300',
    description: 'Ergonomic aluminum stand',
  ),
  Product(
    name: 'Pen Holder',
    price: '\$8.99',
    category: 'Desk',
    imageUrl: 'https://picsum.photos/seed/desk5/400/300',
    description: 'Minimalist desk organizer',
  ),
];

/// Groups products by category and returns section data.
List<ShadListSection> get productSections {
  final grouped = <String, List<Product>>{};
  for (final p in demoProducts) {
    grouped.putIfAbsent(p.name, () => []).add(p);
  }
  return grouped.entries
      .map(
        (e) => ShadListSection(
          header: Text(e.key),
          items: e.value.map((p) => _ProductPostCard(product: p)).toList(),
        ),
      )
      .toList();
}

class StickySectionListPage extends StatelessWidget {
  const StickySectionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sticky Section List')),
      body: Center(
        child: ShadButton.outline(
          child: const Text('Open Product Feed'),
          onPressed: () => _showProductSheet(context),
        ),
      ),
    );
  }

  void _showProductSheet(BuildContext context) {
    showShadSheet(
      context: context,
      builder: (context) => ShadSheet(
        scrollable: false,
        isScrollControlled: true,
        draggable: true,
        padding: EdgeInsets.zero,
        child: ShadStickySectionList(
          sections: productSections,
        ),
      ),
    );
  }
}

/// Instagram-style product post card.
class _ProductPostCard extends StatelessWidget {
  const _ProductPostCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header (like Instagram)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: theme.colorScheme.muted,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.store,
                  color: theme.colorScheme.mutedForeground,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      product.category,
                      style: theme.textTheme.muted.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: theme.colorScheme.mutedForeground,
                size: 20,
              ),
            ],
          ),
        ),
        // Product image (like Instagram post)
        Container(
          width: double.infinity,
          height: 300,
          color: theme.colorScheme.muted.withValues(alpha: 0.3),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Placeholder for image
              Icon(
                Icons.image_outlined,
                size: 64,
                color: theme.colorScheme.mutedForeground.withValues(alpha: 0.3),
              ),
              // Image URL text (in real app, you'd use Image.network)
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Image: ${product.imageUrl.split('/').last}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Actions row (like Instagram)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: theme.colorScheme.foreground,
                size: 24,
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.chat_bubble_outline,
                color: theme.colorScheme.foreground,
                size: 24,
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.send_outlined,
                color: theme.colorScheme.foreground,
                size: 24,
              ),
              const Spacer(),
              Text(
                product.price,
                style: theme.textTheme.large.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            product.description,
            style: theme.textTheme.small,
          ),
        ),
        // Divider
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Divider(
            height: 1,
            color: theme.colorScheme.border,
          ),
        ),
      ],
    );
  }
}
