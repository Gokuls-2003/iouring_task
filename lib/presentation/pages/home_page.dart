import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_constants.dart';
import '../bloc/nav/navigation_bloc.dart';
import '../bloc/nav/navigation_event.dart';
import '../bloc/nav/navigation_state.dart';
import 'more_page.dart';
import 'movers_page.dart';
import 'orders_page.dart';
import 'portfolio_page.dart';
import 'watchlist_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const WatchlistPage(),
      const OrdersPage(),
      const PortfolioPage(),
      const MoversPage(),
      const MorePage(),
    ];

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            backgroundColor: Colors.black,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                activeIcon: Icon(Icons.bookmark),
                label: AppConstants.watchlist,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag),
                label: AppConstants.orders,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work_outline),
                activeIcon: Icon(Icons.work),
                label: AppConstants.portfolio,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_up),
                activeIcon: Icon(Icons.trending_up),
                label: AppConstants.movers,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                activeIcon: Icon(Icons.more_horiz),
                label: AppConstants.more,
              ),
            ],
            onTap: (index) {
              context.read<NavigationBloc>().add(NavigationTabChanged(index));
            },
          ),
        );
      },
    );
  }
}
