import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betting App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '💰 600',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: _currentIndex == 0 ? HomeBody(onNavigate: (index) => setState(() => _currentIndex = index)) : DepositScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Deposit'),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final Function(int) onNavigate;
  HomeBody({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ActionBtn(icon: '➕', label: 'Add Coins', onTap: () => onNavigate(1)),
            ActionBtn(icon: '🏦', label: 'Withdrawal', onTap: () {}),
            ActionBtn(icon: '⭐', label: 'Gali', onTap: () {}),
            ActionBtn(icon: '💬', label: 'WhatsApp', onTap: () {}),
          ],
        ),
        SizedBox(height: 20),
        Text('Market Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        MarketCard(name: 'MADHUR NIGHT', time: 'Open: 08:20 PM', status: 'Market Close', color: Colors.red),
        MarketCard(name: 'MATKA NIGHT', time: 'Open: 08:25 PM', status: 'Market Running', color: Colors.green),
      ],
    );
  }
}

class ActionBtn extends StatelessWidget {
  final String icon, label;
  final VoidCallback onTap;
  ActionBtn({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Text(icon, style: TextStyle(fontSize: 22)),
            SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class MarketCard extends StatelessWidget {
  final String name, time, status;
  final Color color;
  MarketCard({required this.name, required this.time, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 4),
              Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          Text(status == 'Market Running' ? '🔓' : '🔒', style: TextStyle(fontSize: 22))
        ],
      ),
    );
  }
}

class DepositScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Points', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.indigo.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pay to Official UPI ID:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(height: 4),
                Text('sainath8020@indus', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
              ],
            ),
          ),
          SizedBox(height: 15),
          TextField(keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Enter Amount', border: OutlineInputBorder())),
          SizedBox(height: 12),
          TextField(decoration: InputDecoration(labelText: 'Enter 12-Digit UTR / Transaction ID', border: OutlineInputBorder())),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deposit Request Submitted!'))),
              child: Text('Verify & Add Money', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
