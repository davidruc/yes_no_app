

class YesNoModel {

  final String answer;
  final bool forced;
  final String? imageUrl;

  YesNoModel({required this.answer, required this.forced, required this.imageUrl});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json)=>
    YesNoModel(
      answer: json["answer"], 
      forced: json["forced"], 
      imageUrl: json["image"]
    );

}