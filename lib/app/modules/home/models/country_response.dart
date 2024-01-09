class CountryResponse {
  int status;
  bool success;
  List<Country> countries;
  Pagination pagination;

  CountryResponse({
    required this.status,
    required this.success,
    required this.countries,
    required this.pagination,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<Country> countries =
        data.map((country) => Country.fromJson(country)).toList();

    return CountryResponse(
      status: json['status'],
      success: json['success'],
      countries: countries,
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Country {
  int id;
  String countryCode;
  String name;
  String capital;

  Country({
    required this.id,
    required this.countryCode,
    required this.name,
    required this.capital,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      countryCode: json['country_code'],
      name: json['name'],
      capital: json['capital'],
    );
  }
}

class Pagination {
  int count;
  int total;
  int perPage;
  int currentPage;
  int totalPages;
  PaginationLinks links;

  Pagination({
    required this.count,
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      count: json['count'],
      total: json['total'],
      perPage: json['perPage'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      links: PaginationLinks.fromJson(json['links']),
    );
  }
}

class PaginationLinks {
  String? previous;
  String? next;

  PaginationLinks({
    required this.previous,
    required this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) {
    return PaginationLinks(
      previous: json['previous'],
      next: json['next'],
    );
  }
}
