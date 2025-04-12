import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TailorShopApp());
}

class TailorShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tailor Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1E3A8A),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF1E3A8A),
          secondary: Color(0xFF3B82F6),
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'AE'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LoginScreen(),
    );
  }
}

// 1. Authentication & Onboarding Screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                // App Logo
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: Image.asset('assets/logo.jpeg', height: 80),
                ),
                SizedBox(height: 32),
                // Welcome Text
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48),
                // Email Field
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email / Phone Number',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Password Field
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 245, 246, 247),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),
                // Skip Button
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 31, 31, 31),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Forgot Password
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFF1E3A8A)),
                  ),
                ),
                SizedBox(height: 32),
                // Language and Country Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: 'English',
                      items: ['English', 'Arabic'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                    SizedBox(width: 16),
                    DropdownButton<String>(
                      value: 'Dubai 🇦🇪',
                      items: ['Dubai 🇦🇪', 'India 🇮🇳', 'All 📊'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF1E3A8A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 2. Dashboard/Home Screen with Bottom Navigation
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    DashboardScreen(),
    CustomersScreen(),
    OrdersScreen(),
    MeasurementsScreen(),
    SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF1E3A8A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.straighten),
            label: 'Measurements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Summary',
          ),
        ],
      ),
    );
  }
}

// Dashboard Screen
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color.fromARGB(255, 95, 136, 246),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Message
            Text(
              'Welcome back, Admin!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Here\'s your shop summary',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            
            // Quick Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Customers',
                    '245',
                    Colors.blue,
                    Icons.people,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    'Orders',
                    '28',
                    Colors.orange,
                    Icons.shopping_bag,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Pending',
                    '12',
                    Colors.red,
                    Icons.pending_actions,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    'Delivered',
                    '16',
                    Colors.green,
                    Icons.check_circle,
                  ),
                ),
              ],
            ),
            
            // Recent Orders
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('View All'),
                ),
              ],
            ),
            SizedBox(height: 8),
            _buildOrderItem('Ahmed Mohammed', '3 hours ago', 'In Progress', Colors.orange),
            _buildOrderItem('Sara Khan', '5 hours ago', 'Received', Colors.blue),
            _buildOrderItem('John Smith', '1 day ago', 'Completed', Colors.green),
            
            // Revenue Chart Placeholder
            SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Revenue Overview',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: Text('Revenue chart will appear here'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF1E3A8A),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String name, String time, String status, Color statusColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Text(
              name[0],
              style: TextStyle(
                color: Color(0xFF1E3A8A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Customers Screen
class CustomersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, ID, or phone number',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          
          // Customer List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildCustomerItem(
                  'Customer ${index + 1}',
                  '+971 5${index + 1} ${index + 1}23 ${index + 1}56',
                  'customer${index + 1}@example.com',
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCustomerScreen()),
          );
        },
        backgroundColor: Color(0xFF1E3A8A),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildCustomerItem(String name, String phone, String email) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Text(
              name[0],
              style: TextStyle(
                color: Color(0xFF1E3A8A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  phone,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Add Customer Screen
class AddCustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Customer'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            // Profile Image
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E3A8A),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            
            // Form Fields
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 32),
            
            // Save Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E3A8A),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Customer',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Orders Screen
class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Color(0xFF1E3A8A),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'Received'),
            Tab(text: 'Processing'),
            Tab(text: 'Completed'),
            Tab(text: 'Delivered'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search orders',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          
          // Order Tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrdersList('Received'),
                _buildOrdersList('Processing'),
                _buildOrdersList('Completed'),
                _buildOrdersList('Delivered'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddOrderScreen()),
          );
        },
        backgroundColor: Color(0xFF1E3A8A),
        child: Icon(Icons.add),
      ),
    );
  }
  
  Widget _buildOrdersList(String status) {
    Color statusColor;
    IconData statusIcon;
    
    switch(status) {
      case 'Received':
        statusColor = Colors.blue;
        statusIcon = Icons.receipt;
        break;
      case 'Processing':
        statusColor = Colors.orange;
        statusIcon = Icons.pending;
        break;
      case 'Completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'Delivered':
        statusColor = Colors.purple;
        statusIcon = Icons.delivery_dining;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildOrderItem(
          'Order #${1000 + index}',
          'Customer ${index + 1}',
          'Due date: ${index + 10}/04/2025',
          status,
          statusColor,
          statusIcon,
        );
      },
    );
  }
  
  Widget _buildOrderItem(String orderNumber, String customerName, String dueDate, String status, Color statusColor, IconData statusIcon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              orderNumber,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(customerName),
            trailing: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(statusIcon, size: 16, color: statusColor),
                  SizedBox(width: 4),
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dueDate),
                Text(
                  'AED 350',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Add Order Screen
class AddOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Order'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Customer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('Select a customer'),
                  value: null,
                  items: [
                    'Customer 1',
                    'Customer 2',
                    'Customer 3',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            SizedBox(height: 24),
            
            Text(
              'Garment Type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildGarmentChip('Shirt', true),
                _buildGarmentChip('Pants', false),
                _buildGarmentChip('Suit', false),
                _buildGarmentChip('Dress', false),
                _buildGarmentChip('Custom', false),
              ],
            ),
            SizedBox(height: 24),
            
            Text(
              'Due Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(Duration(days: 7)),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select due date'),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            
            Text(
              'Attach References',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  Icons.add_photo_alternate,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 24),
            
            Text(
              'Payment Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Total Amount',
                prefixText: 'AED ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Advance Payment',
                prefixText: 'AED ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            
            Text(
              'Notes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add any special instructions or notes',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 32),
            
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E3A8A),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Create Order',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGarmentChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {},
      selectedColor: Color(0xFF1E3A8A),
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}

