#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <filesystem>

#include "log.h"


namespace fs = std::filesystem;




// Constants
const std::size_t CHUNKSIZE = 10 * 1024 * 1024; // 10 MB


// Declare Functions
void __fileSplit(const std::string& _inputFilename);
void __fileJoin(const std::string& _baseFilename, const std::string& _outputFilename);