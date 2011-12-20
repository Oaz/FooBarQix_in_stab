#!/usr/bin/make

STAB_BIN=../stab-1.0beta4/bin
STABC=$(STAB_BIN)/stabc.jar
STABRT=$(STAB_BIN)/stabrt.jar
JUNIT=/usr/share/java/junit4-4.5.jar
MAIN_CLASS=TestFooBarQix
OTHER_CLASSES=FooBarQix

default: tests

stabchelp:
	java -jar $(STABC) -help

build:
	java -jar $(STABC) -cp:"$(STABRT);$(JUNIT)" $(MAIN_CLASS).stab $(addsuffix .stab,$(OTHER_CLASSES))

tests: build
	java -cp "$(MAIN_CLASS).jar:$(STABRT):$(JUNIT)" org.junit.runner.JUnitCore $(MAIN_CLASS)


