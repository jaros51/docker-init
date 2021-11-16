-t => názov a voliteľne aj tag za : (default latest)
```shell
docker build -t {NAME} .
```

Zoznam zbuildovaných image-ov
```shell
docker images
```

Zoznam kontajnerov (bez ďalších parametrov zobrazí len tie, ktoré sú spustené)

```shell
docker ps
docker container ls
```
Zoznam všetkých (aj zastavených)

```shell
docker ps -a
```
Zoznam kontajnerov s použitím --filter [label]

```shell
docker ps --filter "label=color=blue"
```

Zoznam kontajnerov s použitím --filter [name] - funguje ako LIKE %%

```shell
docker ps --filter "name=motorova_mys"
```
Zmazanie kontajnera

```shell
docker rm {NAZOV_KONTAJNERA}
```
Zmazanie všetkých bežiacich kontajnerov -q -> vráti len ID kontajnerov

```shell
docker rm $(docker ps -a -q)
```
Zmazanie image-u (môže byť použitý name alebo ID)

```shell
docker rmi {NAME_or_ID}
```
Spustenie nového kontajnera

```shell
docker run {PARAMETRE}
```

Spustenie existujúceho kontajnera

```shell
docker start {NAME_or_ID}
```
Zastavenie kontajnera

```shell
docker stop {NAME_or_ID}
```
Zastavenie všetkých bežiacich kontajnerov - argumentom funkcie stop je zoznam ID spustených kontajnerov

```shell
docker stop $(docker ps -a -q)
```
Spustí príkaz v spustenom kontajneri (budem používať neskôr na spustenie shell príkazového riadku)

```shell
docker exec {PARAMETRE}
```

Prepnutie do príkazového riadku kontajnera (v prípade, že baseimage vychádza z unix jadra)

```shell
docker exec -it CONTAINER_NAME_or_ID sh
```

Príklad na záver

```shell
docker run -d -p 127.0.0.1:8080:80 --name test tutum/hello-world
```

Následne prejdi v prehliadači na adresu http://localhost:8080



















#FROM
inicializuje image, ktorý potrebuje vychádzať z nejakého základneho image-u
obvykle to býva z oficiálneho Docker Hubu
#LABEL
definovanie metadát pre image
služí pre lepšiu informovanosť a možnosti pokročilejšej filtrácie v zozname image-ov
#RUN
najčastejšie využívané pre inštaláciu knižníc a závislosti pre daný OS
#CMD
spúšťa nejaký program v podobe napríklad shell príkazu spolu s argumentami
#ENTRYPOINT
spúšťa nejaké príkazy po naštartovaní kontajnera (podobne ako CMD)
podporuje navyše dynamicky zadané argumenty pri štartovaní kontajnera
cez CMD sa môžu definovať default argumenty - pokiaľ ich nezadal používateľ
#EXPOSE
definovanie portov, na ktorých môže počúvať bežiaci kontajner
samotné publikovanie portu sa robí až pri spúšťaní kontajnera
#ENV
premenné prostredia
môžu sa v nich uchovávať nejaké nemenné hodnoty, napr. verzie balíčkov
#ADD a COPY
oba fungujú podobne, kopírujú súbory z nejakého zdroja do image-u
ADD môže kopírovať súbory aj zo vzdialenej URL adresy
#VOLUME
inštrukcia pre vytvorenie zväzku - virtuálne úložisko pre dáta
obvykle sa sem ukladajú dáta, ktoré chcete aby ostali perzistentné ja po tom, ako kontajner prestane bežať
#USER
definovanie používateľa, pod ktorým bude bežať kontajner po jeho naštartovaní
#WORKDIR
nastavenie sa do priečinka, v ktorom budú iné inštrukcie pracovať
ekvivalent príkazu "cd /path" - tento tvar sa ale v Dockerfile neodporúča