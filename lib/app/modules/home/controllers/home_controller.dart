import 'package:get/get.dart';
import 'package:kafiil/app/controllers/settings_controller.dart';
import 'package:kafiil/app/modules/home/models/country_response.dart';
import 'package:kafiil/app/modules/home/models/service_response.dart';
import 'package:kafiil/app/modules/home/network/home_network.dart';
import 'package:kafiil/app/modules/login/models/login_response.dart';
import 'package:kafiil/app/modules/register/models/dependency_model.dart';
import 'package:kafiil/app/resources/string_manager.dart';

class HomeController extends GetxController {
  SettingsController settingsController = Get.find<SettingsController>();
  UserModel? loggedInUser;
  DependencyModel? dependencyModel;
  ServiceResponse? serviceResponse;
  ServiceResponse? popularServiceResponse;
  CountryResponse? countryResponse;
  List<Type> userTypes = [];
  int selectedIndex = 0;
  String? nextUrl;
  String? previousUrl;
  int countryPage = 0;
  int countryMaxPage = 0;

  Future getUser() async {
    final response =
        await HomeNetwork().getUser(token: settingsController.accessToken);
    loggedInUser = UserModel.fromJson(response['data']);
    update();
  }

  Future getDependencies() async {
    final response = await HomeNetwork().getDependencies();
    dependencyModel = DependencyModel.fromJson(response);
    userTypes = dependencyModel!.types;
    update();
  }

  Future getServices() async {
    final response = await HomeNetwork().getServices();
    serviceResponse = ServiceResponse.fromJson(response);
    update();
  }

  Future getPopularServices() async {
    final response = await HomeNetwork().getPopularServices();
    popularServiceResponse = ServiceResponse.fromJson(response);
    update();
  }

  Future findFirstPageCountries() async {
    final response =
        await HomeNetwork().getCountries(url: "${AppLinks.baseUrl}/country");
    countryResponse = CountryResponse.fromJson(response);
    nextUrl = countryResponse!.pagination.links.next;
    previousUrl = countryResponse!.pagination.links.previous;
    countryPage = countryResponse!.pagination.currentPage;
    countryMaxPage = countryResponse!.pagination.totalPages;
    update();
  }

  Future findPageCountries(int page) async {
    final response = await HomeNetwork()
        .getCountries(url: "${AppLinks.baseUrl}/country?page=$page");
    countryResponse = CountryResponse.fromJson(response);
    nextUrl = countryResponse!.pagination.links.next;
    previousUrl = countryResponse!.pagination.links.previous;
    countryPage = countryResponse!.pagination.currentPage;
    countryMaxPage = countryResponse!.pagination.totalPages;
    update();
  }

  Future findPreviousCountries() async {
    if (previousUrl != null) {
      final response = await HomeNetwork().getCountries(url: previousUrl!);
      countryResponse = CountryResponse.fromJson(response);
      nextUrl = countryResponse!.pagination.links.next;
      previousUrl = countryResponse!.pagination.links.previous;
      countryPage = countryResponse!.pagination.currentPage;
      countryMaxPage = countryResponse!.pagination.totalPages;
      update();
    }
  }

  Future findNextCountries() async {
    if (nextUrl != null) {
      final response = await HomeNetwork().getCountries(url: nextUrl!);
      countryResponse = CountryResponse.fromJson(response);
      nextUrl = countryResponse!.pagination.links.next;
      previousUrl = countryResponse!.pagination.links.previous;
      countryPage = countryResponse!.pagination.currentPage;
      countryMaxPage = countryResponse!.pagination.totalPages;
      update();
    }
  }

  Future findLastPageCountries() async {
    final response = await HomeNetwork()
        .getCountries(url: "${AppLinks.baseUrl}/country?page=$countryMaxPage");
    countryResponse = CountryResponse.fromJson(response);
    nextUrl = countryResponse!.pagination.links.next;
    previousUrl = countryResponse!.pagination.links.previous;
    countryPage = countryResponse!.pagination.currentPage;
    countryMaxPage = countryResponse!.pagination.totalPages;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(
      Duration.zero,
      () async {
        await getUser();
        await getDependencies();
      },
    );
  }
}
