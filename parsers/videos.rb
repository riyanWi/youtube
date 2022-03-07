html = Nokogiri.HTML(content)

video = {}

video['title'] = html.at_css('h1.title .ytd-video-primary-info-renderer').text.strip
video['thumbnail'] = page['vars']['img_url']

view = html.at_css('span.view-count')
video['view'] = view ? view.text.strip.gsub(/[,.a-zA-Z]/,'').to_i : 0

like = html.at_css('#text.style-scope.ytd-toggle-button-renderer.style-text')
video['like'] = like ? like.text.strip.gsub(/[,.a-zA-Z]/,'').to_i : 0

dislike = html.css('#text.style-scope.ytd-toggle-button-renderer.style-text[2]')
video['dislike'] = dislike ? dislike.text.strip.gsub(/[,.a-zA-Z]/,'').to_i : 0

video['channel_name'] = html.at_css('div.ytd-channel-name a').text.strip

video['description'] = html.at_css('div#description').text.strip

video['_collection'] = "videos"

outputs << video


