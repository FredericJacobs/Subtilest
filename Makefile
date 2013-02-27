
all: pod patch

pod:
	pod install
	
patch:
	cd Pods/xmlrpc; patch -p1 < ../../Patches/xmlrpc-fix-threading-issue.patch
