# 1 "src/main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "src/main.c"

# 1 "/home/gduale/gba/ham/include/hel2.h" 1
# 43 "/home/gduale/gba/ham/include/hel2.h"
# 1 "/home/gduale/gba/ham/include/mygba.h" 1
# 141 "/home/gduale/gba/ham/include/mygba.h"
# 1 "/home/gduale/gba/ham/include/krawall.h" 1
# 18 "/home/gduale/gba/ham/include/krawall.h"
# 1 "/home/gduale/gba/ham/include/mtypes.h" 1
# 15 "/home/gduale/gba/ham/include/mtypes.h"
typedef __attribute__ ((packed)) struct {
        unsigned long loopLength;
        unsigned long end;
        unsigned short c2Freq;
        unsigned char volDefault;
        unsigned char looped;
        unsigned char hq;
        signed char data[1];
} Sample;

typedef __attribute__ ((packed)) struct {
        unsigned short index[ 16 ];
        unsigned char data[1];
} Pattern;

typedef __attribute__ ((packed)) struct {
        unsigned char numOrders;
        unsigned char order[ 256 ];

        unsigned char channels;
        signed char channelPan[ 32 ];

        unsigned char songIndex[ 64 ];

        unsigned char volGlobal;

        unsigned char initSpeed;
        unsigned char initTempo;

        unsigned char flagVolOpt;
        unsigned char flagVolSlides;
        unsigned char flagAmigaLimits;

        const Pattern* patterns[1];
} Module;

extern const Sample* const samples[];
# 19 "/home/gduale/gba/ham/include/krawall.h" 2

typedef unsigned int chandle;
# 43 "/home/gduale/gba/ham/include/krawall.h"
void kragInit( int stereo );
# 57 "/home/gduale/gba/ham/include/krawall.h"
void krapPlay( const Module *m, int mode, int song );
# 67 "/home/gduale/gba/ham/include/krawall.h"
void krapStop();
# 83 "/home/gduale/gba/ham/include/krawall.h"
void krapCallback( void (*func)( int, int ) );
# 97 "/home/gduale/gba/ham/include/krawall.h"
void krapPause( int sfx );






void krapUnpause();
# 113 "/home/gduale/gba/ham/include/krawall.h"
int krapIsPaused();
# 128 "/home/gduale/gba/ham/include/krawall.h"
void krapSetMusicVol( unsigned int vol, int fade );
# 138 "/home/gduale/gba/ham/include/krawall.h"
int kramWorker() __attribute__ ((long_call));






int kramGetActiveChannels();







void kramQualityMode( int );
# 167 "/home/gduale/gba/ham/include/krawall.h"
chandle kramPlay( const Sample *s, int sfx, chandle c ) __attribute__ ((long_call));
# 181 "/home/gduale/gba/ham/include/krawall.h"
chandle kramPlayExt( const Sample *s, int sfx, chandle c, unsigned int freq, unsigned int vol, int pan ) __attribute__ ((long_call));
# 190 "/home/gduale/gba/ham/include/krawall.h"
int kramStop( chandle c ) __attribute__ ((long_call));
# 200 "/home/gduale/gba/ham/include/krawall.h"
int kramSetFreq( chandle c, unsigned int freq ) __attribute__ ((long_call));
# 210 "/home/gduale/gba/ham/include/krawall.h"
int kramSetVol( chandle c, unsigned int vol ) __attribute__ ((long_call));
# 220 "/home/gduale/gba/ham/include/krawall.h"
int kramSetPan( chandle c, int pan ) __attribute__ ((long_call));
# 234 "/home/gduale/gba/ham/include/krawall.h"
int kramSetPos( chandle c, unsigned int pos ) __attribute__ ((long_call));






void kramSetSFXVol( unsigned int vol );







void kramSetMasterVol( unsigned int vol );






void kradInterrupt();





void kradActivate();







void kradDeactivate();
# 142 "/home/gduale/gba/ham/include/mygba.h" 2
# 196 "/home/gduale/gba/ham/include/mygba.h"
# 1 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stdarg.h" 1 3 4
# 43 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 110 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 197 "/home/gduale/gba/ham/include/mygba.h" 2
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 1 3
# 10 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/_ansi.h" 1 3
# 15 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/_ansi.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/newlib.h" 1 3
# 16 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/_ansi.h" 2 3
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/config.h" 1 3



# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/machine/ieeefp.h" 1 3
# 5 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/config.h" 2 3
# 17 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/_ansi.h" 2 3
# 11 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 2 3



# 1 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 1 3 4
# 213 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 325 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 3 4
typedef int wchar_t;
# 15 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 2 3

# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 1 3
# 14 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/_types.h" 1 3
# 12 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/_types.h" 3
typedef long _off_t;
__extension__ typedef long long _off64_t;


typedef int _ssize_t;





# 1 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 1 3 4
# 354 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 23 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/_types.h" 2 3


typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;

typedef int _flock_t;
# 15 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 2 3




typedef unsigned long __ULong;
# 40 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};
# 68 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
struct _atexit {
        struct _atexit *_next;
        int _ind;
        void (*_fns[32])(void);
        void *_fnargs[32];
        __ULong _fntypes;
};
# 91 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
struct __sbuf {
        unsigned char *_base;
        int _size;
};






typedef long _fpos_t;
# 156 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (void * _cookie, char *_buf, int _n);
  int (*_write) (void * _cookie, const char *_buf, int _n);

  _fpos_t (*_seek) (void * _cookie, _fpos_t _offset, int _whence);
  int (*_close) (void * _cookie);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

};
# 249 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
typedef struct __sFILE __FILE;


struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 280 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 532 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 728 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 17 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 2 3
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/machine/stdlib.h" 1 3
# 18 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 2 3

# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/alloca.h" 1 3
# 20 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 2 3




typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 45 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 3
extern int __mb_cur_max;



void abort (void) __attribute__ ((noreturn));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);

float atoff (const char *__nptr);

int atoi (const char *__nptr);
long atol (const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* _compar) (const void *, const void *));




void * calloc (size_t __nmemb, size_t __size);
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((noreturn));
void free (void *);
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);
long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size);
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *, const char *, size_t);
int _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *, const char *, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t wcstombs (char *, const wchar_t *, size_t);
size_t _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);


int mkstemp (char *);
char * mktemp (char *);


void qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int rand (void);
void * realloc (void * __r, size_t __size);
void srand (unsigned __seed);
double strtod (const char *__n, char **__end_PTR);
double _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float strtof (const char *__n, char **__end_PTR);






long strtol (const char *__n, char **__end_PTR, int __base);
long _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int system (const char *__string);


long a64l (const char *__input);
char * l64a (long __input);
char * _l64a_r (struct _reent *,long __input);
int on_exit (void (*__func)(int, void *),void * __arg);
void _Exit (int __status) __attribute__ ((noreturn));
int putenv (const char *__string);
int _putenv_r (struct _reent *, const char *__string);
int setenv (const char *__string, const char *__value, int __overwrite);
int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);

char * gcvt (double,int,char *);
char * gcvtf (float,int,char *);
char * fcvt (double,int,int *,int *);
char * fcvtf (float,int,int *,int *);
char * ecvt (double,int,int *,int *);
char * ecvtbuf (double, int, int*, int*, char *);
char * fcvtbuf (double, int, int*, int*, char *);
char * ecvtf (float,int,int *,int *);
char * dtoa (double, int, int, int *, int*, char**);
int rand_r (unsigned *__seed);

double drand48 (void);
double _drand48_r (struct _reent *);
double erand48 (unsigned short [3]);
double _erand48_r (struct _reent *, unsigned short [3]);
long jrand48 (unsigned short [3]);
long _jrand48_r (struct _reent *, unsigned short [3]);
void lcong48 (unsigned short [7]);
void _lcong48_r (struct _reent *, unsigned short [7]);
long lrand48 (void);
long _lrand48_r (struct _reent *);
long mrand48 (void);
long _mrand48_r (struct _reent *);
long nrand48 (unsigned short [3]);
long _nrand48_r (struct _reent *, unsigned short [3]);
unsigned short *
       seed48 (unsigned short [3]);
unsigned short *
       _seed48_r (struct _reent *, unsigned short [3]);
void srand48 (long);
void _srand48_r (struct _reent *, long);
long long strtoll (const char *__n, char **__end_PTR, int __base);
long long _strtoll_r (struct _reent *, const char *__n, char **__end_PTR, int __base);
unsigned long long strtoull (const char *__n, char **__end_PTR, int __base);
unsigned long long _strtoull_r (struct _reent *, const char *__n, char **__end_PTR, int __base);


void cfree (void *);
# 172 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t);
void * _calloc_r (struct _reent *, size_t, size_t);
void _free_r (struct _reent *, void *);
void * _realloc_r (struct _reent *, void *, size_t);
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 213 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdlib.h" 3

