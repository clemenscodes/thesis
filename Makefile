INDEX = main
MAIN_TEX = $(INDEX).tex
BUILD_DIR = build
SRC_DIR = src
LIB_DIR = lib

rwildcard = $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2)$(filter $(subst *,%,$2),$d))
TEX_FILES = $(call rwildcard,$(SRC_DIR)/,*.tex)
LIB_FILES = $(call rwildcard,$(LIB_DIR)/,*.tex) \
            $(call rwildcard,$(LIB_DIR)/,*.bst) \
            $(call rwildcard,$(LIB_DIR)/,*.bib)

LATEXMK = latexmk

all: build

build: $(MAIN_TEX) $(TEX_FILES) $(LIB_FILES)
	@$(LATEXMK)

clean:
	@$(LATEXMK) -c
	@rm -rf $(BUILD_DIR)

cleanall:
	@$(LATEXMK) -CA
	@rm -rf $(BUILD_DIR)

.PHONY: all clean cleanall
