#include <stdio.h>
#include <assert.h>

int add(int a, int b);

int main(void)
{
	printf("Running unit tests...\n");

	// Assert-based testing (fails and exits with non-zero if false)
	assert(add(2, 3) == 5);
	assert(add(-1, 1) == 0);
	assert(add(0, 0) == 0);

	printf("All tests passed successfully!\n");
	return 0;
}
