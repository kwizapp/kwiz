# kwiz

## Development

Please go through the installation steps [here](https://github.com/kwizapp/kwiz/wiki/Local-K8s-Development-with-microk8s-and-garden).

These steps will tell you how to setup the development environment with the help of microk8s and garden.

After you've done that, you can run the following command to start the local cluster with all running apps in dev mode.

```bash
garden dev
```

## Git Submodules

Clone repository recursively (can also be SSH)

`git clone --recurse-submodules https://github.com/kwizapp/kwiz.git`

`git submodule update --remote`
