#include<stdio.h>
#include<sys/time.h>
#include<unistd.h>
int main()
{
	struct timeval tv;
	struct timezone tz;
	
	while(true)
	{
		gettimeofday(&tv,NULL);
		printf("tv_sec:%ld\n",tv.tv_sec);
		printf("tv_msec:%ld\n",tv.tv_usec/1000);
		printf("time:%ld\n",tv.tv_sec*1000+tv.tv_usec/1000);
		sleep(2);

	}
	
}

/*
    struct timeval tv;
    long long int begin,end,dura;

    gettimeofday(&tv,NULL);
    long long int begin=tv.tv_sec*1000+tv.tv_usec/1000;  //起始时间毫秒
*/
