#include <bits/stdc++.h>

using namespace std;

const int pig_num=15000;
const int day_num=119;
const int week_num=17; 
const int disease_num=5;
const int par_num=6+disease_num;
string tmpst;


double avg[par_num+5];
double cov[par_num+5][par_num+5];
struct Tnode
{
	int pigNumber;
	double temp[day_num+5];
	double humi[day_num+5];
	double feedweek[week_num+5];
	double breed;
	double blockCoeffienient;
	double parity;
	double disease[disease_num+5];
	double avg_temp;
	double var_temp;
	double avg_humi;
	double var_humi;
	double avg_feed;
	double var_feed;
	int amountOfPiglets;
	int amountOfHealthyPiglets;
	int home;
	double par[par_num+5];
	
} a[pig_num+disease_num];

bool equal(double a,double b)
{
	if (fabs(a-b)<1e-6) return true;
	return false;
}

bool temp_equal(Tnode a,Tnode b)
{
	for (int i=1;i<=day_num;i++)
	if (!equal(a.temp[i],b.temp[i])) return false;
	return true;
}

bool humi_equal(Tnode a,Tnode b)
{
	for (int i=1;i<=day_num;i++)
	if (!equal(a.humi[i],b.humi[i])) return false;
	return true;
}

bool temp_and_humi_equal(Tnode a,Tnode b)
{
	return (temp_equal(a,b) && humi_equal(a,b));
}

bool cmp(Tnode a,Tnode b)
{
	for (int i=1;i<=day_num;i++)
	if (!equal(a.temp[i],b.temp[i])) return a.temp[i]<b.temp[i];
	for (int i=1;i<=day_num;i++)
	if (!equal(a.humi[i],b.humi[i])) return a.humi[i]<b.humi[i];
	return a.pigNumber<b.pigNumber;
}

double sqr(double x)
{
	return x*x;
}

void build()
{
	for (int i=1;i<=pig_num;i++)
	{
		/*a[i].par[1]=a[i].avg_temp;
		a[i].par[2]=a[i].var_temp;
		a[i].par[3]=a[i].avg_humi;
		a[i].par[4]=a[i].var_humi;
		a[i].par[5]=a[i].avg_feed;
		a[i].par[6]=a[i].var_feed;
		a[i].par[7]=a[i].breed;
		a[i].par[8]=a[i].blockCoeffienient;
		a[i].par[9]=a[i].parity;
		for (int j=1;j<=disease_num;j++)
		{
			a[i].par[9+j]=a[i].disease[j];
		}*/
		a[i].par[1]=a[i].avg_temp;

		a[i].par[2]=a[i].avg_humi;

		a[i].par[3]=a[i].avg_feed;

		a[i].par[4]=a[i].breed;
		a[i].par[5]=a[i].blockCoeffienient;
		a[i].par[6]=a[i].parity;
		for (int j=1;j<=disease_num;j++)
		{
			a[i].par[6+j]=a[i].disease[j];
		}		
	}
}


void calc()
{
	
	for (int i=1;i<=par_num;i++)
	{
		avg[i]=0;
		for (int j=1;j<=pig_num;j++)
		{
			avg[i]+=a[j].par[i];	
		}
		avg[i]/=pig_num;
	}
	
	for (int i=1;i<=par_num;i++)
		for (int j=1;j<=par_num;j++)
		{
			double sum1=0,sum2=0,sum3=0;
			for (int k=1;k<=pig_num;k++)
			{
				sum1+=(a[k].par[i]-avg[i])*(a[k].par[j]-avg[j]);
				sum2+=sqr(a[k].par[i]-avg[i]);
				sum3+=sqr(a[k].par[j]-avg[j]);
			}
			cov[i][j]=sum1/sqrt(sum2*sum3);
		}
	
}
int main()
{
	freopen("a.in","r",stdin);
	freopen("相关性度量矩阵.txt","w",stdout);
	for (int i=1;i<=pig_num;i++)
	{
		scanf("%d",&a[i].pigNumber);
		for (int j=1;j<=day_num;j++) scanf("%lf",&a[i].temp[j]);
		for (int j=1;j<=day_num;j++) scanf("%lf",&a[i].humi[j]);
		for (int j=1;j<=week_num;j++) scanf("%lf",&a[i].feedweek[j]);
		scanf("%lf",&a[i].breed);
		scanf("%lf",&a[i].blockCoeffienient);
		scanf("%lf",&a[i].parity);
		for (int j=1;j<=disease_num;j++) scanf("%lf",&a[i].disease[j]);
		a[i].avg_temp=a[i].avg_humi=a[i].avg_feed=0;
		for (int j=1;j<=day_num;j++)
		{
			a[i].avg_temp+=a[i].temp[j];
			a[i].avg_humi+=a[i].humi[j];
		}
		a[i].avg_temp/=day_num;
		a[i].avg_humi/=day_num;
		for (int j=1;j<=day_num;j++)
		{
			a[i].var_temp+=sqr(a[i].temp[j]-a[i].avg_temp);
			a[i].var_humi+=sqr(a[i].humi[j]-a[i].avg_humi);
		}
		a[i].var_temp/=day_num;
		a[i].var_humi/=day_num;	
		
		a[i].avg_feed=a[i].var_feed=0;	
		for (int j=1;j<=week_num;j++)
		{
			a[i].avg_feed+=a[i].feedweek[j];
		}
		a[i].avg_feed/=week_num;
		for (int j=1;j<=week_num;j++)
		{
			a[i].var_feed+=sqr(a[i].feedweek[j]-a[i].avg_feed);
		}
		a[i].var_feed/=week_num;	
	}
	freopen("b.in","r",stdin);
	for (int i=1;i<=pig_num;i++)
	{
		int temp;
		cin >> temp;
		cin >> a[i].amountOfPiglets >> a[i].amountOfHealthyPiglets;
	}
	build();
	calc();
	for (int i=1;i<=par_num;i++)
	{
		for (int j=1;j<=par_num;j++)
		{
			printf("%10.7f ",cov[i][j]);
		}
		puts("");
	}
	 
	return 0;
}

