pages << {
    url: "https://www.youtube.com/playlist?list=PLWdN67pbVPSm2tixoc-mqBSGaaEsIB1Rg",
    page_type: "listing",
    fetch_type: "browser",
    headers:{
        "accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "accept-encoding" => "gzip, deflate, br",
        "accept-language" => "en-US,en;q=0.9,id;q=0.8",
        "cache-control" => "max-age=0",
        "user-agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36",
        "sec-ch-ua" => '" Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"',
        "sec-ch-ua-arch" => '"x86"',
        "sec-ch-ua-bitness" => '"64"',
        "sec-ch-ua-full-version" => '"98.0.4758.102"',
        "sec-ch-ua-full-version-list" => '" Not A;Brand";v="99.0.0.0", "Chromium";v="98.0.4758.102", "Google Chrome";v="98.0.4758.102"'
    },
    driver: {
        code: "
            await page.waitForSelector('#stats .yt-formatted-string');
            total_videos = await page.$('#stats .yt-formatted-string');
            total_videos = await total_videos.evaluate(el => el.textContent);
            total_videos = total_videos.replace(',','');
            total = Number(total_videos);
            page_number = Math.round(total);
            console.log(page);
            for(let i=0; i<page_number; i++){
                await page.keyboard.press('End');
            }
        "
    }
}