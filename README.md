# CSI Hostpath Driver

This repository hosts the CSI Hostpath driver and all of its build and dependent configuration files to deploy the driver.

## Pre-requisite
- Kubernetes cluster
- Running version 1.13 or later
- Access to terminal with `kubectl` installed
- For Kubernetes 1.17 or later, the VolumeSnapshot beta CRDs and Snapshot Controller must be installed as part of the cluster deployment (see Kubernetes 1.17+ deployment instructions)
- Parameters have been set for local node in /etc/lvm/lvm.conf: udev_sync=0,udev_rules=0
- Every local node has created a VG volume. The name of the VG volume begins with lvm. The name of the VG volume on local nodes remains the same (like lvmvg1)

## Deployment
- step 1: Create rbac
```shell
kubectl apply -f ./deploy/csi-sa.yaml
```
- step 2: Create localdisk csi driver
```shell
kubectl apply -f ./deploy/csi-hostpath-driverinfo.yaml
```
- step 3: Create csi provisioner
```shell
kubectl apply -f ./deploy/csi-hostpath-provisioner.yaml
```
- step 4: Create csi plugin
```shell
kubectl apply -f ./deploy/csi-hostpath-pluginDS.yaml
```
- step 5: Create csi attacher
```shell
kubectl apply -f ./deploy/csi-hostpath-attacher.yaml
```
- step 6: Create csi resizer
```shell
kubectl apply -f ./deploy/csi-hostpath-resizer.yaml
```
- step 7: Create csi snapshot controller
```shell
kubectl apply -f ./deploy/csi-hostpath-snapshotter.yaml
```
- step 8: Create lvm scheduler
```shell
kubectl apply -f ./deploy/lvm-scheduler.yaml
```

## Examples
The following examples assume that the CSI hostpath driver has been deployed and validated:
- Volume snapshots
  - [Kubernetes 1.17 and later](docs/example-snapshots-1.17-and-later.md)
  - [Kubernetes 1.16 and earlier](docs/example-snapshots-pre-1.17.md)
- [Inline ephemeral volumes](docs/example-ephemeral.md)

## Building the binaries
If you want to build the driver yourself, you can do so with the following command from the root directory:

```shell
make hostpath
```

## Community, discussion, contribution, and support

Learn how to engage with the Kubernetes community on the [community page](http://kubernetes.io/community/).

You can reach the maintainers of this project at:

- [Slack](http://slack.k8s.io/)
- [Mailing List](https://groups.google.com/forum/#!forum/kubernetes-dev)

### Code of conduct

Participation in the Kubernetes community is governed by the [Kubernetes Code of Conduct](code-of-conduct.md).

[owners]: https://git.k8s.io/community/contributors/guide/owners.md
[Creative Commons 4.0]: https://git.k8s.io/website/LICENSE
