#include <stdio.h>

int main(void) {

	int n1,n2,n3,n4;
	
	scanf("%d%d%d",&n1,&n2,&n3);
	
	if(n1==n2
		&&
	   n1==n3){
	
		n4=10000+n1*1000;
		
	}
	else if(n1==n2){
	
		n4=1000+n1*100;
		
	}
	else if(n1==n3){
	
		n4=1000+n1*100;
		
	}else if(n2==n3){
	
		n4=1000+n2*100;
		
	}else{
	
		int n5=n1;
		
		if(n5<n2){
		
			n5=n2;

		}
		if(n5<n3){
		
			n5=n3;
		}
		
		n4=n5*100;
	}
	
	printf("%d\n",n4);
	
	return 0;
}
