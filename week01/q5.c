#include <stdio.h>

int main(void) {
  int i = 0;
  while (i < 10) {
    printf("%d\n", i);
    i++;
  }

  printf("for loop\n");
  int j;
  for (j = 0; j < 10; j++) {
	printf("%d\n", j);
  }

  printf("last_num=%d\n", j);
  return 0;
}
