{{/*
Default name for HTTP service
*/}}
{{- define "standard-app.v1.default-service-name" -}}
{{- include "util.v1.autoname" . | trunc 58 | trimSuffix "-" }}-http
{{- end -}}

{{/*
Default name for nginx config map
*/}}
{{- define "standard-app.v1.default-nginx-configmap-name" -}}
{{- include "util.v1.autoname" . }}-http-nginx-config
{{- end -}}

{{/*
Default name for nginx basic auth config map
*/}}
{{- define "standard-app.v1.default-nginx-auth-configmap-name" -}}
{{- include "util.v1.autoname" . }}-http-nginx-auth-config
{{- end -}}

{{/*
Base labels for resources
*/}}
{{ define "standard-app.v1.resource-labels" }}
{{ include "standard-app.v1.selector-labels" . }}
chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
heritage: {{ .Release.Service }}
{{ end }}

{{/*
Base labels for selectors
*/}}
{{ define "standard-app.v1.selector-labels" }}
app: {{ .Values.appName | required "Must specify .Values.appName"  | quote }}
release: {{ .Release.Name }}
{{ end }}

{{/*
All the possible probes
*/}}
{{ define "standard-app.v1.readiness-probe" }}
{{ with . }}
readinessProbe:
{{ toYaml . | indent 2 }}
{{ end }}
{{ end }}

{{ define "standard-app.v1.liveness-probe" }}
{{ with . }}
livenessProbe:
{{ toYaml . | indent 2 }}
{{ end }}
{{ end }}

{{ define "standard-app.v1.startup-probe" }}
{{ with . }}
startupProbe:
{{ toYaml . | indent 2 }}
{{ end }}
{{ end }}
