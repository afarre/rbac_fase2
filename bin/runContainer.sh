#!/bin/bash
echo $PAM_USER > /tmp/aux
echo "executing: docker run -it $PAM_USER bash as `whoami`" >> /tmp/aux
`docker run -it $PAM_USER bash`
