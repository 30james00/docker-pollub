# Laboratorium 5

## Zadanie 1 (`z1.sh`)
Wykonałem tylko część obowiązkową (punkt 1).  
Sieć bridge2 ustawiłem jak standardową sieć z NAT-em.  
Przygotowałem też skrypt `clean.sh` do szybkiego kasowania efektów wykonania skryptów wykonywanych w laboratorium.  
Wynik poleceń `docker inspect` dla poszczególnych sieci wskazujący na podłączenie żądanych konternerów:  
Default bridge network
```json
[
    {
        "Name": "bridge",
(...)
        "Containers": {
            "3e237ef493c0d80cf68ef311185a653e321a64917478adb15bb0940cadf38daa": {
                "Name": "t1",
                "EndpointID": "ec5f8649649253543f2f753fbd7de298d8622186389eaa80d785fd4e16e8d393",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "c6ad45e688d90e2896929d6db11a269312e1ca76e5288c65ead666c264e73b4a": {
                "Name": "t2",
                "EndpointID": "c1a43f3551953e1c4b58c02e21eeed355c8c544ff914b5024ca19b01007d319e",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
(...)
    }
]
```
bridge1
```json
[
    {
        "Name": "bridge1",
(...)
        "Containers": {
            "99d9aa2181867e8a5e175d85c4d81c8bc22cf7833228fe57f4b5fdc2c859b56c": {
                "Name": "d2",
                "EndpointID": "f95268fc69c848217c837f2da115acf8bc79146469d5efefc95a607a7992b246",
                "MacAddress": "02:42:0a:00:0a:03",
                "IPv4Address": "10.0.10.3/24",
                "IPv6Address": ""
            },
            "b485a38c648ed9f821907b2cf65e5c842abf08bc1b760a7cf570cffba3605df2": {
                "Name": "d1",
                "EndpointID": "5cf02e3ba59c48348ece4ea8c99f76369addfdb4942176f4935fb202817b3e62",
                "MacAddress": "02:42:0a:00:0a:fe",
                "IPv4Address": "10.0.10.254/24",
                "IPv6Address": ""
            },
            "c6ad45e688d90e2896929d6db11a269312e1ca76e5288c65ead666c264e73b4a": {
                "Name": "t2",
                "EndpointID": "dda3598f4a0fdee7a36b69ff3d71888f40d425013322c1a24ecab5a0a30d60c1",
                "MacAddress": "02:42:0a:00:0a:02",
                "IPv4Address": "10.0.10.2/24",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```
bridge2
```json
[
    {
        "Name": "bridge2",
(...)
        "Containers": {
            "99d9aa2181867e8a5e175d85c4d81c8bc22cf7833228fe57f4b5fdc2c859b56c": {
                "Name": "d2",
                "EndpointID": "b8801706eed7af554ae08f6ed6c41169f6ac780a19d1e06e187ec1a2f10ea052",
                "MacAddress": "02:42:0a:00:0b:02",
                "IPv4Address": "10.0.11.2/24",
                "IPv6Address": ""
            },
            "e603688dc6aabd2c1e803a553de72cd32930a9e0e81fc081fc2b757ac51ab725": {
                "Name": "s1",
                "EndpointID": "60982d5b3cb02733de0579f1a1387892c233c505723dbee9cba18b4253dd2eb4",
                "MacAddress": "02:42:0a:00:0b:03",
                "IPv4Address": "10.0.11.3/24",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```
## Zadanie 3 (`z3.sh`)
Skrypt używa `jq` do JSONów.  
Skrypt jest analogiczny do poprzedniego z dodanymi aliasami i usuniętymi niepotrzebnymi elementami.  
Fragmenty polecenia `docker inspect` wskazujące na pomyśle ustawienie aliasów.

D1
```json
      "Networks": {
        "bridge1": {
          "IPAMConfig": {
            "IPv4Address": "10.0.10.254"
          },
          "Links": null,
          "Aliases": [
            "host1",
            "a42cbb2e4c0f"
          ],
```
D2
```json
      "Networks": {
        "bridge1": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": [
            "apa1",
            "9c824f10ece7"
          ],
(...)
        "bridge2": {
          "IPAMConfig": {},
          "Links": null,
          "Aliases": [
            "apa2",
            "9c824f10ece7"
          ],
```
S1
```json
      "Networks": {
        "bridge2": {
          "IPAMConfig": null,
          "Links": null,
          "Aliases": [
            "host2",
            "d2145cb8eaea"
          ],
```
### Pytanie 1
Kontenery przyłączone do dwóch różnych sieci NIE mogą się komunikować za pomocą aliasów, gdyż ich zasięg jest ograniczony do danej sieci