settings{
    pidfile = "/var/log/lsyncd/lsyncd.pid",
    logfile = "/var/log/lsyncd/lsyncd.log",
    statusFile = "/var/log/lsyncd/lsyncd-status.log",
    statusInterval = 1,
    maxDelays = 1,
    -- nodaemon = true,
}

sync{
    default.rsyncssh,
    source = "/home/monk/workspace",
    host = "172.16.20.111",
    targetdir = "/var/www/workspace",
    exclude={ ".*", "*.tmp" },
    rsync = {
        compress = false,
        _extra = {"--bwlimit=50000"},
    }
}
