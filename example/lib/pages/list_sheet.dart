import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Sample product data.
class Product {
  const Product({
    required this.name,
    required this.price,
    required this.category,
  });

  final String name;
  final String price;
  final String category;
}

const products = [
  Product(name: 'Wireless Headphones', price: '\$79.99', category: 'Audio'),
  Product(name: 'Bluetooth Speaker', price: '\$49.99', category: 'Audio'),
  Product(name: 'Noise-Cancelling Buds', price: '\$129.99', category: 'Audio'),
  Product(name: 'USB-C Cable 2m', price: '\$12.99', category: 'Accessories'),
  Product(name: 'Phone Case', price: '\$24.99', category: 'Accessories'),
  Product(name: 'Screen Protector', price: '\$9.99', category: 'Accessories'),
  Product(name: 'Wireless Charger', price: '\$34.99', category: 'Accessories'),
  Product(
    name: 'Mechanical Keyboard',
    price: '\$149.99',
    category: 'Peripherals',
  ),
  Product(name: 'Gaming Mouse', price: '\$69.99', category: 'Peripherals'),
  Product(name: 'Webcam HD', price: '\$59.99', category: 'Peripherals'),
  Product(name: 'USB Hub', price: '\$29.99', category: 'Peripherals'),
  Product(name: 'Monitor Stand', price: '\$89.99', category: 'Desk'),
  Product(name: 'Desk Lamp', price: '\$44.99', category: 'Desk'),
  Product(name: 'Cable Organizer', price: '\$14.99', category: 'Desk'),
  Product(name: 'Laptop Stand', price: '\$54.99', category: 'Desk'),
  Product(name: 'Pen Holder', price: '\$8.99', category: 'Desk'),
];

/// Groups products by category and returns ordered section data.
List<({String title, List<Product> products})> get sections {
  final grouped = <String, List<Product>>{};
  for (final p in products) {
    grouped.putIfAbsent(p.category, () => []).add(p);
  }
  return grouped.entries.map((e) => (title: e.key, products: e.value)).toList();
}

class ListSheetPage extends StatelessWidget {
  const ListSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Sheet')),
      body: Center(
        child: ShadButton.outline(
          child: const Text('Open List Sheet'),
          onPressed: () => _showListSheet(context),
        ),
      ),
    );
  }

  void _showListSheet(BuildContext context) {
    showShadSheet(
      context: context,
      builder: (context) => const _ListSheetContent(),
    );
  }
}

/// The sheet content — manages its own scroll + dynamic title.
class _ListSheetContent extends StatefulWidget {
  const _ListSheetContent();

  @override
  State<_ListSheetContent> createState() => _ListSheetContentState();
}

class _ListSheetContentState extends State<_ListSheetContent> {
  late final ScrollController _scrollController;
  String _currentSection = sections.first.title;

  /// Cumulative pixel offset where each section starts.
  /// Index i = offset where section i's header begins.
  late final List<double> _sectionOffsets;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Pre-compute section start offsets.
    // Layout: for each section → header (48px) + items (72px each)
    _sectionOffsets = [];
    double offset = 0;
    for (final s in sections) {
      _sectionOffsets.add(offset);
      offset += 48; // section header
      offset += s.products.length * 72; // items
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.position.pixels;
    // Walk backwards to find the topmost section that has started
    for (var i = _sectionOffsets.length - 1; i >= 0; i--) {
      if (offset >= _sectionOffsets[i] - 1) {
        if (_currentSection != sections[i].title) {
          setState(() => _currentSection = sections[i].title);
        }
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final s = sections;

    return ShadSheet(
      // No built-in title — we render our own dynamic one.
      isScrollControlled: true,
      scrollable: false,
      draggable: true,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // ── Dynamic sticky title ──
          _SectionTitle(
            title: _currentSection,
            titleStyle: theme.textTheme.large,
          ),
          // ── Scrollable product list ──
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              itemCount: s.fold<int>(
                0,
                (sum, sec) => sum + 1 + sec.products.length,
              ),
              itemBuilder: (context, index) {
                var remaining = index;
                for (final section in s) {
                  // Section header
                  if (remaining == 0) {
                    return _SectionHeader(title: section.title);
                  }
                  remaining--;
                  // Items
                  if (remaining < section.products.length) {
                    return _ProductCard(
                      product: section.products[remaining],
                    );
                  }
                  remaining -= section.products.length;
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// The pinned title bar at the top of the sheet — updates dynamically.
class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.titleStyle,
  });

  final String title;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.border),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          title,
          key: ValueKey(title),
          style: titleStyle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

/// Inline section header inside the scrollable list.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: theme.colorScheme.muted.withValues(alpha: 0.3),
      child: Text(
        title,
        style: theme.textTheme.small.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.mutedForeground,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// A product card widget.
class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.muted,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: theme.colorScheme.mutedForeground,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: theme.textTheme.small),
                const SizedBox(height: 2),
                Text(
                  product.category,
                  style: theme.textTheme.muted,
                ),
              ],
            ),
          ),
          Text(
            product.price,
            style: theme.textTheme.small.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
