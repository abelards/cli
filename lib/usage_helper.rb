class UsageHelper < Middleman::Extension
  CMDS = [
    {
      desc: "Create new apps",
      cmds: [{ name: "create",    example: "scalingo create my-new-app" }]
    }, {
      desc: "Setup your account SSH keys",
      cmds: [
        { name: "keys",           example: "scalingo -a myapp keys" },
        { name: "keys-add",       example: "scalingo -a myapp keys-add \"Laptop SSH key\" $HOME/.ssh/id_rsa.pub" },
        { name: "keys-remove",    example: "scalingo -a myapp keys-remove \"Laptop SSH key\"" }
      ]
    }, {
      desc: "Configure their environment",
      cmds: [
        { name: "env",            example: "scalingo -a myapp env" },
        { name: "env-set",        example: "scalingo -a myapp env-set NODE_ENV=production" },
        { name: "env-unset",      example: "scalingo -a myapp env-unset NODE_ENV" }
      ]
    }, {
      desc: "Configure custom domain names",
      cmds: [
        { name: "domains",        example: "scalingo -a myapp domains" },
        { name: "domains-add",    example: "scalingo -a myapp domains-add example.com" },
        { name: "domains-remove", example: "scalingo -a myapp domains-remove example.com" },
        { name: "domains-ssl",    example: "scalingo -a myapp domains-ssl example.com --cert file.crt --key file.key" }
      ]
    }, {
      desc: "List existing addons and plans",
      cmds: [
        { name: "addons-list",    example: "scalingo addons-list" },
        { name: "addons-plans",   example: "scalingo addons-plans scalingo-mongodb" }
      ]
    }, {
      desc: "Manage addons of your applications",
      cmds: [
        { name: "addons",         example: "scalingo -a myapp addons" },
        { name: "addons-add",     example: "scalingo -a myapp addons-add scalingo-mongodb 1" },
        { name: "addons-remove",  example: "scalingo -a myapp addons-remove myapp_12345" },
        { name: "addons-upgrade", example: "scalingo -a myapp addons-upgrade myapp_12345 2" }
      ]
    }, {
      desc: "Watch the logs",
      cmds: [{ name: "logs",      example: "scalingo -a myapp logs -f" }]
    }, {
      desc: "Run custom job",
      cmds: [{ name: "run", example: "scalingo -a myapp run bundle exec rails console" }]
    }, {
      desc: "Access your database",
      cmds: [{ name: "db-tunnel", example: "scalingo -a myapp db-tunnel SCALINGO_MONGODB_URL" }]
    }, {
      desc: "Manage containers, scale",
      cmds: [
        { name: "ps",             example: "scalingo -a myapp ps" },
        { name: "restart",        example: "scalingo -a myapp restart web:1" },
        { name: "scale",          example: "scalingo -a myapp scale worker:2" },
      ]
    }
  ]

  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def usage
      "<div class='usage'>" +
      CMDS.map do |c|
        "<div class='row'><div class='col-xs-4'><span class='description'><span class='arrow'>→</span>#{c[:desc]}</span></div>#{subcmds(c[:cmds])}</div>"
      end.join("\n") + "</div>"
    end

    def subcmds(cmds)
      "<div class='col-xs-8'><code>scalingo #{cmds.map{|c|
        "<span class='subcmd'>#{c[:name]}</span>" }.join("|")
      }</code>" +
      "<div class='examples'><pre><code>#{cmds.map{|c| c[:example] }.join("\n")}</code></pre></div></div>"
    end
  end
end

::Middleman::Extensions.register(:usage_helper, UsageHelper)

