library emdad_khodro_saipa.globals;

import 'package:emdad_khodro_saipa/models/request_model/submit_emdad_request.dart';
import 'package:emdad_khodro_saipa/models/request_model/submit_home_service_request.dart';
import 'package:emdad_khodro_saipa/models/response_model/profile.dart';

bool user_logged_in = false;
String user_phone_number = '';
String user_first_name = '';
String user_last_name = '';
String user_full_name = '';
String user_national_code = '';


GetProfile getProfile = GetProfile();

SubmitEmdadRequest submitEmdadRequest = SubmitEmdadRequest();

SubmitHomeServiceRequest submitHomeServiceRequest = SubmitHomeServiceRequest();
bool chooseRelifSelected = false;

List<String> finalSubServices=[];