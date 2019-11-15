cc = gcc
src_files = $(wildcard *.c)
#obj1_files = $(wildcard *.o) ERROR!!!
obj1_files = DIO.o LCD.o main.o
dep_files = DIO.d LCD.d main.d
link_target = main.exe
clean_target = $(link_target) $(obj1_files)

#paths
vpath %.c ./src
inc_path = ./inc
dep_path = ./dependencies

-include $(dep_files)

#compile 
%.o : %.c
	$(cc) -c  -I$(inc_path) $< -o $@
	$(cc) -MM -I$(inc_path) $< > $(dep_path)\$*.d
	mv *.d $(dep_path)

#link
$(link_target): $(obj1_files)
	$(cc) $^ -o $@

clean:
	rm $(clean_target) $(dep_path)/*.d