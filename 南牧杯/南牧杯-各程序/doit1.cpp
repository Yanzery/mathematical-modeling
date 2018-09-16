#include <bits/stdc++.h>

using namespace std;

const int pig_num=15000;

string tmpst;

struct Tnode
{
	int pigNumber;
	double temp[120];
	double humi[120];
	double feedweek[20];
	double breed;
	double blockCoeffienient;
	double parity;
	double disease[10];
	int amountOfPiglets;
	int amountOfHealthyPiglets;
	int home;
} a[pig_num+5];

bool equal(double a,double b)
{
	if (fabs(a-b)<1e-6) return true;
	return false;
}

bool temp_equal(Tnode a,Tnode b)
{
	for (int i=1;i<=119;i++)
	if (!equal(a.temp[i],b.temp[i])) return false;
	return true;
}

bool humi_equal(Tnode a,Tnode b)
{
	for (int i=1;i<=119;i++)
	if (!equal(a.humi[i],b.humi[i])) return false;
	return true;
}

bool temp_and_humi_equal(Tnode a,Tnode b)
{
	return (temp_equal(a,b) && humi_equal(a,b));
}

bool cmp(Tnode a,Tnode b)
{
	for (int i=1;i<=119;i++)
	if (!equal(a.temp[i],b.temp[i])) return a.temp[i]<b.temp[i];
	for (int i=1;i<=119;i++)
	if (!equal(a.humi[i],b.humi[i])) return a.humi[i]<b.humi[i];
	return a.pigNumber<b.pigNumber;
}

int main()
{
	freopen("a.in","r",stdin);
	freopen("a.out","w",stdout);
	for (int i=1;i<=pig_num;i++)
	{
		scanf("%d",&a[i].pigNumber);
		for (int j=1;j<=119;j++) scanf("%lf",&a[i].temp[j]);
		for (int j=1;j<=119;j++) scanf("%lf",&a[i].humi[j]);
		for (int j=1;j<=17;j++) scanf("%lf",&a[i].feedweek[j]);
		scanf("%lf",&a[i].breed);
		scanf("%lf",&a[i].blockCoeffienient);
		scanf("%lf",&a[i].parity);
		for (int j=1;j<=5;j++) scanf("%lf",&a[i].disease[j]);
	}
	freopen("b.in","r",stdin);
	for (int i=1;i<=pig_num;i++)
	{
		int temp;
		cin >> temp;
		cin >> a[i].amountOfPiglets >> a[i].amountOfHealthyPiglets;
	}
	
	sort(a+1,a+pig_num+1,cmp);
	int id=0;
	for (int i=1;i<=pig_num;i++)
	{
		if ((i==1) || (!temp_and_humi_equal(a[i],a[i-1]))) id++;
		a[i].home=id;
	}
	printf("猪场号  猪号  ");
	for (int i=1;i<=17;i++) 
	{
		if (i<10) printf("第0%d周饲料  ",i);
		else
		printf("第%d周饲料  ",i);
	}
	printf("   种类    肥瘦   胎次   ");
	for (int i=1;i<=5;i++) 
	printf("第%d种病  ",i);
	printf("总仔数  健仔数\n");
	for (int i=1;i<=pig_num;i++)
	{
		if ((i!=1) && a[i].home!=a[i-1].home)
		{
			for (int j=1;j<=1000;j++) printf("-");
			puts(""); 
		}
		printf("%3d    ",a[i].home);
		printf("%3d   ",a[i].pigNumber);
		for (int j=1;j<=17;j++) 
		{
			printf("%3.2f        ",a[i].feedweek[j]);
		}
		printf(" %3.2f  ",a[i].breed);
		printf(" %3.2f  ",a[i].blockCoeffienient);
		printf(" %3.2f",a[i].parity);
		for (int j=1;j<=5;j++) printf("     %3.2f",a[i].disease[j]);
		printf("    %3d",a[i].amountOfPiglets);
		printf("     %3d   ",a[i].amountOfHealthyPiglets);
		printf("\n");
	}
	 
	return 0;
}

