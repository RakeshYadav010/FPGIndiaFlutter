/// timestamp : 1640150621
/// version : "1.0"
/// status : true
/// code : 200
/// message : "Got Result Successfully."
/// data : {"top_header":"Have any doubts?","description":[{"title":"What is First Price Group?","note":"First Price Offer Group is a close-knit group of members with genuine interest in buying a house/property offered to them with special set of advantages - a highly competitive price from reputed builders for properties that are pre-researched for being at exclusive locations and built with quality construction.","image":""},{"title":"Which company is behind this concept ?","note":"First Price Group is a concept brought to you by IPAN Real Estate Pvt. Ltd., one of India's growing real estate development and advisory service providing company, based in New Delhi. Well known for its professionalism, loyalty and commitment, the company’s focus is to come up with projects which are specifically designed as per the customers' needs. The company is also actively pursuant in adding the much needed professionalism and ethical practices in the real estate sector through its very vast and growing pan India network of real estate advisors. The company is managed by an enviable board of professionals from real estate, construction, architecture and legal services.","image":""},{"title":"How do I benefit by registering with FPG ?","note":"<p>Whenever a new project is launched, you will be offered a window of 15 days with exclusive price on the property in concern before opening it for the general public by the builder</p>\n                                <p>This property will be pre-researched by IPAN who will provide you complete report of everything related with the property</p>\n                                <p>An exclusive site visit facility, consultation with our team, and assistance to take a sound decision will be offered within this period of 15 days</p>\n                                <p>On the 16th day, we offer you to opt for the draw slot to book your spot as a potential buyer of the house</p>\n                                <p>If the draw is in your favour, a timeline of 48 hours will be given to take the decision and pay the confirmation amount</p>\n                                <p>In case you are unable to make the payment, the offer shall be transferred to the next buyer in the waiting list and so on so forth</p>\n                                <p>As a FPG member, you benefit by being the first few privileged ones to be offered the deal on a property by reputed builders. You also receive all the support and information needed to take an informed decision and support to close the deal.</p>","image":""},{"title":"Is there any registration fee ?","note":"Yes, there is a registration fee of Rs. 5/-. However, this is primarily to seal the commitment from your end as a prospective member of the FPG group. We have observed that charging 5 Rupees deter non serious participants up to a large extent. We also encourage you to share the opportunity with your friends by inviting them to join the FPG group. This is not just a golden opportunity shared, but also you opening up to the possibility of living with your friends in the same compound.","image":""},{"title":"Which all builders would be offering projects under FPG ?","note":"Only reputed builders chosen by IPAN based on various parameters like project history, delivery timeline, and the ones offering properties duly approved by competent authorities.","image":""},{"title":"Why only 15 days are given for site visits?","note":"<p>The intent of the 15-day window is to offer you the property before it goes to the public. This leaves the builder with very limited time and a strict timeline to ensure only serious FPG buyers to pitch in.</p><p>FPG group members are expected to be equally aggressive as they expect the builders to be regarding special prices offered and exclusive terms applicable only to the FPG members</p>","image":""},{"title":"What type of properties would be offered to FPG registrants ?","note":"FPG registrants will be offered with residential, commercial and all other kinds of properties which they choose to opt for while making the registration.","image":""},{"title":"Why is it compulsory for people successful in draw of projects to decide and pay within 48 hours ?","note":"<p>FPG believe its members to take an informed decision within the 15-day timeline and be firm regarding your participation in the project. We will provide you with best of our services and put in all our efforts to ensure that you have all the necessary information to take the desired decision.</p>\n                               <p>Once the decision is taken and you have participated in the draw, and in case of being suc-cessful in the draw, 48 hours are given to confirm your willingness to accept the project unit by paying a confirmation fee. The confirmation fee is approximately 1% of the total price.</p>\n                               <p>The confirmation fee payment within 48 hours is to ensure that we don’t end up with unsold units within those 15-20 days (limited period offered by the builder). Incase of non-payment, the same deal shall be offered to those in the waiting list, thus offering a fair chance to everyone involved.</p>","image":""},{"title":"Would the benefits in a project be offered after expiry of the site visit period of 15 days ?","note":"No. The benefits of the project will be offered only to FPG members who have deposited the confirmation fee within 48 hours after 15 day window.","image":""},{"title":"Why would the builders give better offers to FPG registrants ?","note":"We offer the builders the promise of bulk buying by opening up the project to the FPG members and offering them a deal of a lifetime. The builder thus saves a great deal of marketing expense by not having to promote the project extensively to sell the units. The amount saved is in turn transferred to the FPG members in the form of a promising deal with the aim of selling the units in bulk to a genuine group of people - that includes you!","image":""},{"title":"What experience does IPAN has in managing such concepts ?","note":"<p>IPAN Real Estate Pvt. Ltd. is one of India’s growing real estate development and advisory service providing company, based in New Delhi. It’s also one of the pioneers in introducing the concept of “Group Buying”. The main concept is to remove any middlemen in the process of buying/selling and transfer the benefit of the money saved (with zero or less marketing cost and with added benefit of Group buying for the builders) to the buyers like you.</p>\n                                <p>FPG is IPAN’s one of the “Group Buying” projects before which it has successfully executed projects for paramilitary and defence forces.</p>\n                                <p>ABSAY (Akhil Bharatiya Suraksha Awaas Yojna) for Armed Force personnel and government officials</p>","image":""}]}

