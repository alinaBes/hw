FROM ubuntu:22.04
RUN apt-get update -y &&\
   apt-get -y install make &&\
   apt-get -y install wget &&\
   apt-get -y install unzip &&\
   apt-get -y install perl &&\
   apt-get -y install bzip2 &&\
   apt-get -y install git &&\
   apt-get -y install curl &&\
   apt-get -y install make &&\ 
   apt-get clean &&\
   rm -rf /var/lib/apt/lists/*

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.9.zip && \
    unzip fastqc_v0.11.9.zip && rm fastqc_v0.11.9.zip && \
    chmod a+x FastQC/fastqc && \
    echo 'alias fastqc="/FastQC/fastqc"'  

RUN wget https://github.com/alexdobin/STAR/releases/download/2.7.10b/STAR_2.7.10b.zip && \
    unzip STAR_2.7.10b.zip && rm STAR_2.7.10b.zip && \
    chmod a+x STAR_2.7.10b/Linux_x86_64_static/STAR && \
    mv STAR_2.7.10b/Linux_x86_64_static/STAR /bin/STAR && rm -r STAR_2.7.10b


RUN wget https://github.com/samtools/samtools/archive/refs/tags/1.16.1.zip -O ./samtools-1.16.1.zip && \
    unzip samtools-1.16.1.zip && rm samtools-1.16.1.zip && \
    mv samtools-1.16.1/misc samtools && rm -r samtools-1.16.1 && \
    echo 'alias samtools="/samtools/samtools.pl"'


RUN wget https://github.com/broadinstitute/picard/releases/download/2.27.5/picard.jar -O /bin/picard.jar && \
    chmod a+x /bin/picard.jar && \
    echo 'alias picard="java -jar /bin/picard.jar"' 

RUN wget https://github.com/COMBINE-lab/salmon/releases/download/v1.9.0/salmon-1.9.0_linux_x86_64.tar.gz && \
    tar -zxvf salmon-1.9.0_linux_x86_64.tar.gz && rm salmon-1.9.0_linux_x86_64.tar.gz && \
    chmod a+x salmon-1.9.0_linux_x86_64/bin/salmon && mv salmon-1.9.0_linux_x86_64/bin/salmon /bin/salmon && \
    rm -r salmon-1.9.0_linux_x86_64 

RUN wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools.static.binary -O /bin/bedtools.static.binary && \
    chmod a+x /bin/bedtools.static.binary && \
    echo 'alias bedtools="/bin/bedtools.static.binary"' 
RUN apt-get update && apt install -y python3 python3-pip
RUN pip3 install multiqc==1.13 

LABEL author="Aina Bespalova" \
      maintainer="lina.bespalowa@yandex.ru" \
	  created="2022-12-22 11:33"\
	  ubuntu_version=22.01 \
	  "description"="container with programs for bioinformatic work"
