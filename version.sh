current_version=$(awk '/version:/ {print $2}' charts/standard-app/Chart.yaml)
increment_version="0.1.0"
IFS='.' read -ra current_parts <<< "$current_version"
IFS='.' read -ra increment_parts <<< "$increment_version"

first=$((current_parts[0] + increment_parts[0]))
second=$((current_parts[1] + increment_parts[1]))
third=$((current_parts[2] + increment_parts[2]))

new_version="$first.$second.$third"
echo $new_version

sed "s/version:.*/version: $new_version/" charts/standard-app/Chart.yaml > tmpfile
mv tmpfile charts/standard-app/Chart.yaml
cat charts/standard-app/Chart.yaml

helm package charts/standard-app
mv "standard-app-$new_version.tgz" ./charts/standard-app

helm repo index --url https://julinux-io.github.io/standard-app/charts/standard-app charts/standard-app/
mv charts/standard-app/index.yaml .
