class OnBoardingModel {
  final String image;
  final String title;
  final String description;
  
  final bool showExtraImage; 
  final String? extraImage;  
    final double svgHeight;


  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
        this.showExtraImage = false,
    this.extraImage,
        this.svgHeight = 260,

  });
}
