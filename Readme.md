Used Bastion Host on AWS with Admin Role attached to it.

Versions used:
```
Terraform v0.12.19
+ provider.aws v3.37.0
+ provider.null v3.1.0
```

Steps to launch this module:
```
1.  cd modules/
2.  terraform init
3.  terraform apply   -var-file regions/Virginia.tfvars 
```

Sorry didnt have time to make it pretty  and more professional. This is just to give you an idea.


# TorGuard WireGuard Config
[Interface]
PrivateKey = UKSWiHJiSu3/nplNCazZN2m4DK3rUDWMBssruDcm23A=
ListenPort = 57868
MTU = 1390
DNS = 1.1.1.1
Address = 10.13.92.241/24

[Peer]
PublicKey = Jh0cPb8KC5LR7XkB7PPEZOb/slUHxQImFBqHBO8VMko=
AllowedIPs = 0.0.0.0/0
Endpoint = 45.128.36.178:1443
PersistentKeepalive = 25
