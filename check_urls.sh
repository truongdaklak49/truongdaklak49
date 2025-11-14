#!/bin/bash
while IFS= read -r url; do
  curl -o /dev/null --silent --head --write-out "%{http_code} %{url_effective}\n" "$url"
done < filtered_urls.txt > url_statuses.txt
