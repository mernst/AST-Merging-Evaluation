style: shell-script-style python-style

SH_SCRIPTS = 
BASH_SCRIPTS = $(wildcard *.sh) $(wildcard src/scripts/*.sh)

shell-script-style:
	shellcheck -x -P SCRIPTDIR --format=gcc ${SH_SCRIPTS} ${BASH_SCRIPTS}
#	checkbashisms ${SH_SCRIPTS}

showvars:
	@echo "SH_SCRIPTS=${SH_SCRIPTS}"
	@echo "BASH_SCRIPTS=${BASH_SCRIPTS}"

PYTHON_FILES=$(wildcard src/python/*.py)
python-style:
	black ${PYTHON_FILES}
	pylint -f parseable --disable=W,invalid-name ${PYTHON_FILES}

clean:
	rm -f small/valid_repos.csv

clean-cache:
	rm -rf cache/*