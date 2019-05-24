{application, fake_service,
 [{description, "A Fake Service to be started and stopped as a System Daemon"},
  {vsn, "0.1.0"},
  {registered, [service_sup]},
  {application, [kernel, stdlib]},
  {mod, {fake_service_app, []}},
  {env, []},
  {modules, []}
 ]
}.
