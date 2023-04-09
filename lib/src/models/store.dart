import 'dart:convert';

class Store {
  final String name;
  final String? tagline;
  final String? postalAdress;
  final String? phone;
  final String? logoUrl;
  final String? websiteUrl;

  const Store({
    required this.name,
    this.tagline,
    this.postalAdress,
    this.phone,
    this.logoUrl,
    this.websiteUrl,
  });

  Map<String, dynamic> toMap() => {
        "name": name,
        "tagline": tagline,
        "postal_address": postalAdress,
        "phone": phone,
        "logo_url": logoUrl,
        "website_url": websiteUrl,
      };

  String toJson() => json.encode(toMap());
}
