import 'package:flutter/material.dart';

import '../../domain/entites/stock.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Stock> _searchResults = [];

  final List<Stock> _allStocks = [
    Stock(
      symbol: 'RELIANCE',
      name: 'Reliance Industries',
      exchange: 'NSE',
      price: 2745.60,
      change: 32.80,
      changePercentage: 1.21,
      isUp: true,
    ),
    Stock(
      symbol: 'TATASTEEL',
      name: 'Tata Steel',
      exchange: 'NSE',
      price: 156.30,
      change: -2.15,
      changePercentage: -1.36,
      isUp: false,
    ),
    Stock(
      symbol: 'INFY',
      name: 'Infosys',
      exchange: 'NSE',
      price: 1435.70,
      change: 15.25,
      changePercentage: 1.07,
      isUp: true,
    ),
    Stock(
      symbol: 'HDFCBANK',
      name: 'HDFC Bank',
      exchange: 'NSE',
      price: 1678.90,
      change: 23.40,
      changePercentage: 1.41,
      isUp: true,
    ),
    Stock(
      symbol: 'SBIN',
      name: 'State Bank of India',
      exchange: 'NSE',
      price: 712.50,
      change: -8.30,
      changePercentage: -1.15,
      isUp: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults =
            _allStocks
                .where(
                  (stock) =>
                      stock.symbol.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ||
                      stock.name.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  Widget _buildFilterChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildStockItem(Stock stock) {
    final isPositive = stock.change >= 0;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      title: Text(
        stock.symbol,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        stock.exchange,
        style: TextStyle(color: Colors.grey.shade400),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '₹${stock.price.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '${isPositive ? '+' : ''}${stock.change.toStringAsFixed(2)} (${isPositive ? '+' : ''}${stock.changePercentage.toStringAsFixed(2)}%)',
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          controller: _searchController,
          focusNode: _focusNode,
          style: const TextStyle(color: Colors.white),
          onChanged: _performSearch,
          decoration: InputDecoration(
            hintText: 'Search & Add',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon:
                _searchController.text.isNotEmpty
                    ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        _performSearch('');
                      },
                    )
                    : null,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.grid_view, color: const Color(0xFF00DD8D)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tune, color: const Color(0xFF00DD8D)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildFilterChip('Stocks'),
                const SizedBox(width: 12),
                _buildFilterChip('ETFs'),
                const SizedBox(width: 12),
                _buildFilterChip('Futures'),
              ],
            ),
          ),
          Expanded(
            child:
                _searchResults.isEmpty && _searchController.text.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 80,
                            color: Colors.grey.shade700,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Search for stocks, indices or ETFs',
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    )
                    : _searchResults.isEmpty
                    ? Center(
                      child: Text(
                        'No results found for "${_searchController.text}"',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    )
                    : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return _buildStockItem(_searchResults[index]);
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
