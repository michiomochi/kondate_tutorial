## Setting up

```
$ vagrant plugin install dotenv
$ vagrant up
$ vagrant vbguest
$ vagrant ssh-config --host itamae_test >> ~/.ssh/config
```

## Run itamae in vagrant VM

```
$ bundle _1.10.6_ exec kondate itamae itamae_test --vagrant --role 'role_name'
```

## Run serverspec

```
$ bundle _1.10.6_ exec kondate serverspec itamae_test --role 'role_name'
```
