char *string = "....";
char *s = &string[0];
int   length = 0;
while (*s != '\0') {
   length++;  // increment length
   s++;       // move to next char
}

// char *s ++ => s += 1
// int *x ++ => x += 4