# 198 "/home/gduale/gba/ham/include/mygba.h" 2
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/string.h" 1 3
# 14 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/string.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 1 3 4
# 15 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/string.h" 2 3







void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void *, const void *, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *, const char *);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *, const char *);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *, const char *, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *, const char *, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);


char *strtok (char *, const char *);


size_t strxfrm (char *, const char *, size_t);


char *strtok_r (char *, const char *, char **);

int bcmp (const void *, const void *, size_t);
void bcopy (const void *, void *, size_t);
void bzero (void *, size_t);
int ffs (int);
char *index (const char *, int);
void * memccpy (void *, const void *, int, size_t);
void * mempcpy (void *, const void *, size_t);
char *rindex (const char *, int);
int strcasecmp (const char *, const char *);
char *strdup (const char *);
char *_strdup_r (struct _reent *, const char *);
char *strndup (const char *, size_t);
char *_strndup_r (struct _reent *, const char *, size_t);
char *strerror_r (int, char *, size_t);
size_t strlcat (char *, const char *, size_t);
size_t strlcpy (char *, const char *, size_t);
int strncasecmp (const char *, const char *, size_t);
size_t strnlen (const char *, size_t);
char *strsep (char **, const char *);
char *strlwr (char *);
char *strupr (char *);
# 98 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/string.h" 3

# 199 "/home/gduale/gba/ham/include/mygba.h" 2
# 294 "/home/gduale/gba/ham/include/mygba.h"
typedef unsigned char bool;

typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned int u32;
typedef unsigned long long int u64;

typedef signed char s8;
typedef signed short int s16;
typedef signed int s32;
typedef signed long long int s64;

typedef volatile unsigned char vu8;
typedef volatile unsigned short int vu16;
typedef volatile unsigned int vu32;
typedef volatile unsigned long long int vu64;

typedef volatile signed char vs8;
typedef volatile signed short int vs16;
typedef volatile signed int vs32;
typedef volatile signed long long int vs64;



typedef s16 sfp16;
typedef s32 sfp32;
typedef u16 ufp16;
typedef u32 ufp32;
# 442 "/home/gduale/gba/ham/include/mygba.h"
extern u32 IntrTable[];
# 3511 "/home/gduale/gba/ham/include/mygba.h"
extern volatile u8 _hamlib_intset;
# 3630 "/home/gduale/gba/ham/include/mygba.h"
extern int dsprintf(char *,const char*, ...);
extern void __PrintStr(char *);

extern unsigned char __outstr[];
extern unsigned char __finstr[];
extern unsigned char __kinstr[];
extern int finptr;
extern int foutptr;
extern int kinptr;
extern int koutptr;
# 3661 "/home/gduale/gba/ham/include/mygba.h"
extern int dgetch (void);


extern u8 _hamlib_assert_to_dbgshow;
# 3679 "/home/gduale/gba/ham/include/mygba.h"
extern void dbg_Show(char*);
# 3709 "/home/gduale/gba/ham/include/mygba.h"
typedef struct tile_info_typ
{
    u16 col_mode;
        u8 first_block;
    u8 offset_from_cbb;
    u8 cbb;
} tile_info,*tile_info_ptr;

typedef struct map_info_typ
{
    u8 first_block;
    u8 map_rot;
    u16 map_size;
        u16 map_x;
        u16 map_y;
} map_info,*map_info_ptr;

typedef struct map_fragment_info_typ
{
    u16* src;
    u16* src_ofs;
    u8 map_rot;
        u16 map_total_x;
        u16 map_total_y;
        u16 map_ofs_x;
        u16 map_ofs_y;
        u16 map_tiles_x;
        u16 map_tiles_y;
        u16 map_line_ofs;

} map_fragment_info,*map_fragment_info_ptr;





extern tile_info_ptr ham_InitTileSet(void* src,u16 size_u16,u8 col_mode,u8 cbb_only_mode);
extern tile_info_ptr ham_InitTileEmptySet(u16 num_tiles, u8 col_mode, u8 cbb_only_mode);
extern map_info_ptr ham_InitMapEmptySet(u8 map_size,u8 map_rot);
extern map_info_ptr ham_InitMapSet(void* src,u16 size_u16,u8 map_size,u8 map_rot);
extern void ham_SetMapTile(u8 bgno,u32 x,u32 y,u32 tileno);
extern void ham_SetMapTileEx(u8 bgno,u32 x,u32 y,u32 tileno,u32 hflip, u32 vflip, u32 palno);
extern u16 ham_GetMapTile(u8 bgno,u8 x,u8 y);
extern void ham_ReloadTileGfx(tile_info_ptr ti, u16* src,u16 target_tileno,u16 num_tiles);
extern map_fragment_info_ptr ham_InitMapFragment(void* src,
                                                                                  u16 map_total_x,u16 map_total_y,
                                          u16 map_ofs_x, u16 map_ofs_y,
                                          u8 map_tiles_x,u8 map_tiles_y,
                                          u8 map_rot);
extern void ham_InsertMapFragment(map_fragment_info_ptr mfi,u8 bgno,u8 x,u8 y);
extern void ham_DeInitTileSet(tile_info_ptr ti);
extern void ham_DeInitMapSet(map_info_ptr mi);
extern void ham_DeInitMapFragment(map_fragment_info_ptr mfi);





extern void ham_SetFxMode(u16 source_layer, u16 target_layer, u16 fx_mode);
extern void ham_SetFxAlphaLevel(u16 source_intensity,u16 target_intensity);
extern void ham_SetFxBrightnessLevel(u16 intensity);
# 3780 "/home/gduale/gba/ham/include/mygba.h"
typedef struct obj_info_typ
{
        u8 taken;
    u8 active;
        u16 objatr0;
        u16 objatr1;
        u16 objatr2;
        u8 prev_obj;
        u8 next_obj;
} obj_info,*obj_info_ptr;




extern obj_info ham_obj[];
extern u8 ham_obj_first;




extern void ham_InitObj(void);
extern void ham_ResetObj(void);
extern void ham_DeleteObj(u8 entryno);
extern u8 ham_CreateObj(void* src,u16 obj_shape,u16 obj_size,u16 obj_mode,u16 col_mode,u16 pal_no ,u16 mosaic,u16 hflip,u16 vflip,u16 prio, u16 dbl_size, u16 x, u16 y);
extern u8 ham_CreateObjFromGfxSlot(u16 slot,u16 obj_shape,u16 obj_size,u16 obj_mode,u16 col_mode,u16 pal_no ,u16 mosaic,u16 hflip,u16 vflip,u16 prio, u16 dbl_size, u16 x, u16 y);
extern u8 ham_CreateObjFromBg(u8 bgno, u32 bg_tileno_x, u32 bg_tileno_y, u16 obj_shape,u16 obj_size, u32 erase_bg, u32 tileno_filler);
extern u16 ham_CreateObjGfx(void* src,u16 obj_shape,u16 obj_size,u16 col_mode);
extern void ham_DeleteObjGfx(u16 slotno);
extern u8 ham_CloneObj(u8 objno, u16 x, u16 y);
extern void ham_SetObjMode(u8 objno,u16 obj_mode);
extern void ham_SetObjX(u8 objno,u16 x);
extern void ham_SetObjY(u8 objno,u16 y);
extern void ham_SetObjXY(u8 objno,u16 x,u16 y);
extern void ham_SetObjMosaic(u8 objno,u8 val);
extern void ham_SetObjDblSize(u8 objno,u8 val);
extern void ham_SetObjHFlip(u8 objno,u8 val);
extern void ham_SetObjVFlip(u8 objno,u8 val);
extern void ham_SetObjPrio(u8 objno,u8 val);
extern void ham_SetObjVisible(u8 objno,u8 val);
extern void ham_SetObjRotEnable(u8 objno,u8 val);
extern void ham_SetObjRotSetSelect(u8 objno,u8 val);
extern void ham_UpdateObjGfx(u8 objno,void* src);
extern u16 ham_GetObjGfxSlot(u8 objno);
extern u8 ham_GetObjPal16(u8 objno);
extern void ham_SetObjGfxSlot(u8 objno,u16 slotno,u8 palno);
extern void ham_UpdateObjPal16(u8 objno,u8 pal_no);
extern void ham_SetObjBefore(u8 objno,u8 objno_target);
extern void ham_CopyObjToOAM(void);
extern u32 ham_GetObjAvailable(void);
# 3837 "/home/gduale/gba/ham/include/mygba.h"
typedef struct bg_info_typ
{
        map_info_ptr mi;
        tile_info_ptr ti;
    u16 mosaic;
    u16 active;
    u16 prio;
        u8 is_rot_bg;
        s16 x_scroll;
        s16 y_scroll;
} bg_info,*bg_info_ptr;




extern bg_info ham_bg[];




