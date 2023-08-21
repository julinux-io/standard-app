{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the log volume.
*/}}
{{- define "util.v1.logwatch.name" -}}
log-{{ . }}
{{- end -}}

{{/*
Outputs single logwatch container.
Parameters are:
- file - The file path, relative to the volume root, to watch
- name - The name of the file (excluding extension), used to name the logwatch container
- group - The name of the log group. Used to determine the volume and container names.
*/}}
{{- define "util.v1.logwatch.container" -}}
- env:
  - name: LOGWATCH_FILE
    value: /mnt/logs/{{ .file }}
  image: neighborhoods/logwatcher:1.0.0
  name: log-{{ .group }}-{{ .name }}
  resources:
    requests:
      cpu: 10m
      memory: 10Mi
    limits:
      cpu: 10m
      memory: 10Mi
  volumeMounts:
  - mountPath: /mnt/logs
    name: log-{{ .group }}
{{- end -}}

{{/*
Output list of logwatch containers.
*/}}
{{- define "util.v1.logwatch.container_list" -}}
{{- range $group, $files := . -}}
{{- range $name, $file := $files -}}
{{- if kindIs "int" $name -}}
{{- $strName := toString $name -}}
{{- $logName := trimSuffix (base $file | ext) $file | lower -}}
{{- $logContainerOptions := dict "group" $group "name" $logName "file" $file -}}
{{ include "util.v1.logwatch.container" $logContainerOptions }}
{{ else -}}
{{- $logContainerOptions := dict "group" $group "name" $name "file" $file -}}
{{ include "util.v1.logwatch.container" $logContainerOptions }}
{{ end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Output init container.
*/}}
{{- define "util.v1.logwatch.container_init" -}}
- command:
  - chmod
  - a+rwx
  - /mnt/logs
  image: neighborhoods/logwatcher:1.0.0
  name: init-log-{{ . }}
  resources:
    requests:
      cpu: 50m
      memory: 10Mi
    limits:
      cpu: 50m
      memory: 10Mi
  volumeMounts:
  - mountPath: /mnt/logs
    name: log-{{ . }}
{{- end -}}

{{/*
Output init container.
*/}}
{{- define "util.v1.logwatch.container_init_list" -}}
{{- range $group, $files := . -}}
{{ include "util.v1.logwatch.container_init" $group }}
{{ end -}}
{{- end -}}

{{/*
Output volume list.
*/}}
{{- define "util.v1.logwatch.volume_list" -}}
{{- range $group, $files := . -}}
- name: log-{{ $group }}
  emptyDir: {}
{{ end -}}
{{- end -}}
