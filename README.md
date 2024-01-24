# README
Code challenge requirements: https://github.com/convictional/engineering-interview
## Install
**Docker**
 * I created the image on my local Linux/Ubuntu machine, but I believe it should work on MacOS as well
 * Clone repo `git@github.com:matthewsalan/convictional-work-challenge-1.git`
 * Build image `sudo docker build --tag convictional-work-challenge-1 .`
 * Run docker image `sudo docker compose up`
 * In another tab, run db schema migrations `sudo docker exec convictional-work-challenge-1-web-1 bin/rails db:migrate`.  The name of the web server may vary slighly, when you run the `docker compose up` commmand, the name of the container to use should be listed.
## Endpoints
* `POST` to `http://0.0.0.0:3000/products` should create Products
* `GET` to `http://0.0.0.0:3000/products` should return all Products
* `GET` to `http://0.0.0.0:3000/products/id` should return a single product with variants and image urls of the variants
* `GET` to `http://0.0.0.0:3000/store/inventory` should return inventory stock status for each product/variant
## Methodology
I attempted to map the request body params to the API spec. Fields not listed in the API spec, `published_at` and `tags` for example, were ignored.  Other fields
that I thought were a part of the API spec, like image `src`, were aliased to match the db schema/API spec and stored.  Some fields, `code` for example, are listed
in the API spec but no corresponding field matched in the example [json file](https://my-json-server.typicode.com/convictional/engineering-interview-api/products),
so I aliased the product id to it so that field woudln't be an empty string in the response body.
## Possible Future Refactors
For this exercise, I have some code that handles the POST request body params in the controller itself, but it could be refactored to be more robust to account for various vendors and
their data models.  I did a similar thing for the HubSpot integration I built, [LeadJar](https://leadjar.app/), where I have different services to handle requests from HubSpot, Stripe, Google, etc. 
