class RestService {
  Future<RestService> init() async {
    // do your async initialisation...
    // simulating it with a Delay here
    await Future.delayed(Duration(seconds: 2));
    return this;
  }
}
