package addons

import (
	"os"

	"github.com/Scalingo/cli/api"
	"github.com/olekukonko/tablewriter"
	"gopkg.in/errgo.v1"
)

func List(app string) error {
	resources, err := api.AddonsList(app)
	if err != nil {
		return errgo.Mask(err, errgo.Any)
	}

	t := tablewriter.NewWriter(os.Stdout)
	t.SetHeader([]string{"Addon", "ID", "Plan"})

	for _, resource := range resources {
		t.Append([]string{resource.AddonProvider.Name, resource.ResourceID, resource.Plan.Name})
	}
	t.Render()

	return nil

}