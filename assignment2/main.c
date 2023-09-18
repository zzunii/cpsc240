#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern double manage();

int main()
{
    printf("\nWelcome to the Array Management System\n");
    printf("This product is maintained by Dylan Zuniga at zuniga18dz@csu.fullerton.edu\n \n");

    double result = manage();

    printf("\nThe main function received %lf and will keep it for a while.", result);
    printf("Please consider buying more software from our suite of commercial program.\n");
    printf("A zero will be returned to the operating system. Bye\n");

    return 0;
}