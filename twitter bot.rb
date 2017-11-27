

require 'Twitter' 
while true
    begin
        config = {
            consumer_key:        '',
            consumer_secret:     '',
            access_token:        '',
            access_token_secret: ''
        }
        rClient = Twitter::REST::Client.new config
        sClient = Twitter::Streaming::Client.new(config)

        topics = ['#nike', '#run', '#marathon', '#runing']
        sClient.filter(:track => topics.join(',')) do |tweet|
            if tweet.is_a?(Twitter::Tweet)
              puts tweet.text 
              rClient.fav tweet
              rClient.update_with_media("@#{tweet.user.screen_name} Bénéficiez d'une offre exeptionnelle grace à Nike! Obtenez jusqu'à -20% de reduction en vous connectant sur http://www.sarenza.com/store/product/search/list/view?origin=s&search=nike&gclid=CjwKCAiAxuTQBRBmEiwAAkFF1pEZxZDqXentkaGQcrIt9piN1Z9nrXRnpOrx4j9z58GFFu7hAL93jxoCs7AQAvD_BwE#ectrans=1" , File.new("/Users/apple/Downloads/photo.jpeg"))
              sleep 900
            end
        end
    rescue
        puts 'error occurred, waiting for 5 seconds'
        sleep 5
    end

end