class RespFaqsData {
  RespFaqsData({
      int? timestamp, 
      String? version, 
      bool? status, 
      int? code, 
      String? message, 
      Data? data,}){
    _timestamp = timestamp;
    _version = version;
    _status = status;
    _code = code;
    _message = message;
    _data = data;
}

  RespFaqsData.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _version = json['version'];
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _timestamp;
  String? _version;
  bool? _status;
  int? _code;
  String? _message;
  Data? _data;

  int? get timestamp => _timestamp;
  String? get version => _version;
  bool? get status => _status;
  int? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = _timestamp;
    map['version'] = _version;
    map['status'] = _status;
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// top_header : "Have any doubts?"
/// description : [{"title":"What is First Price Group?","note":"First Price Offer Group is a close-knit group of members with genuine interest in buying a house/property offered to them with special set of advantages - a highly competitive price from reputed builders for properties that are pre-researched for being at exclusive locations and built with quality construction.","image":""},{"title":"Which company is behind this concept ?","note":"First Price Group is a concept brought to you by IPAN Real Estate Pvt. Ltd., one of India's growing real estate development and advisory service providing company, based in New Delhi. Well known for its professionalism, loyalty and commitment, the company’s focus is to come up with projects which are specifically designed as per the customers' needs. The company is also actively pursuant in adding the much needed professionalism and ethical practices in the real estate sector through its very vast and growing pan India network of real estate advisors. The company is managed by an enviable board of professionals from real estate, construction, architecture and legal services.","image":""},{"title":"How do I benefit by registering with FPG ?","note":"<p>Whenever a new project is launched, you will be offered a window of 15 days with exclusive price on the property in concern before opening it for the general public by the builder</p>\n                                <p>This property will be pre-researched by IPAN who will provide you complete report of everything related with the property</p>\n                                <p>An exclusive site visit facility, consultation with our team, and assistance to take a sound decision will be offered within this period of 15 days</p>\n                                <p>On the 16th day, we offer you to opt for the draw slot to book your spot as a potential buyer of the house</p>\n                                <p>If the draw is in your favour, a timeline of 48 hours will be given to take the decision and pay the confirmation amount</p>\n                                <p>In case you are unable to make the payment, the offer shall be transferred to the next buyer in the waiting list and so on so forth</p>\n                                <p>As a FPG member, you benefit by being the first few privileged ones to be offered the deal on a property by reputed builders. You also receive all the support and information needed to take an informed decision and support to close the deal.</p>","image":""},{"title":"Is there any registration fee ?","note":"Yes, there is a registration fee of Rs. 5/-. However, this is primarily to seal the commitment from your end as a prospective member of the FPG group. We have observed that charging 5 Rupees deter non serious participants up to a large extent. We also encourage you to share the opportunity with your friends by inviting them to join the FPG group. This is not just a golden opportunity shared, but also you opening up to the possibility of living with your friends in the same compound.","image":""},{"title":"Which all builders would be offering projects under FPG ?","note":"Only reputed builders chosen by IPAN based on various parameters like project history, delivery timeline, and the ones offering properties duly approved by competent authorities.","image":""},{"title":"Why only 15 days are given for site visits?","note":"<p>The intent of the 15-day window is to offer you the property before it goes to the public. This leaves the builder with very limited time and a strict timeline to ensure only serious FPG buyers to pitch in.</p><p>FPG group members are expected to be equally aggressive as they expect the builders to be regarding special prices offered and exclusive terms applicable only to the FPG members</p>","image":""},{"title":"What type of properties would be offered to FPG registrants ?","note":"FPG registrants will be offered with residential, commercial and all other kinds of properties which they choose to opt for while making the registration.","image":""},{"title":"Why is it compulsory for people successful in draw of projects to decide and pay within 48 hours ?","note":"<p>FPG believe its members to take an informed decision within the 15-day timeline and be firm regarding your participation in the project. We will provide you with best of our services and put in all our efforts to ensure that you have all the necessary information to take the desired decision.</p>\n                               <p>Once the decision is taken and you have participated in the draw, and in case of being suc-cessful in the draw, 48 hours are given to confirm your willingness to accept the project unit by paying a confirmation fee. The confirmation fee is approximately 1% of the total price.</p>\n                               <p>The confirmation fee payment within 48 hours is to ensure that we don’t end up with unsold units within those 15-20 days (limited period offered by the builder). Incase of non-payment, the same deal shall be offered to those in the waiting list, thus offering a fair chance to everyone involved.</p>","image":""},{"title":"Would the benefits in a project be offered after expiry of the site visit period of 15 days ?","note":"No. The benefits of the project will be offered only to FPG members who have deposited the confirmation fee within 48 hours after 15 day window.","image":""},{"title":"Why would the builders give better offers to FPG registrants ?","note":"We offer the builders the promise of bulk buying by opening up the project to the FPG members and offering them a deal of a lifetime. The builder thus saves a great deal of marketing expense by not having to promote the project extensively to sell the units. The amount saved is in turn transferred to the FPG members in the form of a promising deal with the aim of selling the units in bulk to a genuine group of people - that includes you!","image":""},{"title":"What experience does IPAN has in managing such concepts ?","note":"<p>IPAN Real Estate Pvt. Ltd. is one of India’s growing real estate development and advisory service providing company, based in New Delhi. It’s also one of the pioneers in introducing the concept of “Group Buying”. The main concept is to remove any middlemen in the process of buying/selling and transfer the benefit of the money saved (with zero or less marketing cost and with added benefit of Group buying for the builders) to the buyers like you.</p>\n                                <p>FPG is IPAN’s one of the “Group Buying” projects before which it has successfully executed projects for paramilitary and defence forces.</p>\n                                <p>ABSAY (Akhil Bharatiya Suraksha Awaas Yojna) for Armed Force personnel and government officials</p>","image":""}]

class Data {
  Data({
      String? topHeader, 
      List<Description>? description,}){
    _topHeader = topHeader;
    _description = description;
}

  Data.fromJson(dynamic json) {
    _topHeader = json['top_header'];
    if (json['description'] != null) {
      _description = [];
      json['description'].forEach((v) {
        _description?.add(Description.fromJson(v));
      });
    }
  }
  String? _topHeader;
  List<Description>? _description;

  String? get topHeader => _topHeader;
  List<Description>? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['top_header'] = _topHeader;
    if (_description != null) {
      map['description'] = _description?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "What is First Price Group?"
/// note : "First Price Offer Group is a close-knit group of members with genuine interest in buying a house/property offered to them with special set of advantages - a highly competitive price from reputed builders for properties that are pre-researched for being at exclusive locations and built with quality construction."
/// image : ""

class Description {
  Description({
      String? title, 
      String? note, 
      String? image,}){
    _title = title;
    _note = note;
    _image = image;
}

  Description.fromJson(dynamic json) {
    _title = json['title'];
    _note = json['note'];
    _image = json['image'];
  }
  String? _title;
  String? _note;
  String? _image;

  String? get title => _title;
  String? get note => _note;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['note'] = _note;
    map['image'] = _image;
    return map;
  }

}