extern void ham_InitBg( u16 bgno, u16 active, u16 prio, u16 mosaic);
extern void ham_ResetBg(void);
extern u8 ham_GetBgType(u8 bgno);
extern void ham_SetBgMode(u8 bgmode);
extern void ham_SetBgVisible(u32 bgno,u32 active);
extern void ham_DeInitBg( u16 bgno);
extern void ham_SetBgXY(u16 bgno,u16 x, u16 y);







extern void ham_PutPixel(u32 x,u32 y,u32 col_value);
extern void ham_PutLine(s16 x1, s16 y1, s16 x2, s16 y2, u16 col_value);
extern void ham_LoadBitmap(void* src);
extern void ham_ClearBackBuffer(u32 col_value);
extern void ham_FlipBGBuffer(void);
extern u8 ham_GetBGBuffer(void);
# 3886 "/home/gduale/gba/ham/include/mygba.h"
typedef struct win_info_typ
{
    u32 x1;
    u32 y1;
    u32 x2;
    u32 y2;
    u32 inside_on_for;

    u32 outside_on_for;

    u32 fx_on;
} win_info,*win_info_ptr;




extern win_info ham_win[];




extern void ham_InitWin(void);
extern void ham_CopyWinToHW(void);
extern void ham_CreateWin(u32 winno,u32 x1,u32 y1,u32 x2,u32 y2,u32 inside_on_for,u32 outside_on_for,u32 fx_on);
extern void ham_DeleteWin(u32 winno);






extern const s32 SIN_SFP32[];
extern const s32 COS_SFP32[];



extern void ham_RotBg(u8 bgno,u16 angle,s32 center_x,s32 center_y, s32 zoom);
extern void ham_RotBgEx(u8 bgno,u16 angle,s32 center_x,s32 center_y, u16 x_scroll, u16 y_scroll, s32 zoom_x, s32 zoom_y);
extern void ham_RotObjDefineSet(u8 rotset,u16 angle, s32 zoom_x, s32 zoom_y);







extern char* HexToChar(u32 hexval);
extern int CharToHex(char* thestr);
# 3944 "/home/gduale/gba/ham/include/mygba.h"
typedef struct text_info_typ
{
    bg_info_ptr bg;
        map_info_ptr mi;
        tile_info_ptr ti;
        u8 front_col;
        u8 back_col;
        u8 bgno;
} text_info,*text_info_ptr;




extern text_info_ptr ham_text;
# 3971 "/home/gduale/gba/ham/include/mygba.h"
extern void ham_InitText(u8 bgno);
extern void ham_DeInitText(void);
extern void ham_VBAText(char*, ...);
extern void ham_DrawText(u8 x, u8 y,char*, ...);
extern void ham_SetTextCol(u8 front_col,u8 back_col);
# 3984 "/home/gduale/gba/ham/include/mygba.h"
extern int vsprintf(char *buf, const char *fmt, va_list args);
# 3994 "/home/gduale/gba/ham/include/mygba.h"
extern void ham_Init(void);
extern u32 ham_GetHAMlibVersion(void);
extern void ham_ResetAll(void);
extern int atexit(void (*)(void));
# 4008 "/home/gduale/gba/ham/include/mygba.h"
extern u8 ham_memvram_alloctable[];
extern u8 ham_memobj_alloctable[];
extern u8 ham_memobj_refcnt[];





extern void ham_InitMemVram(void);
extern void ham_InitMemObj(void);
extern void ham_InitMemSRAM(void);
extern u32 ham_AllocMemSRAM(u32 bytes_needed);
extern void ham_DeAllocMemSRAM(u32 blockno);
extern u8 ham_AllocMemVram(u16 size_u16,u8 cbb_only_mode);
extern u16 ham_AllocMemObj(u8 obj_shape,u8 obj_size,u8 col_mode);
extern void ham_DeAllocMemVram(u8 first_block);
extern void ham_DeAllocMemObj(u16 first_block);
extern void ham_ReAllocMemObj(u16 first_block);
# 4036 "/home/gduale/gba/ham/include/mygba.h"
extern void ham_LoadBGPal(void* src,u16 size_u16s);
extern void ham_LoadBGPal16(void* src,u8 pal_no);
extern void ham_LoadBGPal256(void* src);
extern void ham_LoadObjPal(void* src,u16 size_u16s);
extern void ham_LoadObjPal16(void* src,u8 pal_no);
extern void ham_LoadObjPal256(void* src);
extern void ham_FadePal(u8 palno,s8 delta_per_call);
extern u8 ham_FadePalCol(u16 colno,s8 delta_per_call);
extern void ham_SetBgPalCol(u8 color_number, u16 rgb_value);
extern void ham_SetBgPalColRGB(u8 color_number, u8 r, u8 g, u8 b);
extern void ham_SetObjPalCol(u8 color_number, u16 rgb_value);
extern void ham_SetObjPalColRGB(u8 color_number, u8 r, u8 g, u8 b);
# 4059 "/home/gduale/gba/ham/include/mygba.h"
extern void ham_EmptyInt();
extern void ham_InitIntrTable();
extern void ham_StartIntHandler(u8 intno,void* fp);
extern void ham_StopIntHandler(u8 intno);






typedef struct sample_info_typ sample_info ;

struct sample_info_typ
{
    u32 length;
        u8* data;
        u16 bitrate;
        u8 pre_divide_ratio;
        u16 divide_ratio;
        u16 mix_buf_size;
        u32 current_pos;
        u8 playing;
        struct sample_info_typ *next;
        struct sample_info_typ *prev;
};


typedef struct {
    u16 type;
    u16 stat;
    u32 freq;
    u32 loop;
    u32 size;
    s8 data[1];
} WaveData;


typedef struct mixer_info_typ
{
        u16 bitrate;

        u8* mix_buf[2];

        u16 mix_buf_size;
        u16 mix_buf_cycles;
        s8 buf_no;

        struct sample_info_typ *first_sample;
        struct sample_info_typ *last_sample;

}mixer_info,*mixer_info_ptr;


extern mixer_info ham_mixer;




extern void ham_InitSound(void);
extern void ham_InitDSound(void);
extern void ham_DeInitDSound(void);
extern void ham_InitMixer(u16 bitrate);
extern void ham_DeInitMixer(void);
extern void ham_SyncMixer(void) __attribute__ ((section (".iwram"), long_call));
extern void ham_UpdateMixer(void) __attribute__ ((section (".iwram"), long_call));
extern void ham_PlaySample(sample_info *sample);
extern void ham_ChangeSampleBitrate(sample_info* sample,u16 bitrate);
extern sample_info *ham_InitSample(u8* data,u32 length,u16 bitrate);
extern void ham_DeInitSample(sample_info *sample);
extern void ham_KillSample(sample_info *sample);
# 4138 "/home/gduale/gba/ham/include/mygba.h"
typedef struct ramdata_info_typ
{
    u16 length_blocks;
    u32 length_bytes;
    u16 info_blockno;
    u16 data_blockno;
    u32 next_ramdata;
    u32 small_data_store;






    char ident[46];

} ramdata_info,*ramdata_info_ptr;


typedef struct ram_info_typ
{
    u32 ram_mode;




    u32 ham_config_found;


    void* saveRAM_start;

    u32 rootblk;

} ram_info,*ram_info_ptr;




extern void ham_ResetRAM(void);
extern u32 ham_InitRAM(u32 ram_type);
extern void ham_LoadRAMInfo(u32 blockno,ramdata_info_ptr pramdat);
extern void ham_SaveRAMInfo(ramdata_info_ptr pramdat);
extern void ham_SaveIntToRAM(char* ident_string,int the_number);
extern u32 ham_LoadIntFromRAM(char* ident_string, int* target_int);
extern void ham_SaveRawToRAM(char* ident_string,void* data, u32 length_in_bytes);
extern u32 ham_LoadRawFromRAM(char* ident_string, void* target_data);
# 4243 "/home/gduale/gba/ham/include/mygba.h"
# 1 "/home/gduale/gba/ham/include/gba.h" 1
# 4244 "/home/gduale/gba/ham/include/mygba.h" 2
# 44 "/home/gduale/gba/ham/include/hel2.h" 2
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 1 3
# 34 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 1 3 4
# 35 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 2 3
# 46 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 1 3
# 24 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 3
typedef short int __int16_t;
typedef unsigned short int __uint16_t;





typedef int __int32_t;
typedef unsigned int __uint32_t;






__extension__ typedef long long __int64_t;
__extension__ typedef unsigned long long __uint64_t;
# 59 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 1 3 4
# 151 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 60 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 2 3
# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/machine/types.h" 1 3
# 36 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/machine/types.h" 3
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 61 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 2 3
# 82 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 3
typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;



typedef unsigned short ushort;
typedef unsigned int uint;



typedef unsigned long clock_t;




typedef long time_t;




struct timespec {
  time_t tv_sec;
  long tv_nsec;
};

struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;
typedef char * caddr_t;







typedef unsigned short ino_t;
# 158 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 3
typedef short dev_t;




typedef long off_t;

typedef unsigned short uid_t;
typedef unsigned short gid_t;


typedef int pid_t;
typedef long key_t;
typedef _ssize_t ssize_t;
# 184 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 3
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));



typedef unsigned short nlink_t;
# 210 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/types.h" 3
typedef long fd_mask;







typedef struct _types_fd_set {
        fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 47 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 2 3



typedef _fpos_t fpos_t;
typedef __FILE FILE;





# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/sys/stdio.h" 1 3
# 58 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 2 3
# 162 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);
int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *, const char *, FILE *);
void setbuf (FILE *, char *);
int setvbuf (FILE *, char *, int, size_t);
int fprintf (FILE *, const char *, ...);
int fscanf (FILE *, const char *, ...);
int printf (const char *, ...);
int scanf (const char *, ...);
int sscanf (const char *, const char *, ...);
int vfprintf (FILE *, const char *, __gnuc_va_list);
int vprintf (const char *, __gnuc_va_list);
int vsprintf (char *, const char *, __gnuc_va_list);
int fgetc (FILE *);
char * fgets (char *, int, FILE *);
int fputc (int, FILE *);
int fputs (const char *, FILE *);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *, size_t _size, size_t _n, FILE *);
size_t fwrite (const void * , size_t _size, size_t _n, FILE *);
int fgetpos (FILE *, fpos_t *);
int fseek (FILE *, long, int);
int fsetpos (FILE *, const fpos_t *);
long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *_name, const char *_type);
int sprintf (char *, const char *, ...);
int remove (const char *);
int rename (const char *, const char *);


int asprintf (char **, const char *, ...);
int fseeko (FILE *, off_t, int);
off_t ftello ( FILE *);
int vfiprintf (FILE *, const char *, __gnuc_va_list);
int iprintf (const char *, ...);
int fiprintf (FILE *, const char *, ...);
int siprintf (char *, const char *, ...);
char * tempnam (const char *, const char *);
int vasprintf (char **, const char *, __gnuc_va_list);
int vsnprintf (char *, size_t, const char *, __gnuc_va_list);
int vfscanf (FILE *, const char *, __gnuc_va_list);
int vscanf (const char *, __gnuc_va_list);
int vsscanf (const char *, const char *, __gnuc_va_list);

int fcloseall (void);
int snprintf (char *, size_t, const char *, ...);
# 231 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 3
FILE * fdopen (int, const char *);

int fileno (FILE *);
int getw (FILE *);
int pclose (FILE *);
FILE * popen (const char *, const char *);
int putw (int, FILE *);
void setbuffer (FILE *, char *, int);
int setlinebuf (FILE *);
int getc_unlocked (FILE *);
int getchar_unlocked (void);
void flockfile (FILE *);
int ftrylockfile (FILE *);
void funlockfile (FILE *);
int putc_unlocked (int, FILE *);
int putchar_unlocked (int);






int _asprintf_r (struct _reent *, char **, const char *, ...);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
FILE * _fopen_r (struct _reent *, const char *, const char *);
int _fscanf_r (struct _reent *, FILE *, const char *, ...);
int _getchar_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...);
int _mkstemp_r (struct _reent *, char *);
char * _mktemp_r (struct _reent *, char *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *, ...);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *, const char *_old, const char *_new);

int _scanf_r (struct _reent *, const char *, ...);
int _sprintf_r (struct _reent *, char *, const char *, ...);
int _snprintf_r (struct _reent *, char *, size_t, const char *, ...);
int _sscanf_r (struct _reent *, const char *, const char *, ...);
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list);
int _vfprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list);
int _vprintf_r (struct _reent *, const char *, __gnuc_va_list);
int _vsprintf_r (struct _reent *, char *, const char *, __gnuc_va_list);
int _vsnprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list);
int _vfscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list);
int _vscanf_r (struct _reent *, const char *, __gnuc_va_list);
int _vsscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list);

ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 309 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 3
int __srget (FILE *);
int __swbuf (int, FILE *);






FILE *funopen (const void * _cookie, int (*readfn)(void * _cookie, char *_buf, int _n), int (*writefn)(void * _cookie, const char *_buf, int _n), fpos_t (*seekfn)(void * _cookie, fpos_t _off, int _whence), int (*closefn)(void * _cookie));
# 416 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/stdio.h" 3

# 45 "/home/gduale/gba/ham/include/hel2.h" 2

# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/malloc.h" 1 3
# 10 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/malloc.h" 3
# 1 "/home/gduale/gba/ham/gcc-arm/lib/gcc-lib/arm-thumb-elf/3.2.2/include/stddef.h" 1 3 4
# 11 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/malloc.h" 2 3


# 1 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/machine/malloc.h" 1 3
# 14 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/malloc.h" 2 3
# 22 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/malloc.h" 3
struct mallinfo {
  int arena;
  int ordblks;
  int smblks;
  int hblks;
  int hblkhd;
  int usmblks;
  int fsmblks;
  int uordblks;
  int fordblks;
  int keepcost;
};



extern void * malloc (size_t);




extern void * _malloc_r (struct _reent *, size_t);


extern void free (void *);




extern void _free_r (struct _reent *, void *);


extern void * realloc (void *, size_t);




extern void * _realloc_r (struct _reent *, void *, size_t);


extern void * calloc (size_t, size_t);




extern void * _calloc_r (struct _reent *, size_t, size_t);


extern void * memalign (size_t, size_t);




extern void * _memalign_r (struct _reent *, size_t, size_t);


extern struct mallinfo mallinfo (void);




extern struct mallinfo _mallinfo_r (struct _reent *);


extern void malloc_stats (void);




extern void _malloc_stats_r (struct _reent *);


extern int mallopt (int, int);




extern int _mallopt_r (struct _reent *, int, int);


extern size_t malloc_usable_size (void *);




extern size_t _malloc_usable_size_r (struct _reent *, void *);





extern void * valloc (size_t);




extern void * _valloc_r (struct _reent *, size_t);


extern void * pvalloc (size_t);




extern void * _pvalloc_r (struct _reent *, size_t);


extern int malloc_trim (size_t);




extern int _malloc_trim_r (struct _reent *, size_t);




extern void mstats (char *);




extern void _mstats_r (struct _reent *, char *);
# 162 "/home/gduale/gba/ham/gcc-arm/arm-thumb-elf/include/malloc.h" 3
extern void cfree (void *);
# 47 "/home/gduale/gba/ham/include/hel2.h" 2
# 195 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TPoint8
{
        s8 X;
        s8 Y;
}TPoint8, *PPoint8;

typedef struct _TPointU8
{
        u8 X;
        u8 Y;
}TPointU8, *PPointU8;

typedef struct _TPoint16
{
        s16 X;
        s16 Y;
}TPoint16, *PPoint16;

typedef struct _TPointU16
{
        u16 X;
        u16 Y;
}TPointU16, *PPointU16;

typedef struct _TPoint32
{
        s32 X;
        s32 Y;
}TPoint32, *PPoint32;

typedef struct _TPointU32
{
        u32 X;
        u32 Y;
}TPointU32, *PPointU32;

typedef struct _TPointSfp16
{
        sfp16 X;
        sfp16 Y;
}TPointSfp16, *PPointSfp16;

typedef struct _TPointSfp32
{
        sfp32 X;
        sfp32 Y;
}TPointSfp32, *PPointSfp32;


typedef struct _TRect8
{
        s8 Left;
        s8 Top;
        s8 Right;
        s8 Bottom;
}TRect8, *PRect8;

typedef struct _TRect16
{
        s16 Left;
        s16 Top;
        s16 Right;
        s16 Bottom;
}TRect16, *PRect16;

typedef struct _TRect32
{
        s32 Left;
        s32 Top;
        s32 Right;
        s32 Bottom;
}TRect32, *PRect32;

typedef struct _TRectSfp16
{
        sfp16 Left;
        sfp16 Top;
        sfp16 Right;
        sfp16 Bottom;
}TRectSfp16, *PRectSfp16;

typedef struct _TRectSfp32
{
        sfp32 Left;
        sfp32 Top;
        sfp32 Right;
        sfp32 Bottom;
}TRectSfp32, *PRectSfp32;


typedef u8 THandle;
# 851 "/home/gduale/gba/ham/include/hel2.h"
struct _TMapInfo;
struct _TMapDrawInfo;

typedef void (*PMapDrawFunc)(struct _TMapInfo *pMapInfo, struct _TMapDrawInfo *pMapColumnDrawInfo);




