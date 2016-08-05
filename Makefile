# Trivial Makefile for Schunk driver.

CCS = demo.cc \
      wsg_command_message.cc wsg_command_sender.cc \
      wsg_return_message.cc wsg_return_receiver.cc

HS = crc.h defaults.h \
     wsg_command_sender.h wsg_command_message.h \
     wsg_return_message.h wsg_return_receiver.h \
     wsg.h

BINDIR = bin

CXXFLAGS += -std=c++11

.PHONY: demo
demo: $(BINDIR)/demo

clean:
	rm -rf $(BINDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

$(BINDIR)/demo: $(BINDIR) $(CCS) $(HS)
	$(CXX) $(CXXFLAGS) $(filter %.cc,$^) -o $@
