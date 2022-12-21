# Homework2 jbrowser
#### [0.4] What are computer ports on a high level? How many ports are there on a typical computer?
Сетевой порт используется для опреления процесса-получателя пакета в пределах одного IP-адреса. 
Порт отображается в виде 16 битного числа от 1 до 65535, которое доступно приложениям для того, чтобы обмениваться трафиком. На каждом компе существует 65535 сетевых портов. 
#### [0.4] What is the difference between http, https, ssh, and other protocols? In what sense are they similar? Name default ports for several data transfer protocols.
http, https-протоколы, с помощью которых происходит взаимодействие пользователей с сайтами в интернете. Аббревиатура HTTP обозначает Hyper Text Transfer Protocol то есть протокол передачи гипертекста.
А последняя с в https означает Security (Безопасность).
Оба протокола используют TCP, но http еще пользуется UPD (применяются в видеоконференциях, играх и потоковой передаче). https шифрует передаваемые данные открытым ключом, а затем получатель расшифровывает его. Открытый ключ лежит на сервере.  
ssh (secure shell,защищенная консоль)-протокол позволяет который нужен, чтобы соединяться с удаленными серверами и выполнять там команды, работает на основе криптографии. Ему нужна ключевая пара(публичный ключ и приватный), чтобы заходить на сервер с компьютера. 
#### [0.4] Explain briefly: (1) what is IP, (2) what IPs are called 'white'/public, (3) and what happens when you enter 'google.com' into the web browser.
IP-адрес-это 'адрес' определенного компьютера, уникальный идентификатор устройства из определенного количества цифр. Количество идентификаторов ограничено, поэтому существуют публичные IP, которые обычно покупают компании типа гугл или опреаторы сотовой связи. 
В локальных сетях вроде вай-фай раздачи от одного модема у каждого подключенного к вай-фаю устройства есть свой неофициальный IP-адрес. 
Есть DNS-сервер, который преобразует имена серверов в ip-адреса. Когда мы вводим в строку поиска google.com, мы отправляем запрос в ближайший DNS-сервер, какой IP скрывается за этим именем, и мы делаем запрос на конкретный сервер. 
#### [0.4] What is Nginx? How does it work on the high level? List several alternative web servers.
Nginx-это веб-сервер, он обслуживает веб-странички (это сервер как приложение).Используется для обработки запросов с сайтов, где очень много контента, распределяет нагрузку по портам в серверах, на которые поступает много запросов одновременно. Альтернативы nginx- HA Proxy,Pound.
#### [0.4] What is SSH, and for what is it typically used? Explain two ways to authenticate in an SSH server in detail.
ssh- это протокол взаимодействия компьютера с удаленным сервером. Авторизоваться на сервере можно при помощи ввода обычного логина и пароля, или с помощью публичного и приватного ключей. с помощью программы ssh-keygen,  администратор сервера генерирует два ключа для пользователя (публичный и приватный), приватный он отправляет пользователю, публичный сохраняет в памяти на сервере. Пользователь сохраняет у себя в папке ssh  приватный ключ и может войти на сервер с этого компа, введя пасс-фразу. 




    #generate public and private keys to login in server
    ssh-keygen
    #enter the server
    ssh alinabespalova@84.252.142.25
    #download files
    wget https://ftp.ensembl.org/pub/release-108/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
    wget https://ftp.ensembl.org/pub/release-108/gff3/homo_sapiens/Homo_sapiens.GRCh38.108.gff3.gz
    #unpack files 
    gunzip Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz

    #install some of necessary tools 
    sudo apt install samtools
    sudo apt install tabix
    sudo apt install genometools
    sudo apt install nodejs
    sudo apt install npm
    sudo npm install -g @jbrowse/cli
    #check that browser was installed 
    jbrowse --version

    #index fasta file 
    samtools faidx Homo_sapiens.GRCh38.dna.primary_assembly.fa
    #sort and index gff file
    gt gff3 -sortlines Homo_sapiens.GRCh38.108.gff3.gz  > output.gff
    bgzip output.gff
    tabix -p gff output.gff.gz 


    #create 
    sudo jbrowse create /var/www/html/jbrowse/ 
    #add to nginx config 
    sudo nano /etc/nginx/nginx.conf

    server {
          listen 80;
          index index.html;

          location /jbrowse/ {
              alias /home/alinabespalova/jbrowse2/;    
          }
      }

    sudo nginx -s reload
    
#checking link 
<http://84.252.142.25/jbrowse/>

    #add my files to jbrowser 
    sudo jbrowse add-assembly Homo_sapiens.GRCh38.dna.primary_assembly.fa --load copy --out /var/www/html/jbrowse/
    sudo jbrowse add-track output.gff.gz --load copy --out /var/www/html/jbrowse

#link for jbrowser session 
<http://84.252.142.25/jbrowse/?session=local--1DAC_cgw>