typedef struct _TMapDrawInfo
{
        void *pSourceCurrentDataAddr;
        u32 TargetColumn;
        u32 TargetRow;
        u32 TargetScreenBlockBase;
        u32 TargetCharacterBlockBase;
        u32 Quantity;
        u32 Flags;
        TPointU32 Size;
}TMapDrawInfo, *PMapDrawInfo;
# 879 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TMapBoundsInfo
{
        sfp32 Left;
        sfp32 Top;
        sfp32 Right;
        sfp32 Bottom;
        u32 Flags;
}TMapBoundsInfo;
typedef TMapBoundsInfo* PMapBoundsInfo;
# 897 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TMapSizeInfo
{
        u32 X;
        u32 Y;
        u32 Flags;





} TMapSizeInfo;
typedef TMapSizeInfo* PMapSizeInfo;




typedef struct _TMapInfo
{
        u32 BgNo;
        TMapSizeInfo Size;
        void *pData;
        u32 DataTypeSize;
        TPointSfp32 Position;
        u32 Flags;
        PMapDrawFunc pColumnDrawer;
        PMapDrawFunc pRowDrawer;
        TPointU32 UpdateQuantity;
        TMapBoundsInfo Bounds;
}TMapInfo;
typedef TMapInfo* PMapInfo;
# 936 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TMapCreateIndirectDesc
{
        u8 BgNo;
        TMapSizeInfo Size;
        const void* pData;
        u8 DataTypeSize;
        TPointSfp32 Position;
        u32 Flags;
        PMapDrawFunc pColumnDrawer;
        PMapDrawFunc pRowDrawer;
        TMapBoundsInfo Bounds;
} TMapCreateIndirectDesc;
typedef TMapCreateIndirectDesc* PMapCreateIndirectDesc;



extern void hel_MapInit(void *pBuffer);
extern void hel_MapQuit(void);
extern void hel_MapCreate(u32 BgNo, u32 Width, u32 Height, const void *pData, u32 DataTypeSize, u32 Flags);
extern void hel_MapCreateIndirect(const TMapCreateIndirectDesc* pDesc);
extern void hel_MapDelete(u32 BgNo);
extern void hel_MapSetPosition(u32 BgNo, sfp32 X, sfp32 Y);
extern void hel_MapGetPosition(u32 BgNo, sfp32 *pX, sfp32 *pY);
extern void hel_MapSetFlags(u32 BgNo, u32 Flags);
extern u32 hel_MapGetFlags(u32 BgNo);
extern void hel_MapRedraw(u32 BgNo);
extern u32 hel_MapScroll(u32 BgNo, sfp32 DeltaX, sfp32 DeltaY);
extern void hel_MapTransmit(void);
extern void hel_MapJumpTo(u32 BgNo, u32 JumpToFlag);
extern void hel_MapSetBounds(u32 BgNo, sfp32 Left, sfp32 Top, sfp32 Right, sfp32 Bottom, u32 Flags);
extern const void *hel_MapGetTilePtrAt(u32 BgNo, sfp32 X, sfp32 Y);
extern u32 hel_MapExists(u32 BgNo);
extern void hel_MapConvertPositionToTiles(u32 BgNo, sfp32 X, sfp32 Y, int *pOutX, int *pOutY);
# 991 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TTileInfo
{
        u8 *pTileData;
        u32 NumTilesRom;
        u16 *pRomToRam;
        u32 NumTilesRam;
        u16 *pRamToRom;
        u16 *pRefCount;
        u16 *pTileSlot;
        u32 SlotCounter;
        tile_info *ti;
        u32 RefCount;
        u32 CbbAddr;
        u32 TileSizeShiftFactor;
        u32 TileSizeInBytes;
        u32 TileSizeInHalfWords;
        u32 TileSizeInWords;
}TTileInfo, *PTileInfo;

typedef struct _TTileSystemInfo
{
        u32 BgNo;
        u32 PalNo;
        TTileInfo *pTileInfo;
        u32 _pad;
}TTileSystemInfo, *PTileSystemInfo;
# 1054 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_TileInit(void *pBuffer);
extern void hel_TileQuit(void);
extern void hel_TileCreate(u32 BgNo, const u8 *pTileData, u16 NumTilesRom, u16 *pBufferA, u16 NumTilesRam, u16 *pBufferB, u8 ColMode, u8 PalNo, u8 CbbOnlyMode);
extern void hel_TileDelete(u32 BgNo);
extern void hel_TileShare(u32 TargetBgNo, u32 SourceBgNo, u8 PalNo);
extern void hel_TileReloadGraphic(u32 BgNo, u32 RomTileNo, const u8* pSource);
extern void hel_TilePreloadGraphic(u32 BgNo, u32 RomTileNo);
extern void hel_TileReleaseGraphic(u32 BgNo, u32 RomTileNo);



extern TTileInfo* __hel_TileInfo;
extern TTileSystemInfo* __hel_TileSystemInfo;


extern void __attribute__ ((section (".iwram"), long_call)) __hel_TileFreeMapTileImplementation(TTileInfo *pTileInfo, u16 *pRamTileNo);


extern void __attribute__ ((section (".iwram"), long_call)) __hel_TileAllocMapTileImplementation(TTileSystemInfo* pTileSystem, u16 *pDest, const void *pSource);
# 1085 "/home/gduale/gba/ham/include/hel2.h"
typedef void (*PPrintCharFunc)(u32 BgNo, u32 X, u32 Y, u32 Character);

typedef struct _TBgTextInfo
{
        u8 CharW;
        u8 CharH;
        const void *pMap;
        const void *pData;
        u32 Flags;
        PPrintCharFunc pPrintCharFunc;
}TBgTextInfo, *PBgTextInfo;


extern void hel_BgTextInit(void *pBuffer);
extern void hel_BgTextQuit(void);
extern void hel_BgTextCreate(u32 BgNo, u32 CharW, u32 CharH, const void *pMap, const char *pszCharOrder, void *pCharLUT, u32 Flags);
extern void hel_BgTextDelete(u32 BgNo);
extern void hel_BgTextPrint(u32 BgNo, u32 X, u32 Y, u32 Flags, const char *pszString);
extern void hel_BgTextPrintF(u32 BgNo, u32 X, u32 Y, u32 Flags, const char *pszString, ...);
# 1130 "/home/gduale/gba/ham/include/hel2.h"
typedef struct __attribute__ ((packed)) _TPadButtons
{
        union
        {
                struct
                {
                        u8 A:1;
                        u8 B:1;
                        u8 Select:1;
                        u8 Start:1;
                        u8 Right:1;
                        u8 Left:1;
                        u8 Up:1;
                        u8 Down:1;
                        u8 R:1;
                        u8 L:1;
                };

                u16 States;
        };

        u8 Data[10*4];
}TPadButtons, *PPadButtons;

typedef struct _TPad
{
   TPadButtons Pressed;
   TPadButtons Held;
   u8 Mode;
}TPad, *PPad;
# 1171 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_PadInit(void);
extern void hel_PadQuit(void);
extern void hel_PadCapture(void);
extern void hel_PadSetMode(u32 Mode);
extern void hel_PadSetRepeatDelay(u32 Buttons, u8 Value);
extern void hel_PadSetRepeatRate(u32 Buttons, u8 Value);
extern u32 hel_PadGetTicks(u32 Button);



extern TPad __hel_Pad;
# 1302 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_PalInvert(void *pPaletteMemory, u32 Count);
extern void hel_PalBlend(u16 *pTarget, const u16 *pPaletteA, const u16 *pPaletteB, u32 Step, u32 Count);
extern void hel_PalFade(void *pPaletteMemory, const void *pSource, u32 Count, u32 Color, u32 Step);
# 1511 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TObjInfo
{
        u16 Attr[3];
        THandle Next;
        THandle Prev;
        u32 Flags;
        const void* pSrc;
} TObjInfo, *PObjInfo;
# 1782 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_ObjInit(void *pBuffer);
extern void hel_ObjQuit(void);
extern void hel_ObjSetVisibleAll(u32 Show);
extern inline void hel_ObjSetMosaicSize(u32 HSize, u32 VSize);
extern void hel_ObjSetRotScale(THandle Handle, u32 Value);
extern void hel_ObjSetDblSize(THandle Handle, u32 Value);
extern void hel_ObjSetBefore(THandle Handle, THandle TargetHandle);
extern void hel_ObjSetBehind(THandle Handle, THandle TargetHandle);
extern void hel_ObjBackup(void *pDest, u32 Flags);
extern void hel_ObjRestore(const void *pSource, u32 Flags);


extern void hel_ObjTransmit(void);


extern void hel_ObjClearOAM(void);


extern THandle __attribute__ ((section (".iwram"), long_call)) hel_ObjCreateEx(const void *pSrc, u32 Attr0, u32 Attr1, u32 Attr2);
extern THandle __attribute__ ((section (".iwram"), long_call)) hel_ObjClone(THandle Handle, s32 X, s32 Y);
extern void __attribute__ ((section (".iwram"), long_call)) hel_ObjDelete(THandle Handle);



