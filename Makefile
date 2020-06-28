obj: lex.obj.c obj.tab.c obj.tab.h
	gcc -c obj.tab.c lex.obj.c
	gcc -o objParser lex.obj.o obj.tab.o
	./objParser bookshelf.obj

mtl: lex.mtl.c mtl.tab.c mtl.tab.h
	gcc -c mtl.tab.c lex.mtl.c
	gcc -o mtlParser lex.mtl.o mtl.tab.o
	./mtlParser bookshelf.mtl

lex.obj.c: obj.l obj.tab.h
	flex -o lex.obj.c obj.l

lex.mtl.c: mtl.l mtl.tab.h
	flex -o lex.mtl.c mtl.l

obj.tab.c: obj.y
	bison -d obj.y

obj.tab.h: obj.y
	bison -d obj.y

mtl.tab.c: mtl.y
	bison -d mtl.y

mtl.tab.h: mtl.y
	bison -d mtl.y

clean:
	rm lex.*.c
	rm mtl.tab.*
	rm obj.tab.*
	rm *.o