#include <iostream>
#include <cmath>

using namespace std;

bool checkPrime(int num)
{
	if (num <= 3) return true;
	if(num % 2 == 0) return false;
	int max = sqrt(num);
	for (int i = 3; i <= max; i += 2)
	{
		if(num % i == 0) return false;
	}
	return true;
}

int main()
{
	int n, num;
	int count = 0;
	cin >> n;
	for (int i = 0; i < n; ++i)
	{
		cin >> num;
		if(checkPrime(num)) count++;
	}
	cout << count << endl;
	return 0;
}