extern u32 __hel_ObjFirst;
extern u32 __hel_ObjLast;
extern u32 __hel_ObjCount;
extern TObjInfo *__hel_ObjInfo;




extern const u32 HEL_OBJ_SHAPESIZE_TO_WIDTH[4][4];
extern const u32 HEL_OBJ_SHAPESIZE_TO_HEIGHT[4][4];
extern const u32 HEL_OBJ_SHAPESIZE_TO_HALFWORD[2][4][4];
# 1826 "/home/gduale/gba/ham/include/hel2.h"
typedef struct __attribute__ ((packed)) _TObjRotScaleInfo
{
        s16 ScaleX;
        s16 ScaleY;
        u16 Angle;
} __attribute__ ((packed)) TObjRotScaleInfo, *PObjRotScaleInfo;

extern void hel_ObjRotScaleInit(void *pBuffer);
extern void hel_ObjRotScaleQuit(void);
extern void hel_ObjRotScaleBackup(void *pDest, u32 Flags);
extern void hel_ObjRotScaleRestore(const void *pSource, u32 Flags);
extern THandle hel_ObjRotScaleCreate(u32 Angle, s32 ScaleX, s32 ScaleY);
extern THandle hel_ObjRotScaleClone(THandle Handle);
extern void hel_ObjRotScaleDelete(THandle Handle);
extern void hel_ObjRotScaleUpdate(THandle Handle, u32 Angle, s32 ScaleX, s32 ScaleY);
extern void hel_ObjRotScaleTransmit(void);
extern inline u32 hel_ObjRotScaleGetFreeSlots(void);
extern u32 hel_ObjRotScaleExists(THandle Handle);
# 1863 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_BgSetMosaic(u32 BgNo, u32 Value);
extern void hel_BgSetMosaicSize(u32 HSize, u32 VSize);
extern void hel_BgSetPrio(u32 BgNo, u32 Prio);
# 1893 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_DmaCopy16(void *pDest, const void *pSrc, u32 SizeIn16BitWords);
extern void hel_DmaCopy32(void *pDest, const void *pSrc, u32 SizeIn32BitWords);
extern void hel_DmaSet16(void *pDest, volatile u16 SrcValue, u32 SizeIn16BitWords);
extern void hel_DmaCopy16VBL(void *pDest, const void *pSrc, u32 SizeIn16BitWords);
extern void hel_DmaSet8(void *pDest, u8 SrcValue, u32 SizeInBytes);
extern void hel_DmaSet32(void *pDest, volatile u32 SrcValue, u32 SizeIn32BitWords);
# 2123 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_SplashInit(void *pBuffer);
extern void hel_SplashQuit();
extern void hel_Splash(const void *pBitmap, const u16 *pPalette, u16 InBlendColor, u16 OutBlendColor, u32 BlendDelay, u32 DisplayDelay, u32 ContinueDelay, u32 CompressionType, u32 Flags);
# 2136 "/home/gduale/gba/ham/include/hel2.h"
typedef void (*PInterruptProc)(void);
# 2146 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_IntrStartHandler(u32 InterruptType, void *pInterruptHandler);
extern void hel_IntrStopHandler(u32 InterruptType);
extern void hel_IntrUpdateHandler(u32 InterruptType, void *pInterruptHandler);
extern void hel_IntrStopAll(void);
extern u32 hel_IntrIsEnabled(u32 InterruptType);
extern u32 hel_IntrGetType(void *pInterruptProc);
# 2179 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_BmpClear(u16 Color);
extern void hel_BmpLoad(const void *pSrc);
extern void hel_BmpLoadUnComp(const void *pSrc, u32 CompressionType);
# 2210 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TDebugAssertInfo
{
        const char *pExpression;
        const char *pFilename;
        const char *pFunctionName;
        u32 LineNo;
        const char *pMessage;
        u32 nCallStack;
        const char **ppCallStack;
}TDebugAssertInfo, *PDebugAssertInfo;

typedef void (*PDebugAssertFunc)(const TDebugAssertInfo *pInfo);
typedef int (*PDebugMessageFunc)(const char *pText);
# 2407 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_SysSetPrefetch(u32 Value);
extern void hel_SysSetWaitState0(u32 FirstAccess, u32 SecondAccess);
extern void hel_SysSetWaitState1(u32 FirstAccess, u32 SecondAccess);
extern void hel_SysSetWaitState2(u32 FirstAccess, u32 SecondAccess);
# 2433 "/home/gduale/gba/ham/include/hel2.h"
typedef struct _TWinInfo
{
        u16 WinH[2];
        u16 WinV[2];
        u16 WinIn;
        u16 WinOut;
}TWinInfo, *PWinInfo;
# 2472 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_WinInit(void);
extern void hel_WinQuit(void);
extern void hel_WinCreateEx(u8 WinNo, u8 Left, u8 Top, u8 Right, u8 Bottom, u8 InsideFlags, u8 OutsideFlags, u8 SkipOutsideFlags);
extern inline void hel_WinTransmit(void);


extern TWinInfo __hel_WinInfo;
# 2498 "/home/gduale/gba/ham/include/hel2.h"
typedef struct __attribute__ ((packed)) _TEffectInfo
{
        u16 Control;
        u16 Alpha;
        u16 Brightness;
} TEffectInfo, *PEffectInfo;
# 2529 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_FxInit(void);
extern void hel_FxQuit(void);



extern TEffectInfo __hel_EffectInfo;
# 2550 "/home/gduale/gba/ham/include/hel2.h"
typedef void (*PDecompressFunc)(void *pSrc, void *pDst);
# 2578 "/home/gduale/gba/ham/include/hel2.h"
extern s32 __attribute__ ((noinline)) __attribute__ ((no_instrument_function)) hel_SwiMod(s32 Number, s32 Denom);
extern s32 __attribute__ ((noinline)) __attribute__ ((no_instrument_function)) hel_SwiDiv(s32 Number, s32 Denom);
extern s32 __attribute__ ((noinline)) __attribute__ ((no_instrument_function)) hel_SwiDivSafe(s32 Number, s32 Denom);
extern void __attribute__ ((noinline)) __attribute__ ((no_instrument_function)) hel_SwiVBlankIntrWait(void);
extern void __attribute__ ((noinline)) __attribute__ ((no_instrument_function)) hel_SwiHalt(void);
extern void __attribute__ ((noinline)) __attribute__ ((no_instrument_function)) hel_SwiSoftReset(u32 ReturnAddr);






extern const PDecompressFunc __helSwiDecompressJumpTable[];
extern void __attribute__ ((noinline)) __hel_SwiLZ77UnCompVramImplementation(void *pSrc, void *pDst);
extern void __attribute__ ((noinline)) __hel_SwiLZ77UnCompWramImplementation(void *pSrc, void *pDst);
extern void __attribute__ ((noinline)) __hel_RLUnCompVramImplementation(void *pSrc, void *pDst);
extern void __attribute__ ((noinline)) __hel_RLUnCompWramImplementation(void *pSrc, void *pDst);
extern void __attribute__ ((noinline)) __attribute__ ((no_instrument_function)) __hel_SwiCpuFastCopyImplementation(const void* pSrc, void *pDst, u32 LengthInWords);
# 2605 "/home/gduale/gba/ham/include/hel2.h"
extern void hel_MathExtractDigits(u32 Value, u8 *pOut, u32 nDigits);
# 3 "src/main.c" 2
# 1 "src/gfx/ResourceData.h" 1
# 306 "src/gfx/ResourceData.h"
extern const unsigned char __ResourceData__[];
# 4 "src/main.c" 2
# 15 "src/main.c"
void app_init();
void FAT_initSpritePalette();
void app_showImgBackground();
void app_showImgGameCover();
void app_writeSomeText(char* text, u8 xTEXT, u8 yTEXT);
void hidePerso();
void showPerso();
void deplace();
void app_showFirstScreen();
void animePersonage();
void discoursChampi();
void app_showImgNiveau1();
void app_showImgNiveau2();

u8 x=2;
u8 y=70;
u8 yPeach;
u8 xPeach;
u8 jump;
u8 unSurDeux = 0;
u8 jumpBreak = 0;
u8 xMonstre = 30;
u8 level1complete = 0;
u8 nbMontres = 0;

