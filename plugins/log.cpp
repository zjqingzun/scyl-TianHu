#include "log.h"




// Definition Functions
void __logWrite(const std::string& logMessage, const std::string& logFilePath, const std::string& tag) {
    // Get current system time
    auto _now = std::chrono::system_clock::now();
    std::time_t _currentTime = std::chrono::system_clock::to_time_t(_now);
    std::tm* _timeInfo = std::localtime(&_currentTime);

    // Format timestamp
    std::ostringstream _timestamp;
    _timestamp << std::put_time(_timeInfo, "%Y-%m-%d %H:%M:%S");

    // Open file in append mode
    std::ofstream _logFile(logFilePath, std::ios_base::app);
    if (_logFile.is_open()) {
        _logFile << _timestamp.str()
                << std::setw(8) << " "                       // spacing after timestamp
                << "[" << tag << "]"
                << std::setw(25 - tag.length()) << " "       // spacing after tag
                << logMessage << std::endl;
        _logFile.close();
    } else {
        std::cerr << "27-01: plugins/logWrite.cpp\nFailed to open log file: " << logFilePath << std::endl;
    }
}