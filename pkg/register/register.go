package register

import (
	"github.com/kubernetes-csi/csi-driver-lvm/pkg/scheduler"
	"github.com/spf13/cobra"
	"k8s.io/kubernetes/cmd/kube-scheduler/app"
)

func Register() *cobra.Command {
	return app.NewSchedulerCommand(
		app.WithPlugin(scheduler.Name, scheduler.New),
	)
}
