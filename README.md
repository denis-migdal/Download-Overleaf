# Download-Overleaf
Enables you to download your Overleaf project (You need a paid account).


## Follow thoses easy steps:

1. Log to your paid Overleaf account.
2. In the homepage, write `JSON.parse( $('meta[name="ol-projects"]').attr('content') );` in the browser's console (Ctrl+Maj+K in Firefox).
3. Save the content (right-click -> copy object) in a file named data.json
4. Run the script in the same dir ./update.sh
