#
# Note: CC, CPPFLAGS and LDFLAGS are set by the modules.
# Need a compiler and hdf5 modules loaded for this to work.
#

.SUFFIXES:
.SUFFIXES: .c .o

DEPS = allvars.h proto.h
OBJ = main.o allvars.o read_gadget.o get_nparticles.o linkedlist.o assigncell.o

.c.o: $(DEPS)
	$(CC) $(CPPFLAGS) -c $< -o $*.o


enclosedmass: $(OBJ)
	$(CC) -o $@ $^ $(CPPFLAGS) $(LDFLAGS)  # -lhdf5_hl -lhdf5

clean:
	\rm -f *.o read_gadget
