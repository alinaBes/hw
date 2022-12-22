
#### [0.5] What is Docker, and how it differs from dependencies management systems? From virtual machines?

Докер-это программа, которая взаимодействует с системой, чтобы создавать и удалять контейнеры. 
Контейнеры-метод изоляции зависимостей (способ борьбы с dependence hell). Они работают внутри одной операционной системы. Также в этой системе есть container engine (например docker)-некоторое описание того, что и как можно установить в систему и что будет с ней после этого.

Виртуальные машины-это изоляция зависимостей на уровне целой операционной системы. На компьютере стоит несколько операционных систем, которые могут запускать программы на одном и том же железе(гипервизор-программа,которая стоит над всеми ОП и позволяет запускать программы на одном и том же железе). Виртуальные машины-это очень тяжеловесная система. 

Пакеты-это набор файлов, архив, содержащий файлы самой программы, метаданные и другие файлы. Пакетный менеджер определенным образом распаковывает архив, организует выполнение ряда команд таким образом, чтобы программное обеспечение правильно установилось, были соблюдены все зависимости. 


#### [0.5] What are the advantages and disadvantages of using containers over other approaches?

Преимущество контейнеров перед виртуальными машинами в том, что они используют меньше ресурсов, так как не включают в себя копию операционной системы. Это обеспечивает гибкое использование ресурсов и большую эффективность. Контейнеры позволяют быстрее устанавливать и исправлять приложения. 
Минусы в том, что трудно управлять большим количеством контейнеров. Контейнеры не универсальны, подходят не для всех задач, для некоторых лучше виртуальные машины.

#### [0.5] Explain how Docker works: what are Dockerfiles, how are containers created, and how are they run and destroyed?

Докер-это программа, которая позволяет создавать и удалять контейнеры. 
есть компоненты этой системы:
образ-это набор файлов, в них записано все, чтобы начать работу с программой на голой машине с установленным Docker: ОС, среда выполнения и приложение, готовое к развертыванию. Образ состоит из слоев, каждый из которых-набор файлов и директорий. Неизменяемость слоев позволяет их использовать совместно в разных образах.
Docker-контейнер строится на основе образа. Суть преобразования образа в контейнер состоит в добавлении верхнего слоя, для которого разрешена запись. Результаты работы приложения (файлы) пишутся именно в этом слое.
Верхний слой контейнера отличается от остальных только лишь разрешением на запись, в остальном это обычный слой — набор файлов и директорий. Если сделать верхний слой read only, получится преобразовать контейнер в образ.

Когда мы загружаем докер на компьютер, то docker client-программа, с помощью которой мы можем создавать и управлять контейнерами, а также взаимодействовать с docker-daemon-службой, которая управляет докер-объектами (хранилищами, образами и контейнерами). 

Dockerfile представляет собой набор инструкций, на основе которых строится новый образ.Каждая инструкция добавляет новый слой к образу.

Изоляция достигается за счет использования таких Linux-механизмов, как namespaces и control groups. Если говорить просто, то namespaces обеспечивают изоляцию в рамках ОС, а control groups устанавливают лимиты на потребление контейнером ресурсов хоста, чтобы сбалансировать распределение ресурсов между запущенными контейнерами.
Команда для создания контейнера по изображению:

    docker create [OPTIONS] IMAGE [COMMAND] [ARG...]

КАк запустить контейнер:

    docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Как уничтожить контейнер:

    docker kill [OPTIONS] CONTAINER [CONTAINER...]

#### [0.25] Name and describe at least one Docker competitor (i.e., a tool based on the same containerization technology).

Podman-это инсрумент для поиска, сборки, передачи и запуска приложений. Может работать без прав доступа root. Как и docker, это утилита командной строки, предназначенных для решения различных задач процесса контейнеризации, который может работать как модульная структура. Он включает в себя: модули и управление изображениями контейнеров, конструктор контейнеров, менеджер проверки изображений контейнеров, средство запуска контейнеров и конструктор объектов.
Как следует из названия, Podman может создавать контейнерные "модули",которые работают вместе. Основное преимущество заключается в том, что разработчики могут совместно использовать ресурсы, используя разные контейнеры для одного и того же приложения внутри модуля: контейнер для интерфейса, другой для бэкенда и базы данных.      

#### [0.25] What is conda? How it differs from apt, yarn, and others?
Conda-это система управления пакетами с открытым исходным кодом и система управления средой для установки нескольких версий программных пакетов и их зависимостей и легкого переключения между ними. Conda позволяет пользователям легко устанавливать различные версии двоичных программных пакетов и любые необходимые библиотеки, подходящие для их вычислительной платформы. Кроме того, это позволяет пользователям переключаться между версиями пакетов и загружать и устанавливать обновления из репозитория программного обеспечения.
С помощью conda можно установить очень много программ, написанных на разных языках программирования. можно скачать библиотеки Python, R библиотеки, Node.js , программы Java, программы и библиотеки C и C++, программы на Perl и еще многие другие. 
Conda в отличие от apt, yarn и других пакетных менеджеров может работать локально для каждого пользователя независимо, и не требует системных прав.









        #Create conda environment and export it to file:
        conda config --add channels bioconda
        conda config --add channels conda-forge
        conda create --name myenv
        conda install -c bioconda star
        conda install -c bioconda samtools
        conda install -c bioconda picard
        conda install -c bioconda salmon
        conda install -c bioconda bedtools
        conda install -c bioconda multiqc
        conda myenv  export > environment.yml


#create a docker-file and turn it to a container

#create empty directory 
mkdir my_docker
#create dockerfile
touch Dockerfile

#write all dependencies and command that we want to work inside container


        #base is latest ubuntu
        FROM ubuntu:22.04
        #get utilits that we need to install programs
        RUN apt-get update -y &&\
           apt-get -y install make &&\
           apt-get -y install wget &&\
           apt-get -y install unzip &&\
           apt-get -y install perl &&\
           apt-get -y install bzip2 &&\
           apt-get -y install git &&\
           apt-get -y install curl &&\
           apt-get -y install make &&\ 
           #this commands is to delete the apt-get lists after installing something
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
        
        #add labels
        LABEL author="Aina Bespalova" \
              maintainer="lina.bespalowa@yandex.ru" \
              created="2022-12-22 11:33"\
              ubuntu_version=22.01 \
              "description"="container with programs for bioinformatic work"


Then we build the image using this dockerfile 

        docker build -t my_own_image ./

and run the container

        docker run --name my_own_image --rm -it my_own_image


