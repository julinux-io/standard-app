# Changelog

## 2.10.0
- Added okta oidc authentication to `ingress` definition with `ingress.auth` flag
- `ingress.auth` flag also redirects `ingress` host to https (port 443)

## 2.9.0
- Added liveness and startup probes to `http.app.*Probe` and `nginx.*Probe` definitions

## 2.8.0
- Increase memory allocation for logwatch containers to avoid setting the memory limit lower than actual usage

## 2.7.0
- Add double quotes to cronjob spec, so that "*/30 * * * *" parses as a string

## 2.6.0
- Add support for specifying a priority classes for workloads.

## 2.5.0
- Update the included basic auth nginx configuration to whitelist NHDS IPs

## 2.4.0
- Update the default Nginx configuration to properly set the real client IP address
- Change "Real IP" header to use X-Forwarded-For

## 2.3.0
- Add support to HTTP Service for a second port, named `metrics`, which provides access to prometheus metrics.
- Add support to HTTP Service for advertising prometheus metrics endpoints to the Prometheus service monitor

## 2.2.1
- Fix `serviceAccountName` not being handled correctly

## 2.2.0
- Add support for alternate names for NewRelic environment variable configuration (`NEW_RELIC_APP_NAME` and `NEW_RELIC_LICENSE_KEY`)
- Set the `NEW_RELIC_ENABLED` environment variable when NewRelic is enabled
- Add support for setting the service account for pods

## 2.1.0
- Add support for creating `ConfigMap`s as part of a release.

## 2.0.0
- BREAKING: Move New Relic configuration out of the global `app` scope, it is now under `http.app` and `workerDefault.app` to allow New Relic to be selectively applied to some pods and not others.

## 1.7.2
- Fix workers not rendering since 1.7.0

## 1.7.1
- Fix HTTP `PodDisruptionBudget` not setting `minAvailable`/`maxUnavailable`.

## 1.7.0
- Add option to disable the nginx container in the HTTP deployment
- Add configurable port names to the HTTP service and deployment ports
- Allow configuring `minReadySeconds` and the deployment strategy for HTTP and worker deployments
- Allow configuring the image pull policy for the app and nginx containers.
- Add support for additional ingress rules and a default ingress backend

## 1.6.1
- Add config hooks for tolerations

## 1.6.0
- Add configuration for New Relic-enabled pods
- **KNOWN ISSUE:** A bug in this version prevented user-supplied `app.newrelic.appName` from overwriting the default value. This version has been removed from S3.

## 1.5.3
- Bugfix: remove extra double-quotes from the `user_agent` field in the nginx access log

## 1.5.2
- Change default nginx access log format to include lots of performance data

## 1.5.1
- Enlarge nginx header buffers by default

## 1.5.0
- Add HorizontalPodAutoscaler support

## 1.4.1
- Fix `http.app.readinessProbe` being used instead of `nginx.readinessProbe` for the nginx container

## 1.4.0
- Add support for HTTP basic authentication to the nginx container in HTTP pods

## 1.3.0
- Make the port and target port of the HTTP service configurable

## 1.2.1
- Fix `extraContainers` not resulting in valid YAML

## 1.2.0
- Support for `PodDisruptionBudget`s on HTTP deployments

## 1.1.0
- Add `app.workingDir` option
- Fix extra annotations not applying to CronJob pods

## 1.0.3
- Fix all files in `nginx.confTemplates` being included regardless of `nginx.confTemplatesEnabled` value

## 1.0.2
- Fix `util.v1.autoname` template partial not available

## 1.0.1
- Fix rendering issue with `http-nginx-configmap.yaml`

## 1.0.0
- Initial release
