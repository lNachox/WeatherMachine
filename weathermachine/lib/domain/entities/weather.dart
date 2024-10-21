class Weather {
  String? greeting;

  Weather({this.greeting});

  Weather.fromJson(Map<String, dynamic>? json){
    if(json == null) return;
    this.greeting = json['greeting'] as String?;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    if(greeting != null) json['greeting'] = greeting;
    return json;
  }
}