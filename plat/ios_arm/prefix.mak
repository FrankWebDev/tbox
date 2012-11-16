# architecture makefile configure

# prefix & suffix
BIN_PREFIX 			= 
BIN_SUFFIX 			= .b

OBJ_PREFIX 			= 
OBJ_SUFFIX 			= .o
	
LIB_PREFIX 			= lib
LIB_SUFFIX 			= .a
	
DLL_PREFIX 			= lib
DLL_SUFFIX 			= .so

ASM_SUFFIX 			= .S

# toolchain
PRE 				= xcrun -sdk iphoneos 
CC 					= $(PRE)gcc 
MM 					= $(PRE)gcc
AR 					= $(PRE)ar
STRIP 				= $(PRE)strip
RANLIB 				= $(PRE)ranlib
LD 					= $(PRE)gcc
AS					= $(PLAT_DIR)/gas-preprocessor.pl $(PRE)gcc
RM 					= rm -f
RMDIR 				= rm -rf
CP 					= cp
CPDIR 				= cp -r
MKDIR 				= mkdir -p
MAKE 				= make
PWD 				= pwd

# cxflags: .c/.cc/.cpp files
CXFLAGS_RELEASE 	= \
					-O3 -DNDEBUG \
					-fomit-frame-pointer -freg-struct-return -fno-bounds-check \
					-fvisibility=hidden

CXFLAGS_DEBUG 		= -g 
CXFLAGS 			= -arch $(ARCH) -D__$(ARCH)__ -c -Wall  \
					-mthumb -mcpu=cortex-a8 -miphoneos-version-min=$(SDK) \
					-fmessage-length=0  -Wreturn-type -Wunused-variable \
					-pipe -Wno-trigraphs -fpascal-strings \
					--sysroot=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS$(SDK).sdk
CXFLAGS-I 			= -I
CXFLAGS-o 			= -o

# cflags: .c files
CFLAGS_RELEASE 		= 
CFLAGS_DEBUG 		= 
CFLAGS 				= -std=gnu99

# ccflags: .cc/.cpp files
CCFLAGS_RELEASE 	= -fno-rtti
CCFLAGS_DEBUG 		= 
CCFLAGS 			= 

# mxflags: .m/.mm files
MXFLAGS_RELEASE 	= \
					-O3 -DNDEBUG \
					-fomit-frame-pointer -freg-struct-return -fno-bounds-check \
					-fvisibility=hidden

MXFLAGS_DEBUG 		= -g -DDEBUG=1
MXFLAGS 			= -arch $(ARCH) -D__$(ARCH)__  -c -Wall  \
					-mthumb -mcpu=cortex-a8 -miphoneos-version-min=$(SDK) \
					-fmessage-length=0  -Wreturn-type -Wunused-variable \
					-pipe -Wno-trigraphs -fpascal-strings \
					"-DIBOutlet=__attribute__((iboutlet))" \
					"-DIBOutletCollection(ClassName)=__attribute__((iboutletcollection(ClassName)))" \
					"-DIBAction=void)__attribute__((ibaction)" \
					--sysroot=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS$(SDK).sdk
MXFLAGS-I 			= -I
MXFLAGS-o 			= -o

# mflags: .m files
MFLAGS_RELEASE 		= 
MFLAGS_DEBUG 		= 
MFLAGS 				= -std=gnu99

# mmflags: .mm files
MMFLAGS_RELEASE 	= 
MMFLAGS_DEBUG 		=	 
MMFLAGS 			=

# ldflags
LDFLAGS_RELEASE 	=
LDFLAGS_DEBUG 		= 
LDFLAGS 			= -arch $(ARCH) \
					-isysroot /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS$(SDK).sdk \
					--sysroot=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS$(SDK).sdk
LDFLAGS-L 			= -L
LDFLAGS-l 			= -l
LDFLAGS-o 			= -o

# asflags
ASFLAGS_RELEASE 	= 
ASFLAGS_DEBUG 		= 
ASFLAGS 			= -arch $(ARCH) -c -fPIC
ASFLAGS-I 			= -I
ASFLAGS-o 			= -o

# arflags
ARFLAGS 			= -cr

# share ldflags
SHFLAGS 			= -dynamiclib -Wl,-single_module

# config
include 			$(PLAT_DIR)/config.mak


