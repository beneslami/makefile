TARGET: exe

exe: main.o libnet.a
	gcc source1/s1_folder2/main.o -o exe -L . libnet.a -lm

main.o: source1/s1_folder2/main.c
	gcc -c source1/s1_folder2/main.c -o source1/s1_folder2/main.o

libnet.a: vpp.o frr.o mpls.o
	ar rs libnet.a source1/s1_folder1/vpp.o source2/s2_folder1/frr.o source2/s2_folder2/mpls.o

vpp.o: source1/s1_folder1/vpp.c
	gcc -c -I source1/s1_folder1 source1/s1_folder1/vpp.c -o source1/s1_folder1/vpp.o

frr.o: source2/s2_folder1/frr.c
	gcc -c -I source2/s2_folder1 source2/s2_folder1/frr.c -o source2/s2_folder1/frr.o

mpls.o: source2/s2_folder2/mpls.c
	gcc -c -I source2/s2_folder2 source2/s2_folder2/mpls.c -o source2/s2_folder2/mpls.o

clean:
	rm -rf *.o *.a
