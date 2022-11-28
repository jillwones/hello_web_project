# GET /names Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

HTTP method: GET
The path: /names
Query parameters: names: Julia, Mary, Karim
Body parameters: N/A

## 2. Design the Response

When query param `names` is `Julia, Mary, Karim`
```
Julia, Mary, Karim
```

## 3. Write Examples

# Request:

GET /names?names=Julia, Mary, Karim

# Expected response:

```
Julia, Mary, Karim
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns the names' do
      response = get('/names?names=Julia, Mary, Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end

    it 'returns the names' do
      response = get('/names?names=Bob, Jill, Kayleigh')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Bob, Jill, Kayleigh')
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.