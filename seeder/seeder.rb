pages << {
    url: "https://www.youtube.com/playlist?list=PLWdN67pbVPSm2tixoc-mqBSGaaEsIB1Rg",
    fetch_type: "browser",
    driver: {
        code: "
            total_videos = await page.$x('//*[@id=\"stats\"]/yt-formatted-string[1]/span[1]')[0].getProperty('textContent');
            total_videos = total_videos.replace(',','');
            total = Number(total_videos);
            page = Math.round(total);
            for(let i=0; i<page; i++){
                await page.keyboard.press('end');
            }
        "
    }
}