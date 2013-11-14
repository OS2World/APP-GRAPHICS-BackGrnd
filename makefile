backgrnd.exe: backgrnd.obj
	         gcc -o backgrnd.exe -Wall -Zomf -Zsys -O2 backgrnd.obj backgrnd.def

backgrnd.obj: backgrnd.c
	         gcc -o backgrnd.obj -c -Wall -Zomf -Zsys -O2 backgrnd.c
