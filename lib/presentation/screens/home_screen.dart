import 'package:flutter/material.dart';
import 'package:stable_money/core/theme.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  final List<String> _carouselImages = [
    'images/WhatsApp Image 2025-05-23 at 18.10.17_369eacb3.jpg',
    'images/WhatsApp Image 2025-05-23 at 19.06.49_3abb341d.jpg',
    'images/WhatsApp Image 2025-05-23 at 19.06.49_7c8ed6ab.jpg',
  ];

  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  final List<Map<String, dynamic>> _trendingFDItems = [
    {
      'rate': '8.75%',
      'tenure': '1 Year',
      'bankName': 'Suryoday SFB',
      'logo': Icons.account_balance,
      'label': 'Best Rate',
      'rank': 1,
      'color': Colors.purple,
    },
    {
      'rate': '8.50%',
      'tenure': '2 Years',
      'bankName': 'Ujjivan SFB',
      'logo': Icons.account_balance,
      'label': 'Senior Citizen',
      'rank': 2,
      'color': Colors.deepPurple,
    },
    {
      'rate': '8.25%',
      'tenure': '3 Years',
      'bankName': 'AU Small Finance',
      'logo': Icons.account_balance,
      'label': 'Flexible',
      'rank': 3,
      'color': Colors.indigo,
    },
    {
      'rate': '8.10%',
      'tenure': '5 Years',
      'bankName': 'Equitas SFB',
      'logo': Icons.account_balance,
      'label': 'Tax Saving',
      'rank': 4,
      'color': Colors.blue,
    },
  ];
  
  final List<Map<String, dynamic>> _fdRatesTableItems = [
    {
      'tenure': '1Y 5M',
      'returns': '8.75%',
      'bankName': 'Suryoday SFB',
      'logo': Icons.account_balance,
    },
    {
      'tenure': '2Y 0M',
      'returns': '8.50%',
      'bankName': 'Ujjivan SFB',
      'logo': Icons.account_balance,
    },
    {
      'tenure': '3Y 0M',
      'returns': '8.25%',
      'bankName': 'AU Small Finance',
      'logo': Icons.account_balance,
    },
    {
      'tenure': '5Y 0M',
      'returns': '8.10%',
      'bankName': 'Equitas SFB',
      'logo': Icons.account_balance,
    },
    {
      'tenure': '1Y 0M',
      'returns': '8.00%',
      'bankName': 'Jana SFB',
      'logo': Icons.account_balance,
    },
  ];
  
  final List<String> _whatsNewImages = [
    'images/0b2f1e6c-3b0d-4490-8f3f-c9d69bfbf1a8.jpg',
    'images/3cc01ac4-0e54-4d9c-9d60-787cc2e32d9d.jpg',
    'images/3e67f8da-5d82-49f7-806f-12db8a607ada.jpg',
    'images/6c555a1b-503c-4192-94d0-98f7df6b521b.jpg',
    'images/fccafdd2-4865-41bd-9779-b0a02f9ae11b.jpg',
  ];
  
  final List<Map<String, dynamic>> _qaItems = [
    {
      'userName': 'Rahul Sharma',
      'userLocation': 'Mumbai, Maharashtra',
      'userImage': 'images/6d7b0984-2b76-457a-a9dd-4d098f7283ae.jpg',
      'question': 'What is the minimum amount to invest in a Fixed Deposit?',
      'answer': 'Most banks allow you to open an FD with a minimum of ₹1,000. However, this can vary between banks. Small Finance Banks sometimes offer higher interest rates even for smaller deposits.',
      'isExpanded': false,
    },
    {
      'userName': 'Priya Patel',
      'userLocation': 'Ahmedabad, Gujarat',
      'userImage': 'images/6d7b0984-2b76-457a-a9dd-4d098f7283ae.jpg',
      'question': 'How do I calculate the returns on my FD investment?',
      'answer': 'You can use the formula A = P(1 + r/n)^(nt), where A is the final amount, P is the principal, r is the interest rate, n is the number of times interest is compounded per year, and t is the time period in years. Alternatively, you can use our FD calculator in the app.',
      'isExpanded': false,
    },
    {
      'userName': 'Amit Verma',
      'userLocation': 'Bangalore, Karnataka',
      'userImage': 'images/6d7b0984-2b76-457a-a9dd-4d098f7283ae.jpg',
      'question': 'Is it better to invest in a bank FD or a corporate FD?',
      'answer': 'Bank FDs are generally considered safer as they are backed by RBI regulations and deposit insurance. Corporate FDs may offer higher interest rates but come with higher risk. Your choice should depend on your risk appetite and financial goals.',
      'isExpanded': false,
    },
  ];
  
  int _currentTrendingFDIndex = 0;
  final PageController _trendingFDPageController = PageController(viewportFraction: 0.85);
  
  final List<Map<String, dynamic>> _suryodayFDItems = [
    {
      'title': 'Best long term FD',
      'rate': '9.10%',
      'tenure': '5Y',
      'isNew': false,
    },
    {
      'title': 'Popular medium term FD',
      'rate': '8.75%',
      'tenure': '2Y',
      'isNew': false,
    },
    {
      'title': 'Invest monthly with RD',
      'rate': '8.90%',
      'tenure': '3Y',
      'isNew': true,
    },
    {
      'title': 'Senior Citizen Special FD',
      'rate': '9.25%',
      'tenure': '3Y',
      'isNew': true,
    },
  ];
  
  int _currentSuryodayFDIndex = 0;
  PageController _suryodayFDPageController = PageController(viewportFraction: 0.8);
  
  final List<Map<String, dynamic>> _fdItems = [
    {
      'name': 'Orion Bank',
      'logo': Icons.account_balance,
      'rate': '8.25%',
      'color': Color(0xFF9C27B0), // Purple
    },
    {
      'name': 'Axis Bank',
      'logo': Icons.account_balance,
      'rate': '8.10%',
      'color': Color(0xFF2196F3), // Blue
    },
    {
      'name': 'HDFC Bank',
      'logo': Icons.account_balance,
      'rate': '7.95%',
      'color': Color(0xFF4CAF50), // Green
    },
    {
      'name': 'ICICI Bank',
      'logo': Icons.account_balance,
      'rate': '8.15%',
      'color': Color(0xFFFF9800), // Orange
    },
    {
      'name': 'SBI Bank',
      'logo': Icons.account_balance,
      'rate': '7.90%',
      'color': Color(0xFFE91E63), // Pink
    },
    {
      'name': 'Kotak Bank',
      'logo': Icons.account_balance,
      'rate': '8.05%',
      'color': Color(0xFF009688), // Teal
    },
  ];
  
  int _selectedFDIndex = 0;
  PageController _fdPageController = PageController(viewportFraction: 0.4);
  
  final List<Map<String, dynamic>> _newBankItems = [
    {
      'name': 'Orion Finance',
      'logo': Icons.auto_awesome,
      'feature': '⚡ Instant Withdrawal',
      'rate': 'Up to 8.70% p.a',
      'color': Color(0xFF9C27B0), // Purple
    },
    {
      'name': 'Crescent Bank',
      'logo': Icons.nightlight_round,
      'feature': 'Secure FD',
      'rate': 'Up to 8.95% p.a',
      'color': Color(0xFF7986CB), // Indigo
    },
    {
      'name': 'Apex Small Finance',
      'logo': Icons.architecture,
      'feature': 'Monthly Payouts',
      'rate': 'Up to 9.20% p.a',
      'color': Color(0xFF26A69A), // Teal
    },
    {
      'name': 'Lumina FinBank',
      'logo': Icons.lightbulb,
      'feature': 'Tax-Free',
      'rate': 'Up to 8.65% p.a',
      'color': Color(0xFFFFB74D), // Amber
    },
    {
      'name': 'Terra MicroFinance',
      'logo': Icons.public,
      'feature': 'Recurring Deposit',
      'rate': 'Up to 9.10% p.a',
      'color': Color(0xFF66BB6A), // Light Green
    },
    {
      'name': 'Vistara Small Bank',
      'logo': Icons.flight_takeoff,
      'feature': '⚡ Instant Withdrawal',
      'rate': 'Up to 8.85% p.a',
      'color': Color(0xFFE57373), // Light Red
    },
    {
      'name': 'Equinox Finserv',
      'logo': Icons.balance,
      'feature': 'Secure FD',
      'rate': 'Up to 9.05% p.a',
      'color': Color(0xFF42A5F5), // Light Blue
    },
  ];
  
  final List<Map<String, dynamic>> _allBankItems = [
    {
      'name': 'Nexus Small Finance Bank',
      'logo': Icons.account_balance,
      'feature': 'RD Available',
      'rate': 'Up to 8.85% p.a',
      'color': Color(0xFF6A5ACD), // SlateBlue
    },
    {
      'name': 'Zenith Finance',
      'logo': Icons.account_balance_wallet,
      'feature': '⚡ Instant Withdrawal',
      'rate': 'Up to 8.50% p.a',
      'color': Color(0xFF4169E1), // RoyalBlue
    },
    {
      'name': 'BrightPay Bank',
      'logo': Icons.brightness_7,
      'feature': 'High Interest FD',
      'rate': 'Up to 9.10% p.a',
      'color': Color(0xFF9370DB), // MediumPurple
    },
    {
      'name': 'Coral Finance',
      'logo': Icons.monetization_on,
      'feature': 'Tax Saving',
      'rate': 'Up to 8.75% p.a',
      'color': Color(0xFFFF6B8B), // Pink
    },
    {
      'name': 'Spark Small Bank',
      'logo': Icons.flash_on,
      'feature': 'Low Minimum Deposit',
      'rate': 'Up to 8.90% p.a',
      'color': Color(0xFF00CED1), // DarkTurquoise
    },
    {
      'name': 'Unity Micro Bank',
      'logo': Icons.group,
      'feature': 'RD Available',
      'rate': 'Up to 8.60% p.a',
      'color': Color(0xFF20B2AA), // LightSeaGreen
    },
    {
      'name': 'Nova Finserv',
      'logo': Icons.star,
      'feature': '⚡ Instant Withdrawal',
      'rate': 'Up to 9.00% p.a',
      'color': Color(0xFF8A2BE2), // BlueViolet
    },
  ];
  
  final List<Map<String, dynamic>> _bankItems = [
    {
      'name': 'Shivalik SF Bank',
      'logo': Icons.account_balance,
      'feature': 'RD AVAILABLE',
      'rate': 'up to 8.80% p.a',
      'color': Color(0xFF4CAF50), // Green
    },
    {
      'name': 'Utkarsh SF Bank',
      'logo': Icons.account_balance,
      'feature': '⚡ Instant withdrawal',
      'rate': 'up to 8.50% p.a',
      'color': Color(0xFF2196F3), // Blue
    },
    {
      'name': 'slice SF Bank',
      'logo': Icons.account_balance,
      'feature': 'RD AVAILABLE',
      'rate': 'up to 9.00% p.a',
      'color': Color(0xFFF44336), // Red
    },
    {
      'name': 'Suryoday SF Bank',
      'logo': Icons.account_balance,
      'feature': '⚡ Instant withdrawal',
      'rate': 'up to 8.75% p.a',
      'color': Color(0xFFFF9800), // Orange
    },
  ];
  
  final List<Map<String, dynamic>> _featureItems = [
    {
      'icon': Icons.account_balance_outlined,
      'text': 'Up to ₹5L DICGC',
    },
    {
      'icon': Icons.trending_up_outlined,
      'text': 'Long term',
    },
    {
      'icon': Icons.volunteer_activism_outlined,
      'text': 'Regular income',
    },
    {
      'icon': Icons.percent_outlined,
      'text': 'High returns',
    },
    {
      'icon': Icons.bolt_outlined,
      'text': 'Withdraw instantly',
    },
    {
      'icon': Icons.calendar_today_outlined,
      'text': 'Recurring deposits',
    },
    {
      'icon': Icons.credit_card_outlined,
      'text': 'Secured card',
      'isNew': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
    
    // Start auto-sliding for image carousel
    _startAutoSlide();
    
    // Start auto-sliding for FD cards
    _startFDAutoSlide();
    
    // Start auto-sliding for Suryoday FD cards
    _startSuryodayFDAutoSlide();
    
    // Start auto-sliding for Trending FD cards
    _startTrendingFDAutoSlide();
  }
  
  void _startTrendingFDAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_trendingFDPageController.hasClients) {
        if (_currentTrendingFDIndex < _trendingFDItems.length - 1) {
          _currentTrendingFDIndex++;
        } else {
          _currentTrendingFDIndex = 0;
        }
        
        _trendingFDPageController.animateToPage(
          _currentTrendingFDIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  
  void _startSuryodayFDAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_suryodayFDPageController.hasClients) {
        if (_currentSuryodayFDIndex < _suryodayFDItems.length - 1) {
          _currentSuryodayFDIndex++;
        } else {
          _currentSuryodayFDIndex = 0;
        }
        
        _suryodayFDPageController.animateToPage(
          _currentSuryodayFDIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  
  void _startFDAutoSlide() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_fdPageController.hasClients) {
        if (_selectedFDIndex < _fdItems.length - 1) {
          _selectedFDIndex++;
        } else {
          _selectedFDIndex = 0;
        }
        
        _fdPageController.animateToPage(
          _selectedFDIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  
  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _carouselImages.length - 1) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildImageCarousel(),
              _buildFeatureSection(),
              _buildPopularBanksSection(),
              _buildAllBanksSection(),
              _buildNewlyAddedBanksSection(),
              _buildFindBestFDSection(),
              _buildSuryodayFDSection(),
              _buildTrendingFDsSection(),
              _buildFDRatesTableSection(),
              _buildWhatsNewSection(),
              _buildQuestionsAnswersSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textSecondaryColor,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Invest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stable Money',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: AppTheme.primaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.55,
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          child: PageView.builder(
            controller: _pageController,
            itemCount: _carouselImages.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      _carouselImages[index],
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      bottom: 5,
                      child: Container(
                        width: 280,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _carouselImages.length,
            (index) => Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? AppTheme.primaryColor
                    : Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Features',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppTheme.highlightColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: _featureItems.length,
            itemBuilder: (context, index) {
              return _buildFeatureCard(
                _featureItems[index]['icon'],
                _featureItems[index]['text'],
                _featureItems[index]['isNew'] == true,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFeatureCard(IconData icon, String text, bool isNew) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Handle card tap
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        icon,
                        color: AppTheme.textPrimaryColor,
                        size: 24,
                      ),
                    ),
                    if (isNew)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 36,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.textPrimaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularBanksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Banks',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppTheme.highlightColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: _bankItems.length,
            itemBuilder: (context, index) {
              return _buildColorfulBankCard(
                _bankItems[index]['name'],
                _bankItems[index]['logo'],
                _bankItems[index]['feature'],
                _bankItems[index]['rate'],
                _bankItems[index]['color'],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _bankItems.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0
                      ? AppTheme.primaryColor
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildAllBanksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Banks and NBFCs',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppTheme.highlightColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: _allBankItems.length,
            itemBuilder: (context, index) {
              return _buildColorfulBankCard(
                _allBankItems[index]['name'],
                _allBankItems[index]['logo'],
                _allBankItems[index]['feature'],
                _allBankItems[index]['rate'],
                _allBankItems[index]['color'],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _allBankItems.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0
                      ? AppTheme.primaryColor
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
  
  Widget _buildColorfulBankCard(String name, IconData logo, String feature, String rate, Color color) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle bank card tap
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        logo,
                        color: color,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppTheme.textPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    feature,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  rate,
                  style: TextStyle(
                    color: AppTheme.textPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Know more',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // The _buildBankCard method has been removed as we're now using _buildColorfulBankCard for both bank sections
  
  Widget _buildTrendingFDsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple[50]!, Colors.white],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Text(
              'Trending FDs for you',
              style: TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 160, // Match height with Find best FD section
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemExtent: 120, // Fixed width for each card to match Find best FD
              physics: const BouncingScrollPhysics(),
              itemCount: _trendingFDItems.length,
              itemBuilder: (context, index) {
                return _buildTrendingFDCard(
                  _trendingFDItems[index]['rate'],
                  _trendingFDItems[index]['tenure'],
                  _trendingFDItems[index]['bankName'],
                  _trendingFDItems[index]['logo'],
                  _trendingFDItems[index]['label'],
                  _trendingFDItems[index]['rank'],
                  _trendingFDItems[index]['color'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _trendingFDItems.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentTrendingFDIndex == index
                        ? Colors.purple[700]
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFDRatesTableSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'FD Rates Comparison',
              style: TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'TENURE',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'RETURNS',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'BANK',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _fdRatesTableItems.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey[200],
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    // Tenure column
                    Expanded(
                      flex: 2,
                      child: Text(
                        _fdRatesTableItems[index]['tenure'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Returns column
                    Expanded(
                      flex: 2,
                      child: RichText(
                        text: TextSpan(
                          text: _fdRatesTableItems[index]['returns'],
                          style: TextStyle(
                            color: Colors.purple[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Bank column
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _fdRatesTableItems[index]['logo'],
                              color: Colors.purple[700],
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _fdRatesTableItems[index]['bankName'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.purple[700]!, Colors.purple[500]!],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Compare All FD Rates',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildWhatsNewSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Text(
              'Know what\'s new',
              style: TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 400,  // Increased height for full-size images
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _whatsNewImages.length,
              itemBuilder: (context, index) {
                return _buildWhatsNewCard(_whatsNewImages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildQuestionsAnswersSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Text(
              'Questions & Answers',
              style: TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _qaItems.length,
            itemBuilder: (context, index) {
              return _buildQACard(
                _qaItems[index]['userName'],
                _qaItems[index]['userLocation'],
                _qaItems[index]['userImage'],
                _qaItems[index]['question'],
                _qaItems[index]['answer'],
                index,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  // Handle view all questions
                },
                child: Text(
                  'View all questions',
                  style: TextStyle(
                    color: Colors.purple[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildQACard(String userName, String userLocation, String userImage, String question, String answer, int index) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(userImage),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            userLocation,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    setState(() {
                      _qaItems[index]['isExpanded'] = !_qaItems[index]['isExpanded'];
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (_qaItems[index]['isExpanded']) ...[  
                              const SizedBox(height: 8),
                              Text(
                                answer,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Icon(
                        _qaItems[index]['isExpanded'] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  Widget _buildWhatsNewCard(String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width,  // Full screen width
      margin: const EdgeInsets.only(right: 0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,  // Changed to contain to show full image
        height: 300,  // Fixed height to match container
        width: double.infinity,
      ),
    );
  }
  
  Widget _buildTrendingFDCard(String rate, String tenure, String bankName, IconData logo, String label, int rank, Color color) {
    return Container(
      width: 120,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.8),
            color.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background rank number
          Positioned(
            right: 20,
            bottom: 10,
            child: Text(
              rank.toString(),
              style: TextStyle(
                color: Colors.white.withOpacity(0.2),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Card content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Interest rate
                Text(
                  rate,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Tenure
                Text(
                  tenure,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                // Label
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                // Bank info
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        logo,
                        color: color,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        bankName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSuryodayFDSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue[50]!, Colors.white],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(text: 'Best '),
                  TextSpan(
                    text: 'long-term FD',
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                  TextSpan(text: ' rate bank with instant withdrawal'),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              'images/WhatsApp Image 2025-05-24 at 02.31.40_14a7bc5a.jpg',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 160, // Decreased height to match smaller cards
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemExtent: 120, // Fixed width for each card
              physics: const BouncingScrollPhysics(),
              itemCount: _suryodayFDItems.length,
              itemBuilder: (context, index) {
                return _buildSuryodayFDCard(
                  _suryodayFDItems[index]['title'],
                  _suryodayFDItems[index]['rate'],
                  _suryodayFDItems[index]['tenure'],
                  _suryodayFDItems[index]['isNew'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _suryodayFDItems.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSuryodayFDIndex == index
                        ? Colors.blue[700]
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSuryodayFDCard(String title, String rate, String tenure, bool isNew) {
    // Generate a color based on the title
    Color cardColor = isNew ? Colors.purple : Colors.blue[700]!;
    
    return Container(
      width: 120,
      height: 140, // Decreased height as requested
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            isNew ? Colors.purple[50]! : Colors.blue[50]!,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: cardColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle card tap
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.textPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isNew)
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.purple[800],
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  rate,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.2,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tenure,
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: cardColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_outward,
                        color: cardColor,
                        size: 16,
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
  
  Widget _buildFindBestFDSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find best FD',
            style: TextStyle(
              color: AppTheme.textPrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Find the right FD by answering 3 simple questions',
            style: TextStyle(
              color: AppTheme.textSecondaryColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle button tap
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Answer now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,  // Adjusted to match card height
            child: PageView.builder(
              controller: _fdPageController,
              scrollDirection: Axis.horizontal,
              itemCount: _fdItems.length,
              onPageChanged: (index) {
                setState(() {
                  _selectedFDIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildFDCard(
                  _fdItems[index]['name'],
                  _fdItems[index]['logo'],
                  _fdItems[index]['rate'],
                  _fdItems[index]['color'],
                  index == _selectedFDIndex,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _fdItems.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _selectedFDIndex == index
                        ? _fdItems[_selectedFDIndex]['color']
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFDCard(String name, IconData logo, String rate, Color color, bool selected) {
    return Container(
      width: 150,
      height: 160,  // Reduced height to fix overflow issues
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: selected ? color.withOpacity(0.3) : Colors.grey.withOpacity(0.1),
            spreadRadius: selected ? 2 : 1,
            blurRadius: selected ? 8 : 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: selected
            ? Border.all(color: color, width: 2)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle card tap
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        logo,
                        color: color,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8), // Reduced spacing
                Text(
                  name,
                  style: TextStyle(
                    color: AppTheme.textPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle potential text overflow
                ),
                const SizedBox(height: 2), // Reduced spacing
                Text(
                  'RBI Regulated',
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                Text(
                  rate,
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildNewlyAddedBanksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Newly Added Banks',
                style: TextStyle(
                  color: AppTheme.textPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: AppTheme.highlightColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: _newBankItems.length,
            itemBuilder: (context, index) {
              return _buildColorfulBankCard(
                _newBankItems[index]['name'],
                _newBankItems[index]['logo'],
                _newBankItems[index]['feature'],
                _newBankItems[index]['rate'],
                _newBankItems[index]['color'],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              ...List.generate(
                _newBankItems.length > 5 ? 5 : _newBankItems.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? AppTheme.primaryColor
                        : Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
