#include <iostream>
#include <fstream>

using namespace std;

int main() {
    ofstream file("adder_8bit.csv");
    file << "a,b,c_in,sum,c_out\n";
    uint8_t a, b, c_in, c_out, sum;
    for (int i = 0; i < 256; ++i) {
        for (int j = 0; j < 256; ++j) {
            for (int k = 0; k < 2; ++k) {
                a = i;
                b = j;
                c_in = k;
                sum = i + j + k;
                c_out = (i + j + k) >> 8;
                file << (int)a << "," << (int)b << "," << (int)c_in << "," << (int)sum << "," << (int)c_out << "\n";
            }
        }
    }
    file.close();
    return 0;
}