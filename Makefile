
EXAMPLE1=example1 example1_proving.key example1_verification.key

all: $(EXAMPLE1)

% %_abi.json: %.zok
	zokrates compile --light -s $*_abi.json -i $^ -o $*

%_proving.key %_verification.key:
	zokrates setup -i $* -p $*_proving.key -v $*_verification.key -b ark -s gm17

clean:
	$(RM) example1 *.ztf *_abi.json *.witness *.key
