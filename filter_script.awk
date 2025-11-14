/^#EXTINF/ {
    context = $0
    while (getline > 0) {
        if ($0 ~ /^http/ || $0 ~ /^udp/ || $0 ~ /^rtsp/) {
            url = $0
            # Rule 1 & 2: .m3u8 or MBC
            if (url ~ /\.m3u8/ || context ~ /MBC/) {
                # Rule 3: no is.gd, unless it's MBC
                if (url !~ /is\.gd/ || context ~ /MBC/) {
                    print url
                }
            }
            break # Move to next #EXTINF
        } else {
            # Append non-url lines to context
            context = context "\n" $0
        }
    }
}
