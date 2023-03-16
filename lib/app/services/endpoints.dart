//change the domain to your machine's ip address or to 10.0.2.2 if you are running the app  on an emulator
const String domain = "http://192.168.40.15:8000";
const String authLogin = "$domain/auth/login/";
const String authRegister = "$domain/auth/register";
const String trips = "$domain/trips";
const String paymentGatewayUrl = "$domain/pay/for_strip";
const String userDetails = "$domain/users/";
const String ticketIssue = "$domain/ticket/"; //with a body