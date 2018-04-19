FROM openjdk

ENV MAVEN_HOME /usr/share/maven

RUN MAVEN_VERSION=3.3.9 && \
  cd /usr/share && \
  wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O - | tar xzf - && \
  mv /usr/share/apache-maven-$MAVEN_VERSION $MAVEN_HOME && \
  ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn
  
 ADD root /
 
 RUN cd /app && \
   mvn -V -U -B DskipTest clean dependency:list install
   
 EXPOSE 8080
