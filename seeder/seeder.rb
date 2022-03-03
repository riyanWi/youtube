pages << {
    url: "https://www.youtube.com/playlist?list=PLWdN67pbVPSm2tixoc-mqBSGaaEsIB1Rg",
    page_type: "listing",
    fetch_type: "browser",
    driver: {
        code: "
            await page.waitForSelector('#stats .yt-formatted-string');
            total_videos = await page.$('#stats .yt-formatted-string');
            total_videos = await total_videos[0].evaluate(el => el.textContent);
            total_videos = total_videos.replace(',','');
            total = Number(total_videos);
            page = Math.round(total);
            for(let i=0; i<page; i++){
                await page.keyboard.press('end');
            }
        "
    }
}