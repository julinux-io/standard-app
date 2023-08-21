{{/* vim: set filetype=mustache: */}}

{{/*
Output simple environment variable list.
*/}}
{{- define "util.v1.env_list" -}}
{{- range $name, $value := . }}
- name: {{ $name | quote }}
  value: {{ $value | quote }}
{{- end }}
{{- end -}}

{{/*
Output environment variable list map entry.
*/}}
{{- define "util.v1.env.inject" -}}
{{- if or .envVars .envVarsRaw }}
env:
{{- include "util.v1.env_list" .Values.envVars | indent 2 }}
{{ if .Values.envVarsRaw }}{{ toYaml .Values.envVarsRaw | indent 2 }}{{ end }}
{{ end}}
{{- end -}}
