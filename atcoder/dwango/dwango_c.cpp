#include <iostream>
#include <vector>

using namespace std;

int main(int argc, char const *argv[])
{
	int h, w;
	cin >> h >> w;
	int c[h][w];
	c[h-1][w-1] = 1;
	cout << h << w << c[h-1][w-1] << endl;
	return 0;
}