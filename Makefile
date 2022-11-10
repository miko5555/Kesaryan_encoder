all: create_directotys make_obj_File mv_obj gen_out_main creat_libry mv_lib exicute_main_file
	
create_directotys:
	@echo "create_directotys lib, obj "
	@mkdir -p lib obj
		
make_obj_File:
	@echo "make_obj_File"
	@c++ -c src/main.cpp src/source.cpp
mv_obj: main.o source.o
	@echo "move obj files"
	@mv main.o obj/
	@mv source.o obj/
gen_out_main:
	@echo "gen out file"
	@c++ obj/main.o obj/source.o -o bin/main
creat_libry:
	@echo "creat_libry"
	@ar -cvq libkesar.a obj/main.o obj/source.o
mv_lib: libkesar.a
	@echo "mv lib"
	@mv libkesar.a lib

exicute_main_file:
	@echo "exicute_main_file"
	@bin/./main
