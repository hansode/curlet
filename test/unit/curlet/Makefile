all: test

test:
	for i in ./t.*; do echo $$i; $$i || exit; done
