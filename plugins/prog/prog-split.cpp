#include "../fileSize.h"




// This program joins two files into one.
// It takes a file name as an argument and splits it into two files.
// The first file contains the first half of the original file,
int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <fileName.txt>\n";
        return 1;
    }

    __fileSplit(argv[1]);
    return 0;
}
