#include "put.h"
void handle_s(){
	static int intnum=0;
	intnum++;
	if(intnum%100==0){
		puts("[S] Supervisor Mode Timer Interrupt ");
		puti(intnum/100);
		puts("\n");
	}
	return;
}
