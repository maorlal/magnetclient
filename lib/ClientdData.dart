class ClientData {
  double id;
  String city;
  String street;
  int street_num;
  String infrastructure;
  String isp;
  String infrastructure_type;
  double paid_speed;
  double download_speed;
  double upload_speed;
  double ping;
  double internet_score;
  int disconnections;
}

int get disconnections {
  return disconnections;
}

double get download_speed {
  return download_speed;
}

double get upload_speed {
  return upload_speed;
}

double get ping {
  return ping;
}

int get paid_speed {
  return paid_speed;
}

Client() {
  int street_num;
  String infrastructure;
  String isp;
  String infrastructure_type;
  double paid_speed;
  double download_speed;
  double upload_speed;
  double ping;
  double internet_score;
  int disconnections;
}

// double clinet_score(ClientData data) {
//   double disconnections_score;
//   double download_score;
//   double upload_score;
//   double semi_upload_score;
//   double ping_score;
//   double internet_score;
//   disconnections_score =
//       ((((-50 / 7) * data.disconnections) + 100) / 100) * 4;
//   download_score = (data.download_speed / data.paid_speed) * 3;
//   semi_upload_score = (data.upload_speed / data.paid_speed) * 100;
//   upload_score = (((100 / 7) * (semi_upload_score - 10)) + 100) / 100;
//   ping_score = ((((-5 / 6) * data.ping) + 125) / 100) * 2;
//   internet_score =
//       disconnections_score + download_score + upload_score + ping_score;
//   return internet_score;
// }
