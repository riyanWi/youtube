html = Nokogiri.HTML(content)

videos = html.css('#content #container.ytd-playlist-video-renderer')

videos.each do |video|

    url = video.at_css('a#thumbnail')['href']
    img_url = video.at_css('img#img')['src']
    fullurl =  "https://www.youtube.com#{url}"
    pages << {
        page_type: "videos",
        url:fullurl,
        fetch_type: "browser",
        vars: {
            img_url: img_url
        }
    }
end