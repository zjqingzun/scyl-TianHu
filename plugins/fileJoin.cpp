#include "fileSize.h"




// Definition Functions
void __fileJoin(const std::string& _baseFilename, const std::string& _outputFilename) {
    std::ofstream _output(_outputFilename, std::ios::binary);
    if (!_output) {
        std::cerr << "10-01: plugins/fileJoin.cpp\nUnable to create output file: " << _outputFilename << "\n";
        __logWrite("Unable to create output file: " + _outputFilename, "logs/user.log", "error");
        return;
    }

    int _partNumber = 0;
    while (true) {
        std::string partFilename = _baseFilename + ".part" + std::to_string(_partNumber);
        if (!fs::exists(partFilename)) {
            break;
        }

        std::ifstream input(partFilename, std::ios::binary);
        if (!input) {
            std::cerr << "24-02: plugins/fileJoin.cpp\nUnable to read file: " << partFilename << "\n";
            __logWrite("Unable to read file: " + partFilename, "logs/user.log", "error");
            break;
        }

        _output << input.rdbuf();
        std::cout << "[LOADING]                          ";
        std::cout << "File merge successful: " << partFilename << "\n";
        ++_partNumber;
    }

    _output.close();
    std::cout << "[SUCCESS]                          ";
    __logWrite("File join completed successfully: " + _outputFilename);
    std::cout << "File has been successfully created: " << _outputFilename << "\n";
}

