module github.com/kubernetes-csi/csi-driver-lvm

go 1.13

require (
	github.com/container-storage-interface/spec v1.3.0
	github.com/davecgh/go-spew v1.1.1
	github.com/evanphx/json-patch v4.5.0+incompatible
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/golang/groupcache v0.0.0-20190129154638-5b532d6fd5ef
	github.com/golang/protobuf v1.3.3
	github.com/google/uuid v1.1.1
	github.com/googleapis/gnostic v0.2.0
	github.com/imdario/mergo v0.3.7
	github.com/kubernetes-csi/csi-lib-utils v0.7.0
	github.com/kubernetes-csi/external-snapshotter/v2 v2.1.1
	github.com/pborman/uuid v1.2.0
	github.com/sirupsen/logrus v1.2.0
	github.com/spf13/pflag v1.0.5
	golang.org/x/crypto v0.0.0-20190820162420-60c769a6c586
	golang.org/x/net v0.0.0-20191209160850-c0dbc17a3553
	golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45
	golang.org/x/sys v0.0.0-20191220220014-0732a990476f
	golang.org/x/text v0.3.2
	golang.org/x/time v0.0.0-20190308202827-9d24e82272b4
	google.golang.org/grpc v1.30.0
	k8s.io/api v0.17.3
	k8s.io/apimachinery v0.17.3
	k8s.io/client-go v0.17.0
	k8s.io/klog v1.0.0
	k8s.io/kubernetes v1.14.0
	k8s.io/utils v0.0.0-20191114184206-e782cd3c129f
)
