# crio fish shell completion

function __fish_crio_no_subcommand --description 'Test if there has been any subcommand yet'
    for i in (commandline -opc)
        if contains -- $i config complete completion wipe help h
            return 1
        end
    end
    return 0
end

complete -c crio -n '__fish_crio_no_subcommand' -f -l additional-devices -r -d 'devices to add to the containers (default: [])'
complete -c crio -n '__fish_crio_no_subcommand' -f -l apparmor-profile -r -d 'default apparmor profile name (default: "crio-default-1.17.0-dev")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l bind-mount-prefix -r -d 'specify a prefix to prepend to the source of a bind mount (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l cgroup-manager -r -d 'cgroup manager (cgroupfs or systemd) (default: "cgroupfs")'
complete -c crio -n '__fish_crio_no_subcommand' -l cni-config-dir -r -d 'CNI configuration files directory (default: "/etc/cni/net.d/")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l cni-plugin-dir -r -d 'CNI plugin binaries directory (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -l config -s c -r -d 'path to configuration file'
complete -c crio -n '__fish_crio_no_subcommand' -l conmon -r -d 'path to the conmon executable (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l conmon-cgroup -r -d 'cgroup used for conmon process (default: "system.slice")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l conmon-env -r -d 'environment variable list for the conmon process, used for passing necessary environment variables to conmon or the runtime (default: ["PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"])'
complete -c crio -n '__fish_crio_no_subcommand' -l container-attach-socket-dir -r -d 'path to directory for container attach sockets (default: "/var/run/crio")'
complete -c crio -n '__fish_crio_no_subcommand' -l container-exits-dir -r -d 'path to directory in which container exit files are written to by conmon (default: "/var/run/crio/exits")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l ctr-stop-timeout -r -d 'the minimal amount of time in seconds to wait before issuing a timeout regarding the proper termination of the container (default: \'\x00\')'
complete -c crio -n '__fish_crio_no_subcommand' -f -l default-capabilities -r -d 'capabilities to add to the containers (default: ["CHOWN" "DAC_OVERRIDE" "FSETID" "FOWNER" "NET_RAW" "SETGID" "SETUID" "SETPCAP" "NET_BIND_SERVICE" "SYS_CHROOT" "KILL"])'
complete -c crio -n '__fish_crio_no_subcommand' -f -l default-mounts -r -d 'add one or more default mount paths in the form host:container (deprecated) (default: [])'
complete -c crio -n '__fish_crio_no_subcommand' -l default-mounts-file -r -d 'path to default mounts file (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l default-runtime -r -d 'default OCI runtime from the runtimes config (default: "runc")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l default-sysctls -r -d 'sysctls to add to the containers (default: [])'
complete -c crio -n '__fish_crio_no_subcommand' -f -l default-transport -r -d 'default transport (default: "docker://")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l default-ulimits -r -d 'ulimits to apply to containers by default (name=soft:hard) (default: [])'
complete -c crio -n '__fish_crio_no_subcommand' -f -l enable-metrics -d 'enable metrics endpoint for the server on localhost:9090'
complete -c crio -n '__fish_crio_no_subcommand' -f -l gid-mappings -r -d 'specify the GID mappings to use for the user namespace (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -l global-auth-file -r -d 'path to a file like /var/lib/kubelet/config.json holding credentials necessary for pulling images from secure registries (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l grpc-max-recv-msg-size -r -d 'maximum grpc receive message size in bytes (default: %!q(int=16777216))'
complete -c crio -n '__fish_crio_no_subcommand' -f -l grpc-max-send-msg-size -r -d 'maximum grpc receive message size (default: %!q(int=16777216))'
complete -c crio -n '__fish_crio_no_subcommand' -f -l hooks-dir -r -d 'set the OCI hooks directory path (may be set multiple times) (default: [])'
complete -c crio -n '__fish_crio_no_subcommand' -f -l host-ip -r -d 'Host IPs are the addresses to be used for the host network and can be specified up to two times (default: [])'
complete -c crio -n '__fish_crio_no_subcommand' -f -l image-volumes -r -d 'image volume handling (\'mkdir\', \'bind\', or \'ignore\')'
complete -c crio -n '__fish_crio_no_subcommand' -f -l insecure-registry -r -d 'whether to disable TLS verification for the given registry'
complete -c crio -n '__fish_crio_no_subcommand' -l listen -r -d 'path to crio socket (default: "/var/run/crio/crio.sock")'
complete -c crio -n '__fish_crio_no_subcommand' -l log -r -d 'set the log file path where internal debug information is written'
complete -c crio -n '__fish_crio_no_subcommand' -l log-dir -r -d 'default log directory where all logs will go unless directly specified by the kubelet'
complete -c crio -n '__fish_crio_no_subcommand' -f -l log-filter -r -d 'filter the log messages by the provided regular expression. For example \'request:.*\' filters all gRPC requests.'
complete -c crio -n '__fish_crio_no_subcommand' -f -l log-format -r -d 'set the format used by logs (\'text\' (default), or \'json\')'
complete -c crio -n '__fish_crio_no_subcommand' -f -l log-journald -d 'Log to journald in addition to kubernetes log file (default: false)'
complete -c crio -n '__fish_crio_no_subcommand' -f -l log-level -s l -r -d 'log messages above specified level: debug, info, warn, error (default), fatal or panic'
complete -c crio -n '__fish_crio_no_subcommand' -f -l log-size-max -r -d 'maximum log size in bytes for a container'
complete -c crio -n '__fish_crio_no_subcommand' -f -l manage-network-ns-lifecycle -d 'determines whether we pin and remove network namespace and manage its lifecycle (default: false)'
complete -c crio -n '__fish_crio_no_subcommand' -f -l metrics-port -r -d 'port for the metrics endpoint'
complete -c crio -n '__fish_crio_no_subcommand' -f -l no-pivot -d 'if true, the runtime will not use `pivot_root`, but instead use `MS_MOVE` (default: false)'
complete -c crio -n '__fish_crio_no_subcommand' -f -l pause-command -r -d 'name of the pause command in the pause image (default: "/pause")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l pause-image -r -d 'name of the pause image (default: "k8s.gcr.io/pause:3.1")'
complete -c crio -n '__fish_crio_no_subcommand' -l pause-image-auth-file -r -d 'path to a config file containing credentials for --pause-image (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l pids-limit -r -d 'maximum number of processes allowed in a container'
complete -c crio -n '__fish_crio_no_subcommand' -f -l profile -d 'enable pprof remote profiler on localhost:6060'
complete -c crio -n '__fish_crio_no_subcommand' -f -l profile-port -r -d 'port for the pprof profiler'
complete -c crio -n '__fish_crio_no_subcommand' -f -l read-only -d 'setup all unprivileged containers to run as read-only (default: false)'
complete -c crio -n '__fish_crio_no_subcommand' -f -l registry -r -d 'registry to be prepended when pulling unqualified images, can be specified multiple times (default: configured in /etc/containers/registries.conf)'
complete -c crio -n '__fish_crio_no_subcommand' -l root -s r -r -d 'crio root dir (default: "/var/lib/containers/storage")'
complete -c crio -n '__fish_crio_no_subcommand' -l runroot -r -d 'crio state dir (default: "/var/run/containers/storage")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l runtimes -r -d 'OCI runtimes, format is runtime_name:runtime_path:runtime_root'
complete -c crio -n '__fish_crio_no_subcommand' -l seccomp-profile -r -d 'default seccomp profile path (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l selinux -d 'enable selinux support (default: false)'
complete -c crio -n '__fish_crio_no_subcommand' -l signature-policy -r -d 'path to signature policy file (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l storage-driver -s s -r -d 'storage driver (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l storage-opt -r -d 'storage driver option (default: [])'
complete -c crio -n '__fish_crio_no_subcommand' -f -l stream-address -r -d 'bind address for streaming socket (default: "127.0.0.1")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l stream-enable-tls -d 'enable encrypted TLS transport of the stream server (default: false)'
complete -c crio -n '__fish_crio_no_subcommand' -f -l stream-port -r -d 'bind port for streaming socket (default: "0")'
complete -c crio -n '__fish_crio_no_subcommand' -l stream-tls-ca -r -d 'path to the x509 CA(s) file used to verify and authenticate client communication with the encrypted stream. This file can change and CRI-O will automatically pick up the changes within 5 minutes (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -l stream-tls-cert -r -d 'path to the x509 certificate file used to serve the encrypted stream. This file can change and CRI-O will automatically pick up the changes within 5 minutes (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -l stream-tls-key -r -d 'path to the key file used to serve the encrypted stream. This file can change and CRI-O will automatically pick up the changes within 5 minutes (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -f -l uid-mappings -r -d 'specify the UID mappings to use for the user namespace (default: "")'
complete -c crio -n '__fish_crio_no_subcommand' -l version-file -r -d 'Location for CRI-O to lay down the version file'
complete -c crio -n '__fish_crio_no_subcommand' -f -l help -s h -d 'show help'
complete -c crio -n '__fish_crio_no_subcommand' -f -l version -s v -d 'print the version'
complete -c crio -n '__fish_crio_no_subcommand' -f -l help -s h -d 'show help'
complete -c crio -n '__fish_crio_no_subcommand' -f -l version -s v -d 'print the version'
complete -c crio -n '__fish_seen_subcommand_from config' -f -l help -s h -d 'show help'
complete -r -c crio -n '__fish_crio_no_subcommand' -a 'config' -d 'generate crio configuration files'
complete -c crio -n '__fish_seen_subcommand_from config' -f -l default -d 'output the default configuration'
complete -c crio -n '__fish_seen_subcommand_from complete completion' -f -l help -s h -d 'show help'
complete -r -c crio -n '__fish_crio_no_subcommand' -a 'complete completion' -d 'Output shell completion code'
complete -c crio -n '__fish_seen_subcommand_from wipe' -f -l help -s h -d 'show help'
complete -r -c crio -n '__fish_crio_no_subcommand' -a 'wipe' -d 'wipe CRI-O\'s container and image storage'
complete -c crio -n '__fish_seen_subcommand_from help h' -f -l help -s h -d 'show help'
complete -r -c crio -n '__fish_crio_no_subcommand' -a 'help h' -d 'Shows a list of commands or help for one command'