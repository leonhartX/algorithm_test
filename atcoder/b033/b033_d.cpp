#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>
#include <map>
#include <cstdio>
#include <cmath>
#include <sys/time.h>
using namespace std;

typedef pair<int,int> ii;
typedef vector<int> vi;
typedef vector<vi> vvi;
typedef vector<ii> vii;
typedef map<ii, int> mii;

struct point
{
	int x;
	int y;
};

int d[2001][2001];

int main(int argc, char const *argv[])
{
	int n;
	int acute = 0;
	int right = 0;
	int obtuse = 0;
	cin >> n;
	vector<point> all(n);
	for (int i = 0; i < n; ++i) {
		point p;
		scanf("%d %d", &p.x, &p.y);
		all[i] = p;
	}
	for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            d[i][j] = pow(all[i].x - all[j].x, 2) + pow(all[i].y - all[j].y, 2);
        }
    }
	for (int i = 0; i < n - 2; ++i) {
		for (int j = i + 1; j < n - 1; ++j) {
			for (int k = j + 1; k < n; ++k) {
				int a = d[i][j];
				int b = d[i][k];
				int c = d[j][k];
				if (c < a) swap(a, c);
				if (c < b) swap(b, c);
				int s = a + b - c;
				if (s == 0) {
					right++;
				}else if (s > 0) {
					acute++;
				}else {
					obtuse++;
				}
			}
		}
	}
	cout << acute << " " << right << " " << obtuse << endl;
	return 0;
}