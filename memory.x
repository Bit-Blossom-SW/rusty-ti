/* Device specific memory layout */

/* This file is used to build the cortex-m-rt examples,
   but not other applications using cortex-m-rt. */

MEMORY
{
  /* FLASH and RAM are mandatory memory regions */
  /* Update examples/data_overflow.rs if you change these sizes. */
  FLASH : ORIGIN = 0x00400000, LENGTH = 0x00058000
  RAM : ORIGIN = 0x00458000, LENGTH = (0x8000) /* 32KB of RAM2 is being used by RBL */

  /* More memory regions can declared: for example this is a second RAM region */
  /* CCRAM : ORIGIN = 0x10000000, LENGTH = 8K */
    M4F_RBL    : ORIGIN = 0x00458000 , LENGTH = 0x8000 /* 32KB of RAM2 is being used by RBL */
    M4F_RAM3  : ORIGIN = 0x00460000 , LENGTH = 0x00020000

    HWASS_SHM_MEM : ORIGIN = 0x60000000, LENGTH = 0x00068000 /* 256KB in APPSS PD and 160KB in HWA PD */

}

/* The location of the stack can be overridden using the `_stack_start` symbol.
   By default it will be placed at the end of the RAM region */
/* _stack_start = ORIGIN(CCRAM) + LENGTH(CCRAM); */

/* The location of the .text section can be overridden using the `_stext` symbol.
   By default it will place after .vector_table */
/*  _stext = ORIGIN(RAM); */