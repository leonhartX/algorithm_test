#include <map>
std::map<long int, int> memo;
int n = 22;

int solve(int used, int status)
{
	long int hash_key = used << n | status;
	auto itr = memo.find(hash_key);
	if (itr != memo.end())
	{
		return memo[hash_key];
	}
	if (used == n / 2)
	{
		return 1;
	}
	int num = used + 1;
	int space = num + 1;
	int result = 0;
	int l, r;
	for (int i = 0; i < n - space; i++)
	{
		l = 1 << i;
		r = l << space;
		if (((status & l) == 0) && ((status & r) == 0))
		{
			result += solve(num, status | l | r);
		}
	}
	memo[hash_key] = result;
	return result;
}

int main(int argc, char* argv[])
{
	int res = solve(0, 0);
	printf("%d\n", res);
}