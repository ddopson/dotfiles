/usr/bin/ant -logger org.apache.tools.ant.listener.AnsiColorLogger "$@" | perl -pe 's/(?<=\e\[)2;//g'

