#include <iostream>
#include <fstream>
#include <string>
#include <chrono>
#include <ctime>
#include <iomanip>




// Declaration Functions
void __logWrite(const std::string& logMessage, const std::string& logFilePath = "logs/user.log", const std::string& tag = "user");
/**
 * @brief Writes a log message to a specified log file with a timestamp.
 * 
 * @param logMessage The message to log.
 * @param logFilePath The path to the log file.
 * @param tag An optional tag for categorizing the log message (default is "user").
 */
