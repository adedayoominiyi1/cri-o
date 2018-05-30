package main

import (
	"os"
	"text/template"

	"github.com/kubernetes-incubator/cri-o/server"
	"github.com/urfave/cli"
)

var commentedConfigTemplate = template.Must(template.New("config").Parse(`
# The "crio" table contains all of the server options.
[crio]

# CRI-O reads its storage defaults from the containers/storage configuration
# file, /etc/containers/storage.conf. Modify storage.conf if you want to
# change default storage for all tools that use containers/storage.  If you
# want to modify just crio, you can change the storage configuration in this
# file.

# root is a path to the "root directory". CRIO stores all of its data,
# including container images, in this directory.
#root = "{{ .Root }}"

# run is a path to the "run directory". CRIO stores all of its state
# in this directory.
#runroot = "{{ .RunRoot }}"

# storage_driver select which storage driver is used to manage storage
# of images and containers.
#storage_driver = "{{ .Storage }}"

# storage_option is used to pass an option to the storage driver.
#storage_option = [
{{ range $opt := .StorageOptions }}{{ printf "#\t%q,\n" $opt }}{{ end }}#]

# The "crio.api" table contains settings for the kubelet/gRPC interface.
[crio.api]

# listen is the path to the AF_LOCAL socket on which crio will listen.
listen = "{{ .Listen }}"

# stream_address is the IP address on which the stream server will listen
stream_address = "{{ .StreamAddress }}"

# stream_port is the port on which the stream server will listen
stream_port = "{{ .StreamPort }}"

# stream_enable_tls enables encrypted tls transport of the stream server
stream_enable_tls = {{ .StreamEnableTLS }}

# stream_tls_cert is the x509 certificate file path used to serve the encrypted stream.
# This file can change, and CRIO will automatically pick up the changes within 5 minutes.
stream_tls_cert = "{{ .StreamTLSCert }}"

# stream_tls_key is the key file path used to serve the encrypted stream.
# This file can change, and CRIO will automatically pick up the changes within 5 minutes.
stream_tls_key = "{{ .StreamTLSKey }}"

# stream_tls_ca is the x509 CA(s) file used to verify and authenticate client
# communication with the tls encrypted stream.
# This file can change, and CRIO will automatically pick up the changes within 5 minutes.
stream_tls_ca = "{{ .StreamTLSCA }}"

# file_locking is whether file-based locking will be used instead of
# in-memory locking
file_locking = {{ .FileLocking }}

# The "crio.runtime" table contains settings pertaining to the OCI
# runtime used and options for how to set up and manage the OCI runtime.
[crio.runtime]

# runtime is the OCI compatible runtime used for trusted container workloads.
# This is a mandatory setting as this runtime will be the default one
# and will also be used for untrusted container workloads if
# runtime_untrusted_workload is not set.
runtime = "{{ .Runtime }}"

# runtime_untrusted_workload is the OCI compatible runtime used for untrusted
# container workloads. This is an optional setting, except if
# default_container_trust is set to "untrusted".
runtime_untrusted_workload = "{{ .RuntimeUntrustedWorkload }}"

# default_workload_trust is the default level of trust crio puts in container
# workloads. It can either be "trusted" or "untrusted", and the default
# is "trusted".
# Containers can be run through different container runtimes, depending on
# the trust hints we receive from kubelet:
# - If kubelet tags a container workload as untrusted, crio will try first to
# run it through the untrusted container workload runtime. If it is not set,
# crio will use the trusted runtime.
# - If kubelet does not provide any information about the container workload trust
# level, the selected runtime will depend on the default_container_trust setting.
# If it is set to "untrusted", then all containers except for the host privileged
# ones, will be run by the runtime_untrusted_workload runtime. Host privileged
# containers are by definition trusted and will always use the trusted container
# runtime. If default_container_trust is set to "trusted", crio will use the trusted
# container runtime for all containers.
default_workload_trust = "{{ .DefaultWorkloadTrust }}"

# no_pivot instructs the runtime to not use pivot_root, but instead use MS_MOVE
no_pivot = {{ .NoPivot }}

# conmon is the path to conmon binary, used for managing the runtime.
conmon = "{{ .Conmon }}"

# conmon_env is the environment variable list for conmon process,
# used for passing necessary environment variable to conmon or runtime.
conmon_env = [
{{ range $env := .ConmonEnv }}{{ printf "\t%q,\n" $env }}{{ end }}]

# selinux indicates whether or not SELinux will be used for pod
# separation on the host. If you enable this flag, SELinux must be running
# on the host.
selinux = {{ .SELinux }}

# seccomp_profile is the seccomp json profile path which is used as the
# default for the runtime.
seccomp_profile = "{{ .SeccompProfile }}"

# apparmor_profile is the apparmor profile name which is used as the
# default for the runtime.
apparmor_profile = "{{ .ApparmorProfile }}"

# cgroup_manager is the cgroup management implementation to be used
# for the runtime.
cgroup_manager = "{{ .CgroupManager }}"

# default_capabilities is the list of capabilities to add and can be modified here.
# If capabilities below is commented out, the default list of capabilities defined in the
# spec will be added.
# If capabilities is empty below, only the capabilities defined in the container json
# file by the user/kube will be added.
default_capabilities = [
{{ range $capability := .DefaultCapabilities}}{{ printf "\t%q, \n" $capability}}{{ end }}]

# hooks_dir_path is the oci hooks directory for automatically executed hooks
hooks_dir_path = "{{ .HooksDirPath }}"

# default_mounts is the mounts list to be mounted for the container when created
# deprecated, will be taken out in future versions, add default mounts to either
# /usr/share/containers/mounts.conf or /etc/containers/mounts.conf
default_mounts = [
{{ range $mount := .DefaultMounts }}{{ printf "\t%q, \n" $mount }}{{ end }}]

# CRI-O reads its default mounts from the following two files:
# 1) /etc/containers/mounts.conf - this is the override file, where users can
# either add in their own default mounts, or override the default mounts shipped
# with the package.
# 2) /usr/share/containers/mounts.conf - this is the default file read for mounts.
# If you want CRI-O to read from a different, specific mounts file, you can change
# the default_mounts_file path right below. Note, if this is done, CRI-O will only add
# mounts it finds in this file.

# default_mounts_file is the file path holding the default mounts to be mounted for the
# container when created.
# default_mounts_file = "{{ .DefaultMountsFile }}"

# pids_limit is the number of processes allowed in a container
pids_limit = {{ .PidsLimit }}

# log_size_max is the max limit for the container log size in bytes.
# Negative values indicate that no limit is imposed.
log_size_max = {{ .LogSizeMax }}

# read-only indicates whether all containers will run in read-only mode
read_only = {{ .ReadOnly }}

# The "crio.image" table contains settings pertaining to the
# management of OCI images.

# uid_mappings specifies the UID mappings to have in the user namespace.
# A range is specified in the form containerUID:HostUID:Size.  Multiple
# ranges are separed by comma.
uid_mappings = "{{ .UIDMappings }}"

# gid_mappings specifies the GID mappings to have in the user namespace.
# A range is specified in the form containerGID:HostGID:Size.  Multiple
# ranges are separed by comma.
gid_mappings = "{{ .GIDMappings }}"

[crio.image]

# default_transport is the prefix we try prepending to an image name if the
# image name as we receive it can't be parsed as a valid source reference
default_transport = "{{ .DefaultTransport }}"

# pause_image is the image which we use to instantiate infra containers.
pause_image = "{{ .PauseImage }}"

# pause_command is the command to run in a pause_image to have a container just
# sit there.  If the image contains the necessary information, this value need
# not be specified.
pause_command = "{{ .PauseCommand }}"

# signature_policy is the name of the file which decides what sort of policy we
# use when deciding whether or not to trust an image that we've pulled.
# Outside of testing situations, it is strongly advised that this be left
# unspecified so that the default system-wide policy will be used.
signature_policy = "{{ .SignaturePolicyPath }}"

# image_volumes controls how image volumes are handled.
# The valid values are mkdir and ignore.
image_volumes = "{{ .ImageVolumes }}"

# CRI-O reads its configured registries defaults from the containers/image configuration
# file, /etc/containers/registries.conf. Modify registries.conf if you want to
# change default registries for all tools that use containers/image.  If you
# want to modify just crio, you can change the registies configuration in this
# file.

# insecure_registries is used to skip TLS verification when pulling images.
# insecure_registries = [
# {{ range $opt := .InsecureRegistries }}{{ printf "\t%q,\n#" $opt }}{{ end }}]

# registries is used to specify a comma separated list of registries to be used
# when pulling an unqualified image (e.g. fedora:rawhide).
#registries = [
# {{ range $opt := .Registries }}{{ printf "\t%q,\n#" $opt }}{{ end }}]

# The "crio.network" table contains settings pertaining to the
# management of CNI plugins.
[crio.network]

# network_dir is is where CNI network configuration
# files are stored.
network_dir = "{{ .NetworkDir }}"

# plugin_dir is is where CNI plugin binaries are stored.
plugin_dir = "{{ .PluginDir }}"
`))

// TODO: Currently ImageDir isn't really used, so we haven't added it to this
//       template. Add it once the storage code has been merged.

var configCommand = cli.Command{
	Name:  "config",
	Usage: "generate crio configuration files",
	Flags: []cli.Flag{
		cli.BoolFlag{
			Name:  "default",
			Usage: "output the default configuration",
		},
	},
	Action: func(c *cli.Context) error {
		// At this point, app.Before has already parsed the user's chosen
		// config file. So no need to handle that here.
		config := c.App.Metadata["config"].(*server.Config)
		if c.Bool("default") {
			config = server.DefaultConfig()
		}

		// Output the commented config.
		return commentedConfigTemplate.ExecuteTemplate(os.Stdout, "config", config)
	},
}
