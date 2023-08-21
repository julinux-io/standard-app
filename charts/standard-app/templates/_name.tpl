{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "util.v1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "util.v1.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a short name based only on the release name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "util.v1.shortname" -}}
{{- $name := default .Release.Name .Values.nameOverride -}}
{{- trunc 63 $name | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a name depending on settings.
*/}}
{{- define "util.v1.autoname" -}}
{{- $style := .Values.autonameStyle | default "short" -}}
{{- if eq $style "short" -}}
{{- include "util.v1.shortname" . -}}
{{- else if eq $style "full" -}}
{{- include "util.v1.fullname" . -}}
{{- else -}}
{{- required "Unknown autonameStyle" "" -}}
{{- end -}}
{{- end -}}
