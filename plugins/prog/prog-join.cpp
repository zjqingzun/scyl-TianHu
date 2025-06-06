#include "../fileSize.h"




// This program joins two files into one.
// The first file is the original file, and the second file is the result file.
int main(int argc, char* argv[]) {
    if (argc != 3) {
        std::cerr << "Usage: " << argv[0] << " <originalName> <resultFile>\n";
        std::cerr << "Example: " << argv[0] << " data.txt joined.txt\n";
        return 1;
    }

    __fileJoin(argv[1], argv[2]);
    return 0;
}
