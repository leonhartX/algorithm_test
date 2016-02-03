#include <iostream>
#include <cstdlib>

using namespace std;

int a[200];
int top = 0;
void push(int num)
{
	a[++top] = num;
}

int pop()
{
	top--;
	return a[top + 1];
}

int main(int argc, char const *argv[])
{
	int x, y;
	char c[80];
	while(cin >> c)
	{
		switch(c[0])
		{
			case '+':
				y = pop();
				x = pop();
				push(x + y);
				break;
			case '-':
				y = pop();
				x = pop();
				push(x - y);
				break;
			case '*':
				y = pop();
				x = pop();
				push(x * y);
				break;
			default:
				push(atoi(c));
		}
	}
	cout << pop() << endl;
	return 0;
}