import 'package:stable_money/domain/models/investment_item.dart';

class InvestmentRepository {
  // Simulated data - in a real app, this would come from an API or database
  List<InvestmentItem> getInvestmentItems() {
    return [
      InvestmentItem(
        id: '1',
        title: 'Blue Chip Stocks',
        description: 'Invest in established companies with stable returns and low risk.',
        imagePath: 'images/IMG-20250523-WA0010.jpg',
        returnRate: 8.5,
        period: 'Annual',
        minInvestment: 5000,
      ),
      InvestmentItem(
        id: '2',
        title: 'Tech Growth Fund',
        description: 'High growth potential with technology sector investments.',
        imagePath: 'images/IMG-20250523-WA0011.jpg',
        returnRate: 12.0,
        period: 'Annual',
        minInvestment: 10000,
      ),
      InvestmentItem(
        id: '3',
        title: 'Real Estate Trust',
        description: 'Stable income from commercial and residential properties.',
        imagePath: 'images/IMG-20250523-WA0012.jpg',
        returnRate: 9.0,
        period: 'Annual',
        minInvestment: 25000,
      ),
      InvestmentItem(
        id: '4',
        title: 'Green Energy Fund',
        description: 'Sustainable investments in renewable energy projects.',
        imagePath: 'images/IMG-20250523-WA0013.jpg',
        returnRate: 10.5,
        period: 'Annual',
        minInvestment: 15000,
      ),
      InvestmentItem(
        id: '5',
        title: 'Global Diversified Portfolio',
        description: 'Balanced investment across multiple sectors and regions.',
        imagePath: 'images/IMG-20250523-WA0014.jpg',
        returnRate: 7.5,
        period: 'Annual',
        minInvestment: 20000,
      ),
    ];
  }
}
