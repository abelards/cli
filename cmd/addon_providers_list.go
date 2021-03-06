package cmd

import (
	"github.com/Scalingo/cli/Godeps/_workspace/src/github.com/Scalingo/codegangsta-cli"
	"github.com/Scalingo/cli/addon_providers"
)

var (
	AddonProvidersListCommand = cli.Command{
		Name:        "addons-list",
		Category:    "Addons - Global",
		Description: "List all addons you can add to your app.",
		Usage:       "List all addons",
		Action: func(c *cli.Context) {
			if err := addon_providers.List(); err != nil {
				errorQuit(err)
			}
		},
	}
)