int main(){

  app_init();
  initPeach();
  initChamp1();
  initTortue();
  initMonstre();
  app_showFirstScreen();
  app_showImgGameCover();




  app_showImgNiveau2();


  showPerso();
  movePeach(2,113);
  yPeach = 113;
  xPeach = 2;


  showChamp1();
  moveChamp1(100,113);


  showTortue();
  moveTortue(150,110);


  showMonstre();
  moveMonstre(xMonstre,110);
  xMonstre = 220;

u8 t;
u8 temporisation=0;


  for (;;) {

        hel_PadCapture();

        if (((TPad*)(&__hel_Pad))->Pressed.Start){
          FAT_reinitScreen();
          app_writeSomeText("start",2,2);
        }
        if (((TPad*)(&__hel_Pad))->Pressed.Select){
          FAT_reinitScreen();
          app_writeSomeText("Select",2,6);
        }
        if (((TPad*)(&__hel_Pad))->Pressed.A){


          jump = 1;
          if(jumpBreak == 0){
            jumpPeach();
            jumpBreak = 1;
          }

        }
        if (((TPad*)(&__hel_Pad))->Pressed.B){
          FAT_reinitScreen();
          app_writeSomeText("B",2,8);
        }
        if (((TPad*)(&__hel_Pad))->Pressed.Up){}
        if (((TPad*)(&__hel_Pad))->Pressed.Down){}
        if (((TPad*)(&__hel_Pad))->Pressed.Right){
          if(xPeach>=175) {

          }else {
            xPeach+=4;
            movePeach(xPeach,yPeach);
          }

          if (jump == 1){
            if(jumpBreak == 0){
              jumpPeach();
              jumpBreak = 1;
            }
          }
        }
        if (((TPad*)(&__hel_Pad))->Pressed.Left){

          if(xPeach > 2){
            xPeach-=4;
            movePeach(xPeach,yPeach);
          }
        }
        if (((TPad*)(&__hel_Pad))->Pressed.R){}
        if (((TPad*)(&__hel_Pad))->Pressed.L){}


        moveMonstre(xMonstre,110);
        xMonstre--;


        if(yPeach < 113){
          if(unSurDeux == 0) {
            yPeach += 1;
            movePeach(xPeach,yPeach);
            unSurDeux = 1;
          }else{
            unSurDeux = 0;
          }
        }else{
          jumpBreak = 0;
        }


        if(xPeach+16 >= xMonstre && temporisation < 30){

          hidePerso();
          hel_SwiVBlankIntrWait();
          showPerso();
          temporisation++;
          app_writeSomeText("Collision",2,2);
        }



        nbMontres=5;
        if(nbMontres == 5){
          level1complete = 1;
          break;
        }


        hel_SwiVBlankIntrWait();
    }


  FAT_reinitScreen();
  app_showImgNiveau1FIN();
  hideALL();
  for(;;){
    hel_PadCapture();
    if (((TPad*)(&__hel_Pad))->Pressed.Start){
      break;
    }
  }


  FAT_reinitScreen();
  hideALL();
  app_showImgNiveau2();
  app_writeSomeText("niveau 2",2,5);
  for(;;){

    hel_SwiVBlankIntrWait();
  }

  return 0;

}

void hideALL(){
  hidePerso();
  hideChamp1();
  hideTortue();
  hideMonstre();
}


void jumpPeach(){
  yPeach -= 30;
  movePeach(xPeach,yPeach);
  jump = 0;
}

void discoursChampi(){
    app_writeSomeText("Bonjour Morgane, je suis ",2,4);
    app_writeSomeText("un gentil petit champi",2,5);
    app_writeSomeText("et je vais te raconter",2,6);
    app_writeSomeText("une histoire.",2,7);
    app_writeSomeText("Tu viens d'etre catapulte",2,8);
    app_writeSomeText("dans un mode magique...",2,9);
    app_writeSomeText("Le monde des geeks !",2,10);
    app_writeSomeText("Ta mission si tu l'acceptes",2,11);
    app_writeSomeText("est d'aller delivrer ton",2,12);
    app_writeSomeText("geek d'amour :)",2,13);
    app_writeSomeText("[PRESS START]",5,16);

    for(;;) {
      hel_PadCapture();
            if (((TPad*)(&__hel_Pad))->Pressed.Start ||
                    ((TPad*)(&__hel_Pad))->Pressed.Select || ((TPad*)(&__hel_Pad))->Pressed.A || ((TPad*)(&__hel_Pad))->Pressed.B || ((TPad*)(&__hel_Pad))->Pressed.Up || ((TPad*)(&__hel_Pad))->Pressed.Down ||
                    ((TPad*)(&__hel_Pad))->Pressed.Right || ((TPad*)(&__hel_Pad))->Pressed.Left || ((TPad*)(&__hel_Pad))->Pressed.R || ((TPad*)(&__hel_Pad))->Pressed.L) {
                break;
            }
            hel_SwiVBlankIntrWait();
    }
    FAT_reinitScreen();
    app_writeSomeText("Il est actuellement prisonier",1,4);
    app_writeSomeText("dans une boucle infinie.",2,5);
    app_writeSomeText("Pour cela tu dervas eviter",2,7);
    app_writeSomeText("des pti monstres et",2,8);
    app_writeSomeText("les pluies de clefs usb.",2,9);
    app_writeSomeText("Appuie sur START pour ",2,14);
    app_writeSomeText("demarrer ta quete!",2,15);
}

void animePersonage(){
  u8 x=100;
  u8 y=70;
  for(;;) {
    hel_PadCapture();
          if (((TPad*)(&__hel_Pad))->Pressed.Start ||
                  ((TPad*)(&__hel_Pad))->Pressed.Select ||
                  ((TPad*)(&__hel_Pad))->Pressed.A ||
                  ((TPad*)(&__hel_Pad))->Pressed.B ||
                  ((TPad*)(&__hel_Pad))->Pressed.Up ||
                  ((TPad*)(&__hel_Pad))->Pressed.Down ||
                  ((TPad*)(&__hel_Pad))->Pressed.Right ||
                  ((TPad*)(&__hel_Pad))->Pressed.Left ||
                  ((TPad*)(&__hel_Pad))->Pressed.R ||
                  ((TPad*)(&__hel_Pad))->Pressed.L
                  ) {
              break;
          }
    x++;
    showPerso();
    movePeach(x,y);
    if (x >= 150) {
      x==100;
    }
    hel_SwiVBlankIntrWait();
  }
}

void app_showFirstScreen() {

}






void FAT_reinitScreen() {
    if (ham_bg[3].ti) {
        ham_DeInitTileSet(ham_bg[3].ti);
        ham_DeInitMapSet(ham_bg[3].mi);
        FAT_forceClearTextLayer();
    }
}






void FAT_forceClearTextLayer() {
    if (ham_bg[1].ti) {

        ham_DeInitTileSet(ham_bg[1].ti);
        ham_DeInitMapSet(ham_bg[1].mi);

        ham_bg[1].ti = ham_InitTileSet((void*) ((const void*)&__ResourceData__[80288]), 3008, 1, 1);
        ham_bg[1].mi = ham_InitMapEmptySet((u8) 1024, 0);
    }

}




void FAT_initSpritePalette() {
    hel_DmaCopy16((void*)(0x05000200 + ((0)<<5)), (void*)(((const unsigned short*)&__ResourceData__[79936])), 16);
}





