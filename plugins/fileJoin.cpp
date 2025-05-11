#include "fileSize.h"




// Definition Functions
void __fileJoin(const std::string& _baseFilename, const std::string& _outputFilename) {
    std::ofstream _output(_outputFilename, std::ios::binary);
    if (!_output) {
        std::cerr << "10-01: plugins/fileJoin.cpp\nUnable to create output file: " << _outputFilename << "\n";
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
            std::cerr << "23-02: plugins/fileJoin.cpp\nUnable to read file: " << partFilename << "\n";
            break;
        }

        _output << input.rdbuf();
        std::cout << "File merge successful: " << partFilename << "\n";
        ++_partNumber;
    }

    _output.close();
    std::cout << "File has been successfully created: " << _outputFilename << "\n";
}

