#include <iostream>
using namespace std;

int square(int x) {
    return x * x;
}

int main() {
    int num;

    cout << "Введіть число: ";
    cin >> num;

    cout << "Квадрат числа: " << square(num) << endl;

    return 0;
}