THandle peach_obj;
void initPeach() {
    peach_obj = hel_ObjCreateEx ( (void*)(((const void*)&__ResourceData__[79168])), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((0x01)<<10) | ((0)<<9) | ((70) & 0x00FF), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((100) & 0x01FF), ((0)<<12) | ((1)<<10) );
# 331 "src/main.c"
    do { u32 *pFlags = &__hel_ObjInfo[peach_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}

void hidePerso() {
  do { u32 *pFlags = &__hel_ObjInfo[peach_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}

void showPerso() {
  do { u32 *pFlags = &__hel_ObjInfo[peach_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((1)<<9); } while(0);
}

void movePeach(u8 x, u8 y) {
    do { u32 *pAttr = (u32*)&__hel_ObjInfo[peach_obj]; *pAttr &= 0xfe00ff00; *pAttr |= (((x)&511) << 16) | (((y)&255)); } while(0);
}


THandle champ1_obj;
void initChamp1() {
    champ1_obj = hel_ObjCreateEx ( (void*)(((const void*)&__ResourceData__[128])), ((0)<<14) | ((0)<<13) | ((0)<<12) | ((0x01)<<10) | ((0)<<9) | ((70) & 0x00FF), ((1)<<14) | ((0)<<13) | ((0)<<12) | ((100) & 0x01FF), ((0)<<12) | ((1)<<10) );
# 364 "src/main.c"
    do { u32 *pFlags = &__hel_ObjInfo[champ1_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}
void hideChamp1() {
  do { u32 *pFlags = &__hel_ObjInfo[champ1_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}

void showChamp1() {
  do { u32 *pFlags = &__hel_ObjInfo[champ1_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((1)<<9); } while(0);
}

void moveChamp1(u8 x, u8 y) {
    do { u32 *pAttr = (u32*)&__hel_ObjInfo[champ1_obj]; *pAttr &= 0xfe00ff00; *pAttr |= (((x)&511) << 16) | (((y)&255)); } while(0);
}


THandle tortue_obj;
void initTortue() {
    tortue_obj = hel_ObjCreateEx ( (void*)(((const void*)&__ResourceData__[86304])), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((0x01)<<10) | ((0)<<9) | ((70) & 0x00FF), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((100) & 0x01FF), ((0)<<12) | ((1)<<10) );
# 396 "src/main.c"
    do { u32 *pFlags = &__hel_ObjInfo[tortue_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}
void hideTortue() {
  do { u32 *pFlags = &__hel_ObjInfo[tortue_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}

void showTortue() {
  do { u32 *pFlags = &__hel_ObjInfo[tortue_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((1)<<9); } while(0);
}

void moveTortue(u8 x, u8 y) {
    do { u32 *pAttr = (u32*)&__hel_ObjInfo[tortue_obj]; *pAttr &= 0xfe00ff00; *pAttr |= (((x)&511) << 16) | (((y)&255)); } while(0);
}


THandle monstre_obj;
void initMonstre() {
    monstre_obj = hel_ObjCreateEx ( (void*)(((const void*)&__ResourceData__[39104])), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((0x01)<<10) | ((0)<<9) | ((70) & 0x00FF), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((100) & 0x01FF), ((0)<<12) | ((1)<<10) );
# 428 "src/main.c"
    do { u32 *pFlags = &__hel_ObjInfo[monstre_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}
void hideMonstre() {
  do { u32 *pFlags = &__hel_ObjInfo[monstre_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}

void showMonstre() {
  do { u32 *pFlags = &__hel_ObjInfo[monstre_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((1)<<9); } while(0);
}

void moveMonstre(u8 x, u8 y) {
    do { u32 *pAttr = (u32*)&__hel_ObjInfo[monstre_obj]; *pAttr &= 0xfe00ff00; *pAttr |= (((x)&511) << 16) | (((y)&255)); } while(0);
}


THandle usbkey_obj;
void initMonstre() {
    usbkey_obj = hel_ObjCreateEx ( (void*)(((const void*)&__ResourceData__[86560])), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((0x01)<<10) | ((0)<<9) | ((70) & 0x00FF), ((2)<<14) | ((0)<<13) | ((0)<<12) | ((100) & 0x01FF), ((0)<<12) | ((1)<<10) );
# 460 "src/main.c"
    do { u32 *pFlags = &__hel_ObjInfo[usbkey_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}
void hideMonstre() {
  do { u32 *pFlags = &__hel_ObjInfo[usbkey_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((0)<<9); } while(0);
}

void showMonstre() {
  do { u32 *pFlags = &__hel_ObjInfo[usbkey_obj].Flags; *pFlags &= ~(1<<(9)); *pFlags |= ((1)<<9); } while(0);
}

void moveMonstre(u8 x, u8 y) {
    do { u32 *pAttr = (u32*)&__hel_ObjInfo[usbkey_obj]; *pAttr &= 0xfe00ff00; *pAttr |= (((x)&511) << 16) | (((y)&255)); } while(0);
}






void VBLInterruptHandler(void) {
    hel_ObjTransmit();

    do { *(volatile u16 *)(0x04000000 + 0x202) |= (1 << (0)); *((volatile u16*)0x3fffff8) |= (1 << (0)); } while(0);
}
# 493 "src/main.c"
u8 __attribute__ ((section(".ewram"))) __attribute__ ((nocommon)) __attribute__ ((aligned(4))) g_BgTextSystemMemory[((sizeof(TBgTextInfo)*4) + (sizeof(u32)*2))];
u16 __attribute__ ((section(".ewram"))) __attribute__ ((nocommon)) g_CharLUT[256];

const unsigned char CHARORDER[] =
        " BCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmn" "opqrstuvwxyz0123456789,.-;:A#^+*@" "!\"~$%&/()=?|\\<>[]{}¹²³°";



u8 __attribute__ ((section(".ewram"))) __attribute__ ((nocommon)) __attribute__ ((aligned(4))) g_ObjSystemBuffer[((sizeof(TObjInfo)*128) + (sizeof(u8)*128) + (sizeof(u16)*1024) + (sizeof(u32)*4))];






u8 __attribute__ ((section(".ewram"))) __attribute__ ((nocommon)) __attribute__ ((aligned(4))) g_MapSystemBuffer[((sizeof(TMapInfo)*5) + sizeof(TMapDrawInfo) + (sizeof(u32)*2))];

void app_init() {

    ham_Init();
    hel_SysSetPrefetch(0);

    do { (*(volatile u16 *) 0x04000000 &= 0xFFF8); (*(volatile u16 *) 0x04000000 |= (0));; } while(0);

    hel_MapInit(g_MapSystemBuffer);
    hel_BgTextInit((void*) g_BgTextSystemMemory);
    hel_ObjInit(g_ObjSystemBuffer);

    hel_PadInit();
    hel_PadSetRepeatDelay(0x0100 | 0x0200 | 0x0020 | 0x0010 | 0x0040 | 0x0080 | 0x0001 | 0x0002 | 0x0008, 1);
    hel_PadSetRepeatRate(0x0020 | 0x0010 | 0x0040 | 0x0080, 3);
    hel_PadSetRepeatRate(0x0100 | 0x0200 | 0x0001 | 0x0002 | 0x0008, 0);


    hel_DmaCopy16((void*)0x05000000, (void*)(((const unsigned short*)&__ResourceData__[79424])), 256);
    FAT_initSpritePalette();


    ham_bg[1].ti = ham_InitTileSet((void*) ((const void*)&__ResourceData__[80288]), 3008, 1, 1);
    ham_bg[1].mi = ham_InitMapEmptySet((u8) 640, 0);

    hel_BgTextCreate(
            1,
            1,
            1,

            ((const void*)&__ResourceData__[79968]),
            CHARORDER,
            g_CharLUT,
            0x0004);

    ham_InitBg(1, 1, 0, 0);

    hel_IntrStartHandler(0, (void*) &VBLInterruptHandler);
}


void app_showImgBackground() {

    ham_bg[3].ti = ham_InitTileSet((void*)((const void*)&__ResourceData__[1920]), 12288, 1, 1);

    hel_MapCreate(3,
                  32,
                  20,
                  ((const void*)&__ResourceData__[640]),
                  sizeof(u16),
                  (0x0020 | 0x0040 | 0x0080 | 0x0100 | 0x0200 | 0x2000));

    ham_InitBg(3, 1, 3, 0);

}

void app_showImgGameCover() {

    ham_bg[3].ti = ham_InitTileSet((void*)((const void*)&__ResourceData__[33664]), 1600, 1, 1);

    hel_MapCreate(3,
                  32,
                  20,
                  ((const void*)&__ResourceData__[32384]),
                  sizeof(u16),
                  (0x0020 | 0x0040 | 0x0080 | 0x0100 | 0x0200 | 0x2000));

    ham_InitBg(3, 1, 3, 0);

}

void app_showImgIntro() {

    ham_bg[3].ti = ham_InitTileSet((void*)((const void*)&__ResourceData__[38144]), 480, 1, 1);

    hel_MapCreate(3,
                  32,
                  20,
                  ((const void*)&__ResourceData__[36864]),
                  sizeof(u16),
                  (0x0020 | 0x0040 | 0x0080 | 0x0100 | 0x0200 | 0x2000));

    ham_InitBg(3, 1, 3, 0);

}

void app_showImgNiveau1() {

    ham_bg[3].ti = ham_InitTileSet((void*)((const void*)&__ResourceData__[40640]), 992, 1, 1);

    hel_MapCreate(3,
                  32,
                  20,
                  ((const void*)&__ResourceData__[39360]),
                  sizeof(u16),
                  (0x0020 | 0x0040 | 0x0080 | 0x0100 | 0x0200 | 0x2000));

    ham_InitBg(3, 1, 3, 0);

}

void app_showImgNiveau1FIN() {

    ham_bg[3].ti = ham_InitTileSet((void*)((const void*)&__ResourceData__[43904]), 5792, 1, 1);

    hel_MapCreate(3,
                  32,
                  20,
                  ((const void*)&__ResourceData__[42624]),
                  sizeof(u16),
                  (0x0020 | 0x0040 | 0x0080 | 0x0100 | 0x0200 | 0x2000));

    ham_InitBg(3, 1, 3, 0);

}

void app_showImgNiveau2() {

    ham_bg[3].ti = ham_InitTileSet((void*)((const void*)&__ResourceData__[56768]), 2048, 1, 1);

    hel_MapCreate(3,
                  32,
                  20,
                  ((const void*)&__ResourceData__[55488]),
                  sizeof(u16),
                  (0x0020 | 0x0040 | 0x0080 | 0x0100 | 0x0200 | 0x2000));

    ham_InitBg(3, 1, 3, 0);

}

void app_writeSomeText(char* text, u8 xTEXT, u8 yTEXT) {
  hel_BgTextPrintF(1, xTEXT, yTEXT, 0, text);
}
