.PHONY: clean

course: obj/course.o bin/course_lib.so
	g++ -o bin/course -Wl,-R . obj/course.o bin/course_lib.so

bin/course_lib.so: obj/course_lib.o
	g++ -o bin/course_lib.so -shared obj/course_lib.o

obj/course_lib.o: src/course_lib.cpp src/course_lib.h
	g++ -o obj/course_lib.o -fPIC -c src/course_lib.cpp

obj/course.o: src/course_lib.h src/main11.cpp
	g++ -o obj/course.o -c src/main11.cpp

clean:
	rm -f bin/*
	rm -f obj/*.o

