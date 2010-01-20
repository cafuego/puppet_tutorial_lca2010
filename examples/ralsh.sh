ralsh package
ralsh user root
ralsh service foo 
ralsh user foo ensure=present shell=/bin/bash home=/Users/foo
ralsh user foo shell=/usr/bin/bash
ralsh user foo ensure=absent
