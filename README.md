# wp-scan-slack
A simple way to send the security warnings from dump log of WP-Scan to your slack channel.

Requires:Slack <b>Incoming WebHooks Integration</b> configured in a channel.<br>
Requires:WP-Scan configured and working in your machine<br>

For use this shell script you first need configure the "app.conf" with your personal data.<br>
Example:<br>
export bot_user_name=SomeBOTname<br>
export bot_avatar=https://example.com/some_picture.jpg<br>
export slack_web_hook_url=https://hooks.slack.com/services/someToken<br>

And you need set the absolute path of your wpscan.rb file<br>
export wp_scan_path=/usr/share/wpscan/wpscan.rb<br>

<h2>Using the Shell Sript</h2>
Run the script is easy as it was set it, you can enter in the folder and type on the command line:<br>
<b>./scan.sh</b> 'http://example.com'<br>
where 'http://example.com' is your WordPress target WebSite

there are unlimited uses for this script, you can put in a cron for example, and every week all warnings of your web site is sent to you
