#include <stdio.h>

int add(int a, int b)
{
	return a + b;
}

#ifndef TESTING
int main(void)
{
	printf("Hello, CI/CD! 2 + 3 = %d\n", add(2, 3));
	return 0;
}
#endif
