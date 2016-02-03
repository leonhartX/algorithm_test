#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>
#include <map>
#include <cstdio>
#include <sys/time.h>
using namespace std;

typedef pair<int,int> ii;
typedef vector<int> vi;
typedef vector<vi> vvi;
typedef vector<ii> vii;
typedef vector<vii> vvii;
typedef map<pair<vector<int>, int>, int> mvi;

#define INF 1 << 20

void printtime() {
	struct timeval tp;
    gettimeofday(&tp, NULL);
    long long mslong = (long long) tp.tv_sec * 1000L + tp.tv_usec / 1000; //get current timestamp in milliseconds
    cout << mslong << endl;
}

int dijkstra(vvii G, int N, int src, vi dest, vi* path) {
	vi D(N, INF);
	priority_queue<ii, vii, greater<ii> > Q;
	D[src] = 0;
	Q.push(ii(0, src));
	int num = dest.size();
	int found = 0;

	while(!Q.empty()) {
		ii top = Q.top();
		Q.pop();
		int d = top.first;
		int v = top.second;
		for (int i = 0; i < num; ++i) {
			if (dest[i] == v && (*path)[i] == 0) {
				(*path)[i] = d;
				cout << "found " << src << " to " << v << " cost " << d << endl;
				found++;
			}
		}
		if(found == num) return 0;
		if (d <= D[v]) {
			for (std::vector<pair<int, int> >::iterator i = G[v].begin(); i != G[v].end(); ++i) {
				int v2 = i->first;
				int cost = i->second;
				if (D[v2] > D[v] + cost) {
					D[v2] = D[v] + cost;
					Q.push(ii(D[v2], v2));
				}
			}
		}
	}
}

int tsp(vvi path, int n) {
	cout << "Run TSP for n: " << n << endl;
	mvi C;
	vi S;
	for (int i = 1; i < n; ++i) {
		S = vector<int>();
		S.push_back(i);
		C[make_pair(S, i)] = path[0][i];
	}

	for (int i = 2; i < n; ++i) {
		S = vector<int>();
		int minC = INF;
		for (int j = 1; j <= i; ++j) {
			S.push_back(j);
		}
		do {
			for (vi::iterator it = S.begin(); it != S.end(); ++it) {
				int tmp = *it;
				minC = INF;
				S.erase(it);
				for (vi::iterator it2 = S.begin(); it2 != S.end(); ++it2) {
					minC = min(C[make_pair(S, *it2)] + path[*it2][tmp], minC);
				}

				S.insert(it, tmp);
				C[make_pair(S, tmp)] = minC;
			}
			if (S[i-1] == n - 1) {
				int k = i - 1;
				while((k > 0) && (S[k-1] == S[k] - 1)) k--;
				if (k > 0) {
					S[k - 1]++;
					while(k < i) {
						S[k] = S[k - 1] + 1;
						k++;
					}
				} else S[0]++;
			} else S[i-1]++;
		} while (S[0] <= (n - i));
	}
	S = vector<int>();
	for (int i = 1; i < n; ++i) S.push_back(i);

	// for (mvi::iterator it = C.begin(); it != C.end(); ++it) {
	// 	pair<pair<vector<int>, int>, int> item = *it;
	// 	for (vi::iterator i = item.first.first.begin(); i != item.first.first.end(); ++i)
	// 	{
	// 		cout << *i << " ";
	// 	}
	// 	cout << "end: " << item.first.second << " cost " << item.second << endl;
	// }

	int res = INF;
	for (int i = 1; i < n; ++i) {
		res = min(C[make_pair(S, i)] + path[i][0], res);
	}
	cout << res << endl;
	return res;
}

int main(int argc, char const *argv[])
{
	int H, W;
	int maxH = 0;
	scanf("%d %d", &H, &W);
	int size = H * W;
	vvii G(size);
	vi height;
	vi maxVs(1, 0);
	vvi path;
	char h;
	for (int i = 0; i < H; ++i) {
		scanf("\n");
		for (int j = 0; j < W; ++j) {
			scanf("%c", &h);
			maxH = max(maxH, h - '0');
			height.push_back(h - '0');
		}
	}
	for (int i = 0; i < size; ++i) {
		if (height[i] == maxH) maxVs.push_back(i);
	}

	for (int i = 0; i < size; ++i)
	{
		vi conn;
		if (i >= W) conn.push_back(i - W);
		if (i % W != 0) conn.push_back(i - 1);
		if (((i + 1) % W != 0) && (i + 1 < size)) conn.push_back(i + 1);
		if (i + W < size) conn.push_back(i + W);

		for (int j = 0; j < conn.size(); ++j) {
			int next = conn[j];
			int d = INF;
			if (height[i] == height[next]) {
				d = 3;
			} else if (height[i] - 1 == height[next]) {
				d = 2;
			} else if (height[i] + 1 == height[next]) {
				d = 11;
			}
			G[i].push_back(ii(next, d));
		}
	}
	printtime();
	path.resize(maxVs.size());
	for (int i = 0; i < maxVs.size(); ++i) {
		path[i].resize(maxVs.size());
		// for (int j = 0; j < maxVs.size(); ++j) {
			// if (i != j) path[i][j] = dijkstra(G, size, maxVs[i], maxVs[j]);
		// }
		dijkstra(G, size, maxVs[i], maxVs, &path[i]);
	}
	printtime();

	// for (int i = 0; i < size; ++i)
	// {
	// 	vii pos = G[i];
	// 	for (int j = 0; j < pos.size(); ++j)
	// 	{
	// 		cout << "from: " << i << " to " << pos[j].first << " cost " << pos[j].second << endl;
	// 	}
	// }
	// for (vi::iterator i = maxVs.begin(); i != maxVs.end(); ++i)
	// {
	// 	cout << *i << endl;
	// }

	// for (int i = 0; i < maxVs.size(); ++i) {
	// 	for (int j = 0; j < maxVs.size(); ++j) {
	// 		cout << i << " to " << j << " cost " << path[i][j] << endl;
	// 	}
	// }
	printtime();
	tsp(path, maxVs.size());
	printtime();
	return 0;
}