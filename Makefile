# Makefile for sjasmplus created by Tygrys' hands.

GCC=gcc
CC=$(GCC)
GPP=g++
C++=$(GPP)

EXE=sjasmplus

CFLAGS=-O2 -DLUA_USE_LINUX -DMAX_PATH=PATH_MAX -Ilua5.1 -Itolua++
CXXFLAGS=$(CFLAGS)

#for Linux
#LDFLAGS="-ldl"

#sjasmplus object files
OBJS=devices.o directives.o io_snapshots.o io_trd.o lua_lpack.o lua_sjasm.o \
parser.o reader.o sjasm.o sjio.o support.o tables.o z80.o

#liblua objects
LUAOBJS= lua5.1/lapi.o lua5.1/lauxlib.o lua5.1/lbaselib.o lua5.1/lcode.o lua5.1/ldblib.o \
lua5.1/ldebug.o lua5.1/ldo.o lua5.1/ldump.o lua5.1/lfunc.o lua5.1/lgc.o lua5.1/linit.o \
lua5.1/liolib.o lua5.1/llex.o lua5.1/lmathlib.o lua5.1/lmem.o lua5.1/loadlib.o \
lua5.1/lobject.o lua5.1/lopcodes.o lua5.1/loslib.o lua5.1/lparser.o lua5.1/lstate.o \
lua5.1/lstring.o lua5.1/lstrlib.o lua5.1/ltable.o lua5.1/ltablib.o lua5.1/ltm.o \
lua5.1/lundump.o lua5.1/lvm.o lua5.1/lzio.o

# tolua objects
TOLUAOBJS=tolua++/tolua_event.o tolua++/tolua_is.o tolua++/tolua_map.o \
tolua++/tolua_push.o tolua++/tolua_to.o


all: $(LUAOBJS) $(TOLUAOBJS) $(OBJS)
	$(GPP) -o $(EXE) $(LDFLAGS) $(CXXFLAGS) $(OBJS) $(LUAOBJS) $(TOLUAOBJS)

.c.o:
	$(GCC) $(CFLAGS) -o $@ -c $< 
.cpp.o:
	$(GPP) $(CFLAGS) -o $@ -c $<

clean:
	rm -vf *.o *.o lua5.1/*.o tolua++/*.o *~ $(EXE)