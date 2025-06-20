# Makefile
BUILD=build
BOOT=boot
KERNEL=kernel

all: $(BUILD)/os-image.bin

$(BUILD)/boot.o: $(BOOT)/boot.asm
	nasm -f bin $< -o $@

$(BUILD)/kernel.o: $(KERNEL)/kernel.c
	gcc -m32 -ffreestanding -c $< -o $@

$(BUILD)/kernel.bin: $(BUILD)/kernel.o
	ld -m elf_i386 -T $(KERNEL)/kernel.ld $< -o $@

$(BUILD)/os-image.bin: $(BUILD)/boot.o $(BUILD)/kernel.bin
	cat $^ > $@

run: $(BUILD)/os-image.bin
	qemu-system-i386 -drive format=raw,file=$<

clean:
	rm -f $(BUILD)/*