// Add Measurements Screen
class MeasurementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measurements'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Measurements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            
            _buildMeasurementSection('Top', [
              'Chest',
              'Waist',
              'Hip',
              'Shoulder',
              'Sleeve Length',
              'Neck',
            ]),
            SizedBox(height: 24),
            
            _buildMeasurementSection('Bottom', [
              'Waist',
              'Hip',
              'Inseam',
              'Outseam',
              'Thigh',
              'Knee',
            ]),
            SizedBox(height: 24),
            
            _buildMeasurementSection('Special', [
              'Custom 1',
              'Custom 2',
              'Custom 3',
            ]),
            SizedBox(height: 32),
            
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E3A8A),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Measurements',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementSection(String title, List<String> measurements) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        ...measurements.map((measurement) => Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(measurement),
              ),
              Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'cm',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}

// Summary Screen
class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
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
            SizedBox(height: 24),
            
            _buildSummaryCard(
              'This Week',
              [
                _buildSummaryItem('Total Orders', '45', Colors.blue),
                _buildSummaryItem('Revenue', 'AED 12,500', Colors.green),
                _buildSummaryItem('New Customers', '8', Colors.purple),
              ],
            ),
            SizedBox(height: 24),
            
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
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

// Settings Screen
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF1E3A8A),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildSettingsSection('Account', [
            _buildSettingsItem('Profile', Icons.person),
            _buildSettingsItem('Notifications', Icons.notifications),
            _buildSettingsItem('Security', Icons.security),
          ]),
          SizedBox(height: 24),
          
          _buildSettingsSection('Business', [
            _buildSettingsItem('Shop Details', Icons.store),
            _buildSettingsItem('Working Hours', Icons.access_time),
            _buildSettingsItem('Pricing', Icons.attach_money),
          ]),
          SizedBox(height: 24),
          
          _buildSettingsSection('App', [
            _buildSettingsItem('Language', Icons.language),
            _buildSettingsItem('Theme', Icons.palette),
            _buildSettingsItem('About', Icons.info),
          ]),
          SizedBox(height: 32),
          
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        ...items,
      ],
    );
  }

  Widget _buildSettingsItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
