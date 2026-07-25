.PHONY: all check_python compile_sources build_data_package build_control_package build_ipk_package clean_intermediate clean

# Python version (major) that must be used when building
PYTHON_VERSION_TO_USE = 2.7

# Determine Python version being used (major version)
PYTHON_VERSION_CURRENT = $(shell python$(PYTHON_VERSION_TO_USE) -c "import sys;t='{v[0]}.{v[1]}'.format(v=list(sys.version_info[:2]));sys.stdout.write(t)")

# Version number to use when creating IPK file
PKGV = 0.2

all: check_python compile_sources build_data_package build_control_package build_ipk_package clean_intermediate

check_python:
ifneq ($(PYTHON_VERSION_CURRENT), $(PYTHON_VERSION_TO_USE))
	$(error Need python version $(PYTHON_VERSION_TO_USE). Current version is $(PYTHON_VERSION_CURRENT))
endif

compile_sources:
	@echo
	@echo Compile all python scripts into bytecode
	@echo ========================================
ifeq ($(shell echo $(PYTHON_VERSION_TO_USE) | cut -c1),2)
	python2 -O -m compileall ./usr/lib/enigma2/python/Components/
else ifeq ($(shell echo $(PYTHON_VERSION_TO_USE) | cut -c1),3)
	python3 -O -m compileall -b -f ./usr/lib/enigma2/python/Components/
else
	$(error Unsupported Python version: $(PYTHON_VERSION_TO_USE))
endif

build_data_package:
	@echo
	@echo Build data.tar.gz
	@echo =================
	tar --numeric-owner --group=0 --owner=0 -czf ./deploy/data.tar.gz ./usr/*

build_control_package:
	@echo
	@echo Build control.tar.gz
	@echo ====================
	cp deploy/control/control deploy/control/control_backup
	sed -i 's/Version:/Version: $(PKGV)/' deploy/control/control
	tar --numeric-owner --group=0 --owner=0 -czf ./deploy/control.tar.gz -C ./deploy/control control
	@# Restore original control file
	mv deploy/control/control_backup deploy/control/control

build_ipk_package:
	@echo
	@echo Build ipk
	@echo =========
	echo 2.0 > ./deploy/debian-binary
	mkdir -p ipk
	tar --numeric-owner --group=0 --owner=0 -cf ./ipk/enigma2-plugin-skins-simple-glass_$(PKGV)_all.ipk -C ./deploy debian-binary data.tar.gz control.tar.gz

clean_intermediate:
	@echo
	@echo Clean up intermediate files
	@echo ===========================
	find ./usr/lib/enigma2/python/Components -type f -name '*.py?' -exec rm {} \;
	find ./deploy -maxdepth 1 -type f -exec rm {} \;

clean: clean_intermediate
	@echo
	@echo Clean up all build files
	@echo ========================
	rm -r -f ./ipk
