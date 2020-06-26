all: lex.yy.c y.tab.c y.tab.h
	gcc -o Testing -g lex.yy.c y.tab.c

lex.yy.c: obj.l y.tab.h
	flex -I obj.l

y.tab.c: obj.y
	bison -d obj.y

y.tab.h: obj.y
	bison -d obj.y

clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h

run: all
	./Testing bookshelf.obj