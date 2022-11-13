DIR1 = lib
DIR2 = obj
LIB1=lib
LIB1 +=kesar

all: create_directotys make_$(DIR2)_File mv_$(DIR2) gen_out_main creat_libry mv_$(DIR1) create_static_libry exicute_main_file
	
create_directotys:
	@echo "create_directotys $(DIR1), $(DIR2) "
	@mkdir -p $(DIR1) $(DIR2)
		
make_obj_File:
	@echo "make_obj_File"
	@c++ -c -fPIC src/main.cpp src/source.cpp
mv_$(DIR2): main.o source.o
	@echo "move $(DIR2) files"
	@mv main.o $(DIR2)/
	@mv source.o $(DIR2)/
gen_out_main:
	@echo "gen out file"
	@c++ $(DIR2)/main.o $(DIR2)/source.o -o bin/main
creat_libry:
	@echo "creat_libry"
	@ar -cvq libkesar.a $(DIR2)/main.o $(DIR2)/source.o
mv_lib: libkesar.a
	@echo "mv $(LIB1) $(DIR2)"
	@mv libkesar.a $(DIR1)
create_static_libry:
	@g++ -shared -fPIC obj/main.o -L $(DIR1) -lkesar -o $(DIR1)/a -o $(DIR1)/kesar.so
exicute_main_file:
	@echo "exicute_main_file"
	@bin/./main
