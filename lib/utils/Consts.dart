
import 'dart:convert';

const LogTag = 'Loyalty Logger ---------> ';
// const BaseIp = 'https://5.160.236.245';
// const BaseIp = 'https://crmsolution.behpardaz.net';
const BaseIp = 'https://totalsolution.behpardaz.net';


// const BaseUrl = 'https://5.160.236.245/siebel/v1.0/service/';
// const BaseUrl = 'https://crmsolution.behpardaz.net/siebel/v1.0/service/';
const BaseUrl = 'https://totalsolution.behpardaz.net/siebel/v1.0/service/';


const Map<String, String> CommonHeader = {
  'Content-type': 'application/json',
  "Accept": "application/json;charset=UTF-8",
};


final basicAuth = 'Basic ' + base64Encode(utf8.encode('sadmin:oracle'));
final Map<String, String> AuthHeader = {
  'Content-type': 'application/json',
  "Accept": "application/json;charset=UTF-8",
  "Authorization": "$basicAuth",
};



const Currency = 'ریال';