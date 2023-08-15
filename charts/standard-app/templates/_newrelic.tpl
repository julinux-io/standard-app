{{/* vim: set filetype=mustache: */}}

{{/*
Outputs labels defined on pods which are APM-enabled.
Expected context is `.Values.app.newrelic`
*/}}
{{- define "standard-app.v1.newrelic.labels" -}}
{{- if .enabled }}
newrelic: enabled
{{ end -}}
{{ end -}}

{{/*
Outputs environment variables required for New Relic configuration.
Expected context is `.Values.app.newrelic`
*/}}
{{- define "standard-app.v1.newrelic.env" -}}
{{ if .enabled -}}
- name: NEW_RELIC_ENABLED
  value: "true"
- name: NR_APP_NAME
  value: {{ .appName | quote }}
- name: NEW_RELIC_APP_NAME
  value: {{ .appName | quote }}
- name: NR_LICENSE_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .agentLicenseSecret | quote }}
      key: key
- name: NEW_RELIC_LICENSE_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .agentLicenseSecret | quote }}
      key: key
{{ end -}}
{{ end -}}
