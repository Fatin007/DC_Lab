#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

vector<int> generateHammingCode(vector<int> data) {
    int m = data.size();
    int r = 0;
    while (pow(2, r) < (m + r + 1)) r++;

    vector<int> hammingCode(m + r + 1);
    int j = 0;
    for (int i = 1; i <= m + r; i++) {
        if ((i & (i - 1)) == 0) continue;
        hammingCode[i] = data[j++];
    }

    for (int i = 0; i < r; i++) {
        int x = pow(2, i);
        int value = 0;
        for (int j = 1; j <= m + r; j++) {
            if (j & x) value ^= hammingCode[j];
        }
        hammingCode[x] = value;
    }
    return hammingCode;
}

int main() {
    int n;
    cout << "Enter the number of bits (<= 15): ";
    cin >> n;

    vector<int> data(n);
    cout << "Enter the data bits: ";
    for (int i = 0; i < n; i++) cin >> data[i];

    vector<int> hammingCode = generateHammingCode(data);
    cout << "Hamming Code: ";
    for (int i = 1; i < hammingCode.size(); i++) cout << hammingCode[i];
    cout << endl;

    cout << "Enter position to introduce error (1-" << hammingCode.size() - 1 << "): ";
    int pos;
    cin >> pos;
    hammingCode[pos] ^= 1;

    cout << "Received code with error: ";
    for (int i = 1; i < hammingCode.size(); i++) cout << hammingCode[i];
    cout << endl;

    int errorPos = 0;
    for (int i = 0; i < log2(hammingCode.size()); i++) {
        int x = pow(2, i);
        int value = 0;
        for (int j = 1; j < hammingCode.size(); j++)
            if (j & x) value ^= hammingCode[j];
        errorPos += value * x;
    }

    if (errorPos)
        cout << "Error detected at position: " << errorPos << endl;
    else
        cout << "No error detected." << endl;

    return 0;
}
