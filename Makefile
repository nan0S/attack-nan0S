all: check-ctarget check-rtarget

check-ctarget: ctarget-1 ctarget-2 ctarget-3
check-rtarget: rtarget-2 rtarget-3

ctarget-%: ctarget hex2raw
	@echo -n "CTARGET touch$*... "
	@cat ctarget.l$* | ./hex2raw | ./ctarget -q | \
	  grep --quiet "Valid solution for level" || (echo "failed" && exit 1)
	@echo "passed"

rtarget-%: rtarget hex2raw
	@echo -n "RTARGET touch$*... "
	@cat rtarget.l$* | ./hex2raw | ./rtarget -q | \
	  grep --quiet "Valid solution for level" || (echo "failed" && exit 1)
	@echo "passed"

clean:
	rm -f *~
