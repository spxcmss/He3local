package lvmclient

import (
	"fmt"
	pb "github.com/kubernetes-csi/csi-driver-lvm/pkg/lvmpb"
	"github.com/kubernetes-csi/csi-driver-lvm/pkg/util"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"log"
)

func DeleteVolInLVM(ctx context.Context, volumeID string) error {

	address, err := util.GetNodeAddress(ctx, volumeID)
	if err != nil {
		if err.Error() == "not node address in pv" {
			fmt.Printf("not node address in pv for %s \n", volumeID)
			return nil
		} else {
			return err
		}
	}

	conn, err := grpc.Dial(address+":50001", grpc.WithInsecure())

	if err != nil {
		//log.Fatalf("did not connect: %v", err)
		fmt.Printf("did not connect: %v", err)
	}

	defer conn.Close()

	c := pb.NewLVMVolumeClient(conn)

	reques := pb.DeleteVolumeRequest{
		VolumeID: volumeID,
	}

	r, err := c.DeleteVolume(ctx, &reques)
	if err != nil {
		fmt.Printf("could not delete vol %s: %v", volumeID, err)
		return err
	}

	log.Println(r)
	return nil

}
