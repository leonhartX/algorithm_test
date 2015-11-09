#include <iostream>
#include <vector>
#include <string>
#include <cstring>
#include <algorithm>
#include <sstream>
#include <map>
#include <set>
 
#define REP(i,k,n) for(int i=k;i<n;i++)
#define rep(i,n) for(int i=0;i<n;i++)
#define pb push_back
#define mp make_pair
 
using namespace std;
typedef pair<int,int> P;
 
struct BIT {
    vector<int> bit;
 
    BIT(int n) : bit(n+1) {}
 
    int sum(int i) {
        int s = 0;
        while(i > 0) {
            s += bit[i];
            i -= i & -i;
        }
        return s;
    }
 
    void add(int i,int x) {
        while(i <= bit.size()) {
            bit[i] += x;
            i += i & -i;
        }
    }
};
 
int main() {
    int n;
    cin >> n;
 
    BIT bit(200005);
    rep(i,n) {
        int t,x;
        cin >> t >> x;
 
        if(t == 1) {
            bit.add(x,1);
        } else {
            int l = 0, r = 200005;
            while(r - l > 1) {
                int mid = (l+r) / 2;
                if(bit.sum(mid) < x) {
                    l = mid;
                } else {
                    r = mid;
                }
            }
 
            cout << l + 1 << endl;
 
            bit.add(l+1,-1);
        }
    }
 
 
    return 0;
}