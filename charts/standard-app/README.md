# Standard Application

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `affinity` | [Affinity][] of all pods | `{}` |
| `tolerations` | [Toleration][]s of all pods | `[]` |
| `app.envVars` | Simple map of environment variables to set on the app container in the pods; see below for details | *see `values.yaml`* |
| `app.envVarsRaw` | List of [EnvVar][] objects to add to the app container in the pods; see below for details | `[]` |
| `app.extraVolumeMounts` | List of [VolumeMount][]s to mount on the app container in the pods | `[]` |
| `app.image.pullPolicy` | Pull policy for the app container image | `null` |
| `app.image.registry` | Docker image registry for the app container image | `"272157948465.dkr.ecr.us-east-1.amazonaws.com/"` |
| `app.image.repository` | Docker image name (repository) for the app container image | *required* |
| `app.image.tag` | Docker image version (tag) for the app container image | *required* |
| `app.logRoot` | The path to the directory to where log files are written; seee below for details | *required* |
| `app.workingDir` | The working directory of the [Container][]; if unset, uses the directory set in the image | `""` |
| `appName` | Short name of the app; used for resource labeling | *required* |
| `autonameStyle` | Style to use for resource naming; either `"short"` or `"full"` | `"full"` |
| `configMaps` | Map of ConfigMaps to deploy | `{}` |
| `configMaps.{}.name` | If set, override the default name given to the ConfigMap resource | `null` |
| `configMaps.{}.data` | The map of data to include in the ConfigMap | `{}` |
| `cronDefault.affinity` | [Affinity][] of all cron pods (replaced) | `{}` |
| `cronDefault.tolerations` | [Toleration][]s of all cron pods (replaced) | `[]` |
| `cronDefault.app.envVars` | Simple map of environment variables to set on app containers in all cron pods; see below for details (additive) | `{}` |
| `cronDefault.app.envVarsRaw` | List of [EnvVar][] objects to add to all app containers in all cron pods; see below for details (additive) | `[]` |
| `cronDefault.app.extraVolumeMounts` | List of [VolumeMount][]s to mount on all app containers in all cron pods (additive) | `[]` |
| `cronDefault.app.resources` | [ResourceRequirements][] for the app container in the cron pods; see below for details (replaced) | *see `values.yaml`* |
| `cronDefault.app.workingDir` | The working directory of the [Container][]; if unset, uses the directory set in the image; overrides `app.workingDir` | `""` |
| `cronDefault.extraContainers` | Extra [Container][]s to add to all cron pods (additive) | `[]` |
| `cronDefault.extraInitContainers` | Extra [init container][]s to add to all cron pods (additive) | `[]` |
| `cronDefault.extraPodAnnotations` | Extra annotations to add to all cron pods (additive) | `{}` |
| `cronDefault.extraVolumes` | Extra [Volume][]s to add to all cron pods (additive) | `[]` |
| `cronDefault.iamRole` | IAM role the cron pods should assume; overrides `iamRole` (replaced) | `""` |
| `cronDefault.logs.app` | List of log files (relative to `app.logRoot`) to watch for the cron pods; see below for details (replaced) | `[]` |
| `cronDefault.priorityClassName` | The name of the priority class to use when running the cron pods | `""` |
| `cronDefault.serviceAccountName` | The name of the service account to use when running the cron pods; overrides `serviceAccountName` | `""` |
| `cronJobs` | Map of cron job configurations to deploy; map key is cron job name; see below for details | `{}` |
| `cronJobs.{}.affinity` | [Affinity][] of the cron pods | `{}` |
| `cronJobs.{}.tolerations` | [Toleration][]s of the cron pods | `[]` |
| `cronJobs.{}.app.args` | Set the `args` on the app container in the cron pods; see below for details | `[]` |
| `cronJobs.{}.app.command` | Set the `command` on the app container in the cron pods; see below for details | `[]` |
| `cronJobs.{}.app.envVars` | Simple map of environment variables to set on the app container in the cron pods; see below for details | `{}` |
| `cronJobs.{}.app.envVarsRaw` | List of [EnvVar][] objects to add to the app container in the cron pods; see below for details | `[]` |
| `cronJobs.{}.app.extraVolumeMounts` | List of [VolumeMount][]s to mount on the app container in the cron pods | `[]` |
| `cronJobs.{}.app.resources` | [ResourceRequirements][] for the app container in the job pods; see below for details | *see `values.yaml`* |
| `cronJobs.{}.app.workingDir` | The working directory of the [Container][]; if unset, uses the directory set in the image; overrides `cronDefault.app.workingDir` | `""` |
| `cronJobs.{}.extraContainers` | Extra [Container][]s to add to the cron pods | `[]` |
| `cronJobs.{}.extraInitContainers` | Extra [init container][]s to add to the cron pods | `[]` |
| `cronJobs.{}.extraPodAnnotations` | Extra annotations to add to the cron pods | `{}` |
| `cronJobs.{}.extraVolumes` | Extra [Volume][]s to add to the cron pods | `[]` |
| `cronJobs.{}.iamRole` | IAM role the cron pods should assume; overrides `cronDefault.iamRole` and `iamRole` | `""` |
| `cronJobs.{}.logs.app` | List of log files (relative to `app.logRoot`) to watch for the cron pods; see below for details | `cronDefault.logs.app` |
| `cronJobs.{}.priorityClassName` | The name of the priority class to use when running the cron pods | `""` |
| `cronJobs.{}.schedule` | Schedule for the [CronJob][] in the [cron format](https://en.wikipedia.org/wiki/Cron) | *required* |
| `cronJobs.{}.serviceAccountName` | The name of the service account to use when running the cron pod; overrides `cronDefault.serviceAccountName` and `serviceAccountName` | `""` |
| `extraPodAnnotations` | Extra annotations to add to all pods of the release | `{}` |
| `extraVolumes` | Extra [Volume][]s to add to all pods of the release | `[]` |
| `http.affinity` | [Affinity][] of the HTTP pods | `{}` |
| `http.tolerations` | [Toleration][]s of the HTTP pods | `[]` |
| `http.app.args` | Set the `args` on the app container in the HTTP pods; see below for details | `[]` |
| `http.app.command` | Set the `command` on the app container in the HTTP pods; see below for details | `[]` |
| `http.app.envVars` | Simple map of environment variables to set on the app container in the HTTP pods; see below for details | `{}` |
| `http.app.envVarsRaw` | List of [EnvVar][] objects to add to the app container in the HTTP pods; see below for details | `{}` |
| `http.app.extraVolumeMounts` | List of [VolumeMount][]s to mount on the app container in the HTTP pods | `[]` |
| `http.app.newrelic.enabled` | If `true`, add a label to the HTTP pods (`newrelic=enabled`) which identifies them as having a New Relic agent and add environment variables required for the NR agent to start. | `false` |
| `http.app.newrelic.appName` | The "Application Name" provided to the New Relic agent in its configuration file. | `"Neighborhoods k8s"` |
| `http.app.newrelic.agentLicenseSecret` | Name of the `Secret` containing the New Relic license key, provided to the agent in its config file. The `Secret` is presumed to have a single key, named `key`. | `"newrelic-agent-license"` |
| `http.app.ports` | A list of [ContainerPort][]s to expose from the app container | `[]` |
| `http.app.readinessProbe` | The readiness [Probe][] for the app container in the HTTP pod; see below for details | *see `values.yaml`* |
| `http.app.livenessProbe` | The liveness [Probe][] for the app container in the HTTP pod; see below for details | *see `values.yaml`* |
| `http.app.startupProbe` | The startup [Probe][] for the app container in the HTTP pod; see below for details | *see `values.yaml`* |
| `http.app.resources` | [ResourceRequirements][] for the app container in the HTTP pod; see below for details | *see `values.yaml`* |
| `http.deploymentStrategy` | The [DeploymentStrategy][] to use for updating the HTTP pods | `null` |
| `http.enabled` | If `true`, creates an HTTP deployment fronted by nginx | `true` |
| `http.extraContainers` | Extra [Container][]s to add to the HTTP pods | `[]` |
| `http.extraInitContainers` | Extra [init container][]s to add to the HTTP pods | `[]` |
| `http.extraPodAnnotations` | Extra annotations to add to the HTTP pods | `{}` |
| `http.extraVolumes` | Extra [Volume][]s to add to the HTTP pods | `{}` |
| `http.hpa.enabled` | If true, enable the [HorizontalPodAutoscaler][] for the HTTP Deployment | `false` |
| `http.hpa.maxReplicas` | The maximum number of replicas the Deployment can scale up to | `2` |
| `http.hpa.metrics` | An array of [MetricSpec][]s; see below for details | *see `values.yaml`* |
| `http.hpa.minReplicas` | The minimum number of replicas the Deployment can scale down to | `1` |
| `http.iamRole` | IAM role the HTTP pods should assume; overrides `iamRole` | `""` |
| `http.logs.app` | List of log files (relative to `app.logRoot`) to watch; see below for details | `[]` |
| `http.minReadySeconds` | Minimum number of seconds a pod in the HTTP [Deployment][] should be ready before continuing an update | `null` |
| `http.pdb.enabled` | If `true`, enable the [PodDisruptionBudget][] for the HTTP [Deployment][] | `false` |
| `http.pdb.maxUnavailable` | Sets the `maxUnavailable` field for the [PodDisruptionBudget][] | `null` |
| `http.pdb.minAvailable` | Sets the `minAvailable` field for the [PodDisruptionBudget][] | `null` |
| `http.priorityClassName` | The name of the priority class to use when running the HTTP pods | `""` |
| `http.replicas` | Number of desired pods in the HTTP [Deployment][] | `1` |
| `http.serviceAccountName` | The name of the service account to use when running the HTTP pods; overrides `serviceAccountName` | `""` |
| `http.staticFiles.args` | Set the `args` on the static files [init container][] in the HTTP pods; see below for details | `[]` |
| `http.staticFiles.command` | Set the `command` on the static files [init container][] in the HTTP pods; see below for details | `[]` |
| `http.staticFiles.enabled` | If true, add an extra [init container][] to make static files available to the nginx container; see below for details | `false` |
| `http.staticFiles.extraVolumeMounts` | List of [VolumeMount][]s to mount on the static files [init container][] in the HTTP pods | `[]` |
| `http.staticFiles.initMountPath` | Path in the [init container][] to mount the static file volume in the HTTP pods; the `STATIC_FILE_DIR` env var in the init container is set to this value | `"/static"` |
| `http.staticFiles.nginxMountPath` | Path in the nginx container to mount the static file volume in the HTTP pods; the `STATIC_FILE_DIR` env var in the nginx container is set to this value | `"/static"` |
| `http.staticFiles.resources` | [ResourceRequirements][] for the static files [init container][]; see below for details | *see `values.yaml`* |
| `http.staticFiles.volumeName` | Name of the [Volume][] to store static files in | `"static-files"` |
| `iamRole` | IAM role name all pods should assume (not the ARN) | `""` |
| `ingress.class` | The class for the [Ingress][] resource | *required if `ingress.enabled`* |
| `ingress.defaultBackend.enabled` | If `true`, a default backend pointing to the HTTP [Service][] will be added to the [Ingress][] resource | `false` |
| `ingress.enabled` | If `true`, an [Ingress][] resource will be created to point to the HTTP [Service][] | `false` |
| `ingress.extraAnnotations` | Extra annotations to add to the [Ingress][] resource | `{}` |
| `ingress.extraHosts` | Extra hosts to add to the [Ingress][] resource pointing at the HTTP [Service][] | `[]` |
| `ingress.host` | The host for which to point at the HTTP [Service][] | *required if `ingress.enabled`* |
| `ingress.auth` | If true, the ingress will use okta oidc authentication | `false` |
| `nginx.args` | Set the `args` on the Nginx container in the HTTP pods; see below for details | `[]` |
| `nginx.basicAuth` | Mapping of usernames to passwords for generating basic auth file (insecure; see below for details) | `{}` |
| `nginx.command` | Set the `command` on the Nginx container in the HTTP pods; see below for details | `[]` |
| `nginx.confTemplates` | Map of file names to contents of nginx conf template files; see below for details | *see `values.yaml`* |
| `nginx.enabled` | If `true`, a nginx [Container][] will be added to the HTTP pods | `true` |
| `nginx.envVars` | Simple map of environment variables to set on the nginx container in the HTTP pods; see below for details | *see `values.yaml`* |
| `nginx.envVarsRaw` | List of [EnvVar][] objects to add to the nginx container in the HTTP pods; see below for details | `[]` |
| `nginx.extraVolumeMounts` | List of [VolumeMount][]s to mount on the nginx container in the HTTP pods | `[]` |
| `nginx.image.pullPolicy` | Pull policy for the nginx container image | `null` |
| `nginx.image.registry` | Docker image registry for the nginx container image | `"272157948465.dkr.ecr.us-east-1.amazonaws.com/"` |
| `nginx.image.repository` | Docker image name (repository) for the nginx container image | `nginx/extra` |
| `nginx.image.tag` | Docker image version (tag) for the nginx container image | *see `values.yaml`* |
| `nginx.readinessProbe` | The readiness [Probe][] for the nginx container in the HTTP pod; see below for details | *see `values.yaml`* |
| `nginx.livenessProbe` | The liveness [Probe][] for the nginx container in the HTTP pod; see below for details | *see `values.yaml`* |
| `nginx.startupProbe` | The startup [Probe][] for the nginx container in the HTTP pod; see below for details | *see `values.yaml`* |
| `nginx.resources` | [ResourceRequirements][] for the nginx container in the HTTP pod; see below for details | *see `values.yaml`* |
| `service.enabled` | If `true`, a [Service][] resource will be created to point to HTTP pods | `true` |
| `service.extraAnnotations` | Extra annotations to add to the [Service][] resource | `{}` |
| `service.name` | If set, override the name generated for the HTTP service | `""` |
| `service.port` | The port that will be exposed by this [Service][] | `80` |
| `service.targetPort` | Number or name of the port to access on the HTTP pods targeted by the [Service][] | `80` |
| `service.type` | The value of the `type` field on the [Service][] resource | `"ClusterIP"` |
| `serviceAccountName` | The name of the service account to use when running the pods | `""` |
| `workerDefault.affinity` | [Affinity][] of all worker pods (replaced) | `{}` |
| `workerDefault.tolerations` | [Toleration][]s of all worker pods (replaced) | `[]` |
| `workerDefault.app.envVars` | Simple map of environment variables to set on app containers in all worker pods; see below for details (additive) | `{}` |
| `workerDefault.app.envVarsRaw` | List of [EnvVar][] objects to add to all app containers in all worker pods; see below for details (additive) | `[]` |
| `workerDefault.app.extraVolumeMounts` | List of [VolumeMount][]s to mount on all app containers in all worker pods (additive) | `[]` |
| `workerDefault.app.newrelic.enabled` | If `true`, add a label to the worker pods (`newrelic=enabled`) which identifies them as having a New Relic agent and add environment variables required for the NR agent to start. | `false` |
| `workerDefault.app.newrelic.appName` | The "Application Name" provided to the New Relic agent in its configuration file. | `"Neighborhoods k8s"` |
| `workerDefault.app.newrelic.agentLicenseSecret` | Name of the `Secret` containing the New Relic license key, provided to the agent in its config file. The `Secret` is presumed to have a single key, named `key`. | `"newrelic-agent-license"` |
| `workerDefault.app.resources` | [ResourceRequirements][] for the app container in the worker pods; see below for details (replaced) | *see `values.yaml`* |
| `workerDefault.app.workingDir` | The working directory of the [Container][]; if unset, uses the directory set in the image; overrides `app.workingDir` | `""` |
| `workerDefault.deploymentStrategy` | The [DeploymentStrategy][] to use for updating the worker pods (replaced) | `null` |
| `workerDefault.extraContainers` | Extra [Container][]s to add to all worker pods (additive) | `[]` |
| `workerDefault.extraInitContainers` | Extra [init container][]s to add to all worker pods (additive) | `[]` |
| `workerDefault.extraPodAnnotations` | Extra annotations to add to all worker pods (additive) | `{}` |
| `workerDefault.extraVolumes` | Extra [Volume][]s to add to all worker pods (additive) | `[]` |
| `workerDefault.hpa.enabled` | If true, enable the [HorizontalPodAutoscaler][] for the worker Deployments (replaced) | `false` |
| `workerDefault.hpa.maxReplicas` | The maximum number of replicas the worker deployments can scale up to (replaced) | `2` |
| `workerDefault.hpa.metrics` | An array of [MetricSpec][]s; see below for details (replaced) | *see `values.yaml`* |
| `workerDefault.hpa.minReplicas` | The minimum number of replicas the worker Deployments can scale down to (replaced) | `1` |
| `workerDefault.iamRole` | IAM role the worker pods should assume; overrides `iamRole` (replaced) | `""` |
| `workerDefault.logs.app` | List of log files (relative to `app.logRoot`) to watch for the worker pods; see below for details (replaced) | `[]` |
| `workerDefault.minReadySeconds` | Minimum number of seconds a pod in the worker [Deployment][]s should be ready before continuing an update | `null` |
| `workerDefault.priorityClassName` | The name of the priority class to use when running the worker pods | `""` |
| `workerDefault.replicas` | Number of desired pods (by default) in the worker [Deployment][]s (replaced) | `1` |
| `workerDefault.serviceAccountName` | The name of the service account to use when running the worker pods; overrides `serviceAccountName` | `""` |
| `workers` | Map of worker configurations to deploy; map key is worker name; see below for details | `{}` |
| `workers.{}.affinity` | [Affinity][] of the worker pods | `{}` |
| `workers.{}.tolerations` | [Toleration][]s of the worker pods | `[]` |
| `workers.{}.app.args` | Set the `args` on the app container in the worker pods; see below for details | `[]` |
| `workers.{}.app.command` | Set the `command` on the app container in the worker pods; see below for details | `[]` |
| `workers.{}.app.envVars` | Simple map of environment variables to set on the app container in the worker pods; see below for details | `{}` |
| `workers.{}.app.envVarsRaw` | List of [EnvVar][] objects to add to the app container in the worker pods; see below for details | `[]` |
| `workers.{}.app.extraVolumeMounts` | List of [VolumeMount][]s to mount on the app container in the worker pods | `[]` |
| `workers.{}.app.newrelic.enabled` | If `true`, add a label to the worker pods (`newrelic=enabled`) which identifies them as having a New Relic agent and add environment variables required for the NR agent to start | `false` |
| `workers.{}.app.newrelic.appName` | The "Application Name" provided to the New Relic agent in its configuration file | `"Neighborhoods k8s"` |
| `workers.{}.app.newrelic.agentLicenseSecret` | Name of the `Secret` containing the New Relic license key, provided to the agent in its config file. The `Secret` is presumed to have a single key, named `key`. Note that there cannot be a default value, unlike similar configuration in other areas | `""` |
| `workers.{}.app.resources` | [ResourceRequirements][] for the app container in the worker pods; see below for details | *see `values.yaml`* |
| `workers.{}.app.workingDir` | The working directory of the [Container][]; if unset, uses the directory set in the image; overrides `workerDefault.app.workingDir` | `""` |
| `workers.{}.deploymentStrategy` | The [DeploymentStrategy][] to use for updating the worker pods | `null` |
| `workers.{}.extraContainers` | Extra [Container][]s to add to the worker pods | `[]` |
| `workers.{}.extraInitContainers` | Extra [init container][]s to add to the worker pods | `[]` |
| `workers.{}.extraPodAnnotations` | Extra annotations to add to the worker pods | `{}` |
| `workers.{}.extraVolumes` | Extra [Volume][]s to add to the worker pods | `[]` |
| `workers.{}.hpa.enabled` | If true, enable the [HorizontalPodAutoscaler][] for the worker Deployment | `false` |
| `workers.{}.hpa.maxReplicas` | The maximum number of replicas the worker Deployment can scale up to | `2` |
| `workers.{}.hpa.metrics` | An array of [MetricSpec][]s; see below for details | *see `values.yaml`* |
| `workers.{}.hpa.minReplicas` | The minimum number of replicas the worker Deployment can scale down to | `1` |
| `workers.{}.iamRole` | IAM role the worker pods should assume; overrides `workerDefault.iamRole` and `iamRole` | `""` |
| `workers.{}.logs.app` | List of log files (relative to `app.logRoot`) to watch for the worker pods; see below for details | `workerDefault.logs.app` |
| `workers.{}.minReadySeconds` | Minimum number of seconds a pod in the worker [Deployment][]s should be ready before continuing an update | `null` |
| `workers.{}.priorityClassName` | The name of the priority class to use when running the worker pods | `""` |
| `workers.{}.replicas` | Number of desired pods (by default) in the worker [Deployment][](s) | `1` |
| `workers.{}.serviceAccountName` | The name of the service account to use when running the worker pods; overrides `workerDefault.serviceAccountName` and `serviceAccountName` | `""` |

### `command` and `args`
You can override the `command` and `args` fields set on [Container][]s in the pods.
These fields directly map to the keys on the [Container][] definitions.
The `command` field overrides the Docker `ENTRYPOINT`.
The `args` field overrides the Docker `CMD`.
See the [Kubernetes Docs](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/) for more information.

### `cronDefault` and `cronJobs`
These fields configure [CronJob](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)s (regularly scheduled tasks).
`cronDefault` sets the base configuration for all cron jobs.
`cronJobs.{}` sets the configuration for each cron job.
For fields in `cronDefault` marked `(additive)`, values set in `cronJobs.{}` will be appended to what is set in `cronDefault`.
For fields in `cronDefault` marked `(replaced)`, values set in `cronJobs.{}` will completely replace what is set in `cronDefault`; values will not be merged.


### `envVars` and `envVarsRaw`
The standard Kubernetes [EnvVar][] object is very verbose, and defining it multiple times for simple `NAME: VALUE` env vars gets tedious.
The `envVars` field is a name->value mapping for these simple environment variables.
The `envVarsRaw` field is just an array of [EnvVar][] objects, like you would normally define.

For example, the following `envVars` and `envVarsRaw` fields are equivalent:
```yaml
envVars:
  FOO: BAR
  FIZZ: BUZZ

envVarsRaw:
  - name: FOO
    value: BAR
  - name: FIZZ
    value: BUZZ
```

### `http.hpa`, `workerDefault.hpa`, and `workers.{}.hpa`
This contains the [HorizontalPodAutoscaler][] configuration for the HTTP deployment.
By default, the HPA is disabled.
The default scaling settings attempts to keep the CPU usage of the Pod at 90% of its requested value (not limit).

### `http.staticFiles`
Normally, the nginx container does not have direct access to the files stored in the app container.
This poses a problem for static files that nginx must access directly.
To give nginx access to the static files, files are copied from the app image to a volume that is mounted on the nginx container using an [init container][].
When using `http.staticFiles`, you must specify either `args` or `command` for the init container.
The `args`/`command` should copy files to the static file volume (volume path is set by `http.staticFiles.initMountPath`) then exit.
The volume is mounted to the nginx container at the path set in `http.staticFiles.nginxMountPath`.

### `http.logs.app` and `app.logRoot`
`http.logs.app` is the list of log files to watch for the HTTP container, relative to the directory specified by `app.logRoot`.
The files listed in `http.logs.app` cannot be located outside of the `app.logRoot` directory.
The `app.logRoot` directory is mounted by a volume that is made globally writable.
Each file given in `http.logs.app` will be watched by its own container that writes the contents to stdout, making the logs available via the Kubernetes API.

### `nginx.basicAuth`
`nginx.basicAuth` is a mapping of usernames to passwords to generate an htpasswd file used for basic auth.
**This method is insecure** because it the passwords are not hashed/encrypted when stored in Kubernetes or in the nginx container.
It must not be used as a strong authentication method.

### `nginx.confTemplates` and `nginx.confTemplatesEnabled`
The `nginx.confTemplates` mapping is a list of nginx configuration file templates.
The templates are rendered using [envsubst](https://linux.die.net/man/1/envsubst).
Only variables given in the `NGINX_TEMPLATE_VARS` variable (comma-separated) are substituted.

The following files are specified by default (default disabled unless specified otherwise):
- `basicauth.conf` - Enables reading from the basic auth file generated by `nginx.basicAuth`;
    `nginx.basicAuth` must be set when enabling this file
- `php.conf` - Configures a standard PHP-FPM application with static file support.
- `realip.conf` (enabled) - Sets the trusting of the `X-Forwarded-For` header to the Cloudflare IP range.
- `large_headers.conf` (enabled) - Specifies a much larger default size for client header buffers, to accomodate requests with dozens of URL parameters.

If the `nginx.confTemplatesEnabled` field has a `false` value for the template name, that conf file will not be loaded by nginx. This enables standard conf files that can be enabled/disabled with value files. If a template name is not present in `nginx.confTemplatesEnabled`, it is treated as enabled (i.e. defaults to `true`).

### `readinessProbe`
This field sets the value for the readiness [Probe][] on each container.
This probe is used to determine if the container is ready to serve traffic.
A pod is ready, and will receive traffic from services, if all containers within the pod are ready.
Rolling deployments will wait for the pod to become ready before continuing a deployment.

### `livenessProbe`
This field sets the value for the liveness [Probe][] on each container.
This probe is essential for discovering deadlocks. And culling long
running failed pods.

### `startupProbe`
This field sets the value for the startup [Probe][] on each container.
This probe is used for slow starting containers.

### `resources`
These fields set the [ResourceRequirements][] for each container.
`limits` set absolute resource usage limits for containers.
`requests` is only used for scheduling the pod on nodes.
A pod will only be scheduled on nodes that can fit the requested resources.
If a container exceeds its memory limit, it might be killed with `SIGKILL`.
If a container exceeds its CPU limit, its CPU usage might be throttled.

If a container exceeds its memory request, the pod might be evicted if the node runs low on memory.
If the memory limit is greater than the request, the container might be killed before reaching its own memory limit in the node runs low on memory.

### `workerDefault` and `workers`
These fields configure worker deployments (non-HTTP traffic serving pods).
`workerDefault` sets the base configuration for all workers.
`workers.{}` sets the configuration for each worker.
For fields in `workerDefault` marked `(additive)`, values set in `workers.{}` will be appended to what is set in `workerDefault`.
For fields in `workerDefault` marked `(replaced)`, values set in `workers.{}` will completely replace what is set in `workerDefault`; values will not be merged.

## Roadmap
- Pre-deployment hooks to automatically run migrations before deploying

[Affinity]: https://v1-9.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#affinity-v1-core
[Container]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#container-v1-core
[ContainerPort]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#containerport-v1-core
[CronJob]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#cronjobspec-v1beta1-batch
[Deployment]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#deploymentspec-v1-apps
[DeploymentStrategy]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#deploymentstrategy-v1-apps
[EnvVar]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#envvar-v1-core
[HorizontalPodAutoscaler]: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/
[Ingress]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#ingress-v1beta1-extensions
[init container]: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
[MetricSpec]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#metricspec-v2beta1-autoscaling
[PodDisruptionBudget]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#poddisruptionbudget-v1beta1-policy
[Probe]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#probe-v1-core
[ResourceRequirements]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#resourcerequirements-v1-core
[Service]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#service-v1-core
[Toleration]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#toleration-v1-core
[Volume]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#volume-v1-core
[VolumeMount]: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#volumemount-v1-core
