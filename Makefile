CFLAGS := -g
TARGETS := hello

all: $(TARGETS)

clean:
	rm -f $(TARGETS)

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

%: %.o
	$(CC) $(CFLAGS) $< -o $@

.PHONY: all clean
