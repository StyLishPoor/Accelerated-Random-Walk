#ifndef HELPER_H
#define HELPER_H

#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>
#include <fstream>
#include <regex>
#include <chrono>

using namespace std;

struct Param {
  string graph_name;
  string binary_name;
  string random_binary_name;
  string attribute_name;
  string query_name;
  string result_directory;
  string algorithm;
  double epsilon = 0.5;
  double alpha = 0.2;
  int query_size = 10;
  bool directed = true;
};

extern Param param;
extern Param argParse(int argnum, char** argname);

void usage_message();

#endif
