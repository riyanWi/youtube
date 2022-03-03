html = Nokogiri.HTML(content)

videos = html.css('#content #container.ytd-playlist-video-renderer')

videos.each do |video|

    url = video.at_css('a#thumbnail')['href']
    img_url = video.at_css('img#img')['src']
    
    pages << {
        page_type: "videos",
        url:url,
        fetch_type: "browsers",
        vars: {
            img_url: img_url
        }
    }
end