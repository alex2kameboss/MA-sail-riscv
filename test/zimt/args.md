# First Stage

* Compile from **test/first_party/src/common**:
    * runtime.c
    * nanoprintf.c

# Use

* From **test/first_party/src/common** use for compile:
    * crt0.S
    * link.ld

# Compiler arguments

```bash
-O3 -ffast-math -v -lm -lgcc -static -mcmodel=medany -Wall -fvisibility=hidden -nostartfiles -ffreestanding \
-Wl,--no-relax \
-Itest/first_party/src/common \
-march=rv64im_zicsr \ 
-Ttest/first_party/src/common/link.ld \ 
test/first_party/src/common/crt0.S \ 
<file> nanoprintf.o runtime.o -o <elf> 
```