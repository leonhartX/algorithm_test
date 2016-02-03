#include <iostream>
#include <algorithm>
#include <vector>
#include <cmath>

using namespace std;

int insertSort(int a[], int n, int g)
{
	int cnt = 0;
	for (int i = g; i < n; ++i)
	{
		int v = a[i];
		int j = i - g;
		while (j >=0 && a[j] > v) 
		{
			a[j + g] = a[j];
			j -= g;
			cnt++;		
		}
		a[j + g] = v;
	}
	return cnt;
}

int shellSort(int a[], int n, vector<int> g)
{	
	int cnt = 0;
	for (int i = g.size() - 1; i >= 0; --i)
	{
		cnt += insertSort(a, n, g[i]);
	}
	return cnt;
}

int main(int argc, char const *argv[])
{
	ios::sync_with_stdio(false);
	int n = 0;
	cin >> n;
	int a[n];
	for (int i = 0; i < n; ++i)
	{
		cin >> a[i];
	}

	vector<int> g;
	int i = 1;
	while(i <= n)
	{
		g.push_back(i);
		i = i * 3 + 1;
	}

	cout << g.size() << endl;
	for (i = g.size() - 1; i >= 0; --i)
	{
		cout << g[i];
		if( i > 0) {
			cout << " ";
		}
	}
	cout << endl << shellSort(a, n, g) << endl;
	for (i = 0; i < n; ++i)
	{
		cout << a[i] << endl;
	}
	return 0;
}