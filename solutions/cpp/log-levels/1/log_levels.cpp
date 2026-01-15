#include <string>
#include <iostream>
#include <sstream>

using namespace std;

namespace log_line {
    std::string message(std::string line) {
        int location=line.find(":")+2;
        
        return line.substr(location, line.length()-location);
    }

    std::string log_level(std::string line) {
        int location=line.find("]");
        
        return line.substr(1, location-1);
    }

    std::string reformat(std::string line) {
        string msg=message(line);
        string level=log_level(line);
        ostringstream oss;
        oss<<msg<<" ("<<level<<")";
        return oss.str();
    }
}
