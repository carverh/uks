MAKE = make

.PHONY: iso clean

iso:
	$(MAKE) -C kernel
	cp kernel/kernel.bin iso/boot/kernel.bin
	grub-mkrescue -o uks.iso iso

clean:
	$(MAKE) clean -C kernel
	rm -f uks.iso

run:
	qemu-system-x86_64 -cdrom uks.iso -enable-kvm -m 64M