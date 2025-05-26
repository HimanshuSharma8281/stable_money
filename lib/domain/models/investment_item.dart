class InvestmentItem {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final double returnRate;
  final String period;
  final double minInvestment;

  InvestmentItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.returnRate,
    required this.period,
    required this.minInvestment,
  });
}
