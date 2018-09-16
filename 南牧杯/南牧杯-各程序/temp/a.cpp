#include <bits/stdc++.h>

using namespace std;

int main()
{
	freopen("a.in","r",stdin);
	//freopen("a.out","w",stdout);
	double x;
	double Min=2147483647;
	double Max=-10;
	while (scanf("%lf",&x)!=EOF)
	{
		Max=max(Max,x);
		Min=min(Min,x);
	}
	printf("%f",(Max-Min)/9+Min);
	return 0;
}

