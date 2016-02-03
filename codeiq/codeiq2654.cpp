#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>
#include <map>
#include <cstdio>
using namespace std;
typedef pair<int,int> ii;
typedef vector<int> vi;
typedef vector<vi> vvi;
typedef vector<ii> vii;
typedef vector<vii> vvii;
typedef map<vi, int> mvi;

mvi memo;

int solve(int p, int w, int l, int d){
	// printf("Called By p:%d, w:%d, l:%d, d:%d\n", p,w,l,d);
	int cnt = 0;
	vi status(4, 0);
	status[0] = p;
	status[1] = w;
	status[2] = l;
	status[3] = d;
	if(memo[status] > 0) {
		// cout << "Get memo :" << memo[status] << endl;
		return memo[status];
	}
	if(l == 1 && w == 0 && d == 0) {
		// cout << "Get One" << endl;
		return 1;
	}
	if (p > 1) cnt += solve(p - 1, w, l - 1, d);
	if (w > 0) cnt += solve(p + 1, w - 1, l, d);
	if (d > 0) cnt += solve(p, w, l, d - 1);
	memo[status] = cnt;
	return cnt;
}

int main(int argc, char const *argv[])
{
	int player[2];
	int turn;
	int w,l,d;
	int cnt = 0;
	scanf("%d,%d,%d", &player[0], &player[1], &turn);
	for (int j = 1; j <= turn; ++j) {
		for (int i = 0; i < 2; ++i) {
			int remain = j - player[i];
			if(remain < 0) continue;
			d = remain % 2;
			w = remain / 2;
			l = w + player[i];
			while(l >= player[i]) {
				// printf("Start for player %d w:%d, l:%d, d:%d\n", i+1, w,l,d);
				cnt += solve(player[i], w, l,d);
				l -= 1;
				w -= 1;
				d += 2;
			}
		}
	}

	cout << cnt << endl;
}