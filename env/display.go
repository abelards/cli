package env

import (
	"fmt"

	"github.com/Scalingo/cli/Godeps/_workspace/src/gopkg.in/errgo.v1"
	"github.com/Scalingo/cli/api"
)

func Display(app string) error {
	vars, err := api.VariablesList(app)
	if err != nil {
		return errgo.Mask(err, errgo.Any)
	}

	for _, v := range vars {
		fmt.Printf("%s=%s\n", v.Name, v.Value)
	}
	return nil
}
