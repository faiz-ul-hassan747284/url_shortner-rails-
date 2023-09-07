# Url Shortner
To setup copy `env.sample` and replace it with your DB credentials and save it as `.env`

After that run
```
bundle install
rails db:create
rails db:migrate
```
After migrations are successfully executed run
```
rails s
```
for starting the server
After starting the server you can use the following services
## Url Scheme
### List all Shortened URL
- **Endpoint**: `/urls`
- **HTTP Method**: GET
- **Description**: Retrieves a list of all shortened URLs.
- **Controller Action**: `urls#index`

### Create a Shortened URL

- **Endpoint**: `/urls`
- **HTTP Method**: POST
- **Description**: Creates a new shortened URL.
- **Controller Action**: `urls#create`
Payload
```
{
	"url": {
		"url": "https:coolwebsite.com"
	}
}
```

### Use Shortened URL

- **Endpoint**: `/urls/:shortened_url`
- **HTTP Method**: GET
- **Description**: Retrieves details of a specific shortened URL.
- **Controller Action**: `urls#show`
### Get Metrics

- **Endpoint**: `/urls/metrics`
- **HTTP Method**: GET
- **Description**: Retrieves details of a specific shortened URL.
- **Controller Action**: `urls#show`