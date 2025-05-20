#include "fileSize.h"




// Definition Functions
void __fileSplit(const std::string& _inputFilename) {
    std::ifstream _input(_inputFilename, std::ios::binary);
    if (!_input) {
        std::cerr << "10-01: plugins/fileSplit.cpp\n Unable to open input file: " << _inputFilename << "\n";
        return;
    }

    char* _buffer = new char[CHUNKSIZE];
    std::size_t _partNumber = 0;

    while (!_input.eof()) {
        _input.read(_buffer, CHUNKSIZE);
        std::streamsize bytesRead = _input.gcount();

        if (bytesRead > 0) {
            std::string _outputFilename = _inputFilename + ".part" + std::to_string(_partNumber);
            std::ofstream output(_outputFilename, std::ios::binary);
            if (!output) {
                std::cerr << ": " << _outputFilename << "\n";
                delete[] _buffer;
                return;
            }
            output.write(_buffer, bytesRead);
            output.close();
            std::cout << "[LOADING]                     ";
            std::cout << "Successfully created  " << _outputFilename << " (" << bytesRead << " bytes)\n";
            ++_partNumber;
        }
    }

    delete[] _buffer;
    _input.close();
    std::cout << "[SUCCESS]                     ";
    std::cout << "File splitting completed.\n";
}

