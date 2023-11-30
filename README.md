# README

## This is a Webpage Fetcher assignment program

**The code fetching the pages is found here:**

/lib/tasks/fetch_pages.rake

https://github.com/martinikei/webpagefetcher/blob/main/lib/tasks/fetch_pages.rake

**The model of the webpage is found here:**

/app/models/web_page.rb

https://github.com/martinikei/webpagefetcher/blob/main/app/models/web_page.rb

**You can use it with this command:**

`rails fetch_pages:fetch URLS="https://example.com/,https://kwejk.pl"`

**Also, you can run it as a Docker container. Build it this way:**

Navigate to the directory and then run:

`docker build -t webpagefetcher .`

**Then you can run this from your container using this:**

`docker run --rm webpagefetcher rails fetch_pages:fetch URLS="https://example.com/,https://example.com""`

## Pages known to save well:
1.  https://example.com
2.  https://kwejk.pl
3.  https://imgur.com

## Known issues:
1.  Program sometimes has issues with saving certain websites, especially when assets are stored in subfolders. Pages save successfully, but they don't display correctly. I would add a script that recognises these subfolders then creates them accordingly. Example websites: https://www.city.abashiri.hokkaido.jp
2.  If the website is large e.g. https://www.yodobashi.com/, program will timeout. Time extension is needed or perhaps running the script as a background job/worker instead.
3.  Program has a problem with recognising images saved as e.g. data:image/bmp;base64,Qk32BAAAA... . Appropriate recognition script is needed